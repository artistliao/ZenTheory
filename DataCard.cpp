#include "stdafx.h"
#include "ZenTheory.h"
#include "DataCard.h"
#include "Utils.h"
#include "MACD.h"
#include "Merge.h"
#include "Typing.h"
#include "Stroke.h"
#include "LineSegment.h"
#include "TrendCentralAndType.h"
#include "Divergence.h"


DataCard::DataCard()
{

}

DataCard::~DataCard()
{

}

int DataCard::ReadOriginKlineDataFromFile(const string& dir) {
    SPDLOG_INFO("ReadOriginKlineDataFromFile start! dir:{}", dir);
    ZenTheory* ns = ZenTheory::get_instance();

	vector<string> oriFiles;
	vector<string> oriDirs;
	int iRet = Utils::TraverseCurrentDir(dir, oriFiles, oriDirs);
	if (iRet < 0) {
		SPDLOG_WARN("TraverseCurrentDir failed! iRet:{}", iRet);
		return iRet;
	}

    for (auto& filename : oriFiles) {
        SPDLOG_INFO("ReadOriginKlineDataFromFile filename:{}", filename);
        size_t iPos1 = filename.find("#");
        size_t iPos2 = filename.find(".txt");
        if (iPos1 == string::npos || iPos2 == string::npos) {
            SPDLOG_WARN("error filename:{}", filename);
            continue;
        }
        string code = filename.substr(0, 2) + filename.substr(iPos1+1, iPos2-iPos1-1);

        string fullpath = dir + filename;
        ifstream klineFile(fullpath.c_str(), ios::in);
        if (!klineFile) {
            SPDLOG_WARN("ifstream failed! fullpath:{}", fullpath);
            continue;
        }

        string line;
        string strDate;
        string strHourMin;
        int idx = -1;
        //vector<KlineData*> vec_kline_data;
        while (getline(klineFile, line)) // line中不包括每行的换行符
        {
            if (line.find("20") != 0) {
                continue;
            }

            istringstream iline(line);
            //KlineData* pKline = reinterpret_cast<KlineData*>(allocate_aligned(sizeof(KlineData)));
            KlineData* pKline = new KlineData;
            iline >> strDate >> strHourMin >> pKline->open >> pKline->high >> pKline->low >> pKline->close >> pKline->vol >> pKline->amount;
            if (Utils::DoubleCmp(pKline->low, pKline->high) > 0) {
                SPDLOG_WARN("error kline data, line:{}", line);
                continue;
            }

            replace_all(strDate, "/", "");
            replace_all(strDate, "-", "");
            strHourMin.append("00");
            strDate.append(strHourMin);
            pKline->endtime = strtoull(strDate.c_str(), NULL, 10);
            int32_t endTs = Utils::IntTimeToTs(pKline->endtime);
            pKline->starttime = Utils::TsToIntTime(endTs-60);
            
            idx++;
            pKline->index = idx;
            ns->OriKlines[code]["1min"].push_back(pKline);
        }

        SPDLOG_INFO("ReadOriginKlineDataFromFile code:{}, size:{}", code, ns->OriKlines[code].size());
        klineFile.close();
    }

    SPDLOG_INFO("ReadOriginKlineDataFromFile end!");
	return 0;
}

//从数据库中读取原始Kline数据；参数：securitiesType:证券类型，securitiesCode:stock code，period:kline周期；返回值：0:成功, <0:错误
int32_t DataCard::ReadOriginKlineDataFromDb(const string& securitiesType, const string& securitiesCode, const string& period, int32_t start_ts) {
    SPDLOG_INFO("ReadOriginKlineDataFromDb start! securitiesType:{}, securitiesCode:{}, period:{}, start_ts:{}", securitiesType, securitiesCode, period, start_ts);
    ZenTheory* ns = ZenTheory::get_instance();

    string dbName;
    if (securitiesType == "stock") {
        dbName = "gp";
    } else if (securitiesType == "index") {
        dbName = "idx";
    } else if (securitiesType == "futures") {
        dbName = "futures";
    }

    int32_t period_seconds = ns->m_period_lengths[period];
    Securities* pSecurities = NULL;
    if (securitiesType == "stock") {
        auto mscim_iter = ns->m_stock_code_map.find(securitiesCode);
        if (mscim_iter == ns->m_stock_code_map.end()) {
            SPDLOG_WARN("m_stock_code_map not find securitiesCode:{}", securitiesCode);
            return -1;
        }

        pSecurities = mscim_iter->second;
    }
    else if (securitiesType == "index") {
        auto mscim_iter = ns->m_index_code_map.find(securitiesCode);
        if (mscim_iter == ns->m_index_code_map.end()) {
            SPDLOG_WARN("m_index_code_map not find securitiesCode:{}", securitiesCode);
            return -1;
        }

        pSecurities = mscim_iter->second;
    }
    else if (securitiesType == "futures") {
        auto mscim_iter = ns->m_futures_code_map.find(securitiesCode);
        if (mscim_iter == ns->m_futures_code_map.end()) {
            SPDLOG_WARN("m_futures_code_map not find securitiesCode:{}", securitiesCode);
            return -1;
        }

        pSecurities = mscim_iter->second;
    }

    if (!pSecurities) {
        SPDLOG_WARN("pSecurities is NULL! securitiesCode:{}", securitiesCode);
        return -5;
    }

    size_t iPos = securitiesCode.find(".");
    if (iPos == string::npos) {
        SPDLOG_WARN("error securitiesCode:{}", securitiesCode);
        return -2;
    }

    string stockCodeSuffix = securitiesCode.substr(iPos - 2, 2);
    string tableName = period + "_prices_" + stockCodeSuffix;
    if (securitiesType == "futures") {
        stockCodeSuffix = securitiesCode.substr(0, 2);
        tableName = period + "_prices_" + stockCodeSuffix;
        transform(tableName.begin(), tableName.end(), tableName.begin(), tolower);
    }

    char buffer[512] = { 0 };
    try
    {
        //查询1min_prices_xx表
        snprintf(buffer, sizeof(buffer), "SELECT id, ts, open, high, low, close, volume, money FROM %s.%s WHERE gp_id=%d AND ts>=%d ORDER BY ts ASC",
            dbName.c_str(), tableName.c_str(), pSecurities->gp_id, start_ts);
        SPDLOG_DEBUG("sql:{}", buffer);

        otl_stream os1(1000, buffer, ns->get_otl_connect());
        int32_t iId = 0;
        int32_t count = 0;
        int idx = -1;
        double volume = 0.0;
        while (!os1.eof())
        {
            KlineData* pKline = new KlineData;
            os1 >> iId >> pKline->starttime >> pKline->open >> pKline->high >> pKline->low >> pKline->close >> volume >> pKline->amount ;
            pKline->vol = int64_t(volume);

            if (Utils::DoubleCmp(pKline->low, pKline->high) > 0) {
                SPDLOG_WARN("error kline data, id:{}, gp_id:{}", iId, pSecurities->gp_id);
                continue;
            }

            pKline->endtime = Utils::TsToIntTime(pKline->starttime + period_seconds);
            pKline->starttime = Utils::TsToIntTime(pKline->starttime);
            pKline->divergence = NO_DIVERGENCE;
            idx++;
            pKline->index = idx;
            ns->OriKlines[securitiesCode][period].push_back(pKline);
        }

        SPDLOG_INFO("ReadOriginKlineDataFromDb code:{}, period:{}, size:{}", securitiesCode, period, ns->OriKlines[securitiesCode][period].size());
    }
    catch (otl_exception& p) {
        cerr << "msg: " << p.msg << endl; // print out error message
        cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
        cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
        cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
        ns->analyse_sql_state(p.sqlstate);
        SPDLOG_ERROR("query tableName:{} response msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", tableName, p.msg, p.stm_text, p.sqlstate, p.var_info);
        return -3;
    }

    SPDLOG_INFO("ReadOriginKlineDataFromDb end!");
    return 0;
}

int32_t DataCard::ReadFuturesTickData(const string& futures_name, const string& dir, vector<TickPrice*> &tickDatas) {
    SPDLOG_INFO("ReadFuturesTickData start! futures_name:{}, dir:{}", futures_name, dir);
    ZenTheory* ns = ZenTheory::get_instance();

    vector<string> oriFiles;
    vector<string> oriDirs;
    int iRet = Utils::TraverseCurrentDir(dir, oriFiles, oriDirs);
    if (iRet < 0) {
        SPDLOG_WARN("TraverseCurrentDir failed! iRet:{}", iRet);
        return iRet;
    }

    vector<string> allFiles;
    for (auto& oneDir : oriDirs) {
        size_t iPos1 = oneDir.find(futures_name);
        if (iPos1 == string::npos) {
            continue;
        }

        vector<string> ftFiles;
        vector<string> ftDirs;
        iRet = Utils::TraverseCurrentDir(dir+"\\"+oneDir, ftFiles, ftDirs);
        if (iRet < 0) {
            SPDLOG_WARN("TraverseCurrentDir failed! iRet:{}", iRet);
            return iRet;
        }
        for (auto& ftFile : ftFiles) {
            if (ftFile.find(futures_name + "主力连续") != string::npos)
            {
                string fullpath = dir + "\\" + oneDir + "\\" + ftFile;
                allFiles.push_back(fullpath);
            }
        }
    }

    int32_t file_count = 0;
    for (auto& fullpath : allFiles) {
        SPDLOG_INFO("ReadFuturesTickData fullpath:{}", fullpath);
        ifstream tickFile(fullpath.c_str(), ios::in);
        if (!tickFile) {
            SPDLOG_WARN("ifstream failed! fullpath:{}", fullpath);
            continue;
        }

        string line;
        int idx = -1;
        while (getline(tickFile, line)) // line中不包括每行的换行符
        {
            idx++;
            if (idx == 0) {
                continue;
            }

            vector<string> vec_ticks;
            Utils::StringSplit(line, vec_ticks, ",", false);
            TickPrice* pPrice = new TickPrice;
            pPrice->price = atoi(vec_ticks[4].c_str());
            //pPrice->tick_time = int64_t(atoi(vec_ticks[0].c_str()));
            pPrice->tick_time = strtoull(vec_ticks[0].c_str(), NULL, 10);
            pPrice->tick_time *= 1000000000;
            string strTime = vec_ticks[20];
            replace_all(strTime, ":", "");
            pPrice->tick_time += strtoull(strTime.c_str(), NULL, 10)*1000;
            pPrice->tick_time += strtoull(vec_ticks[21].c_str(), NULL, 10);

            tickDatas.push_back(pPrice);
        }
        tickFile.close();
        SPDLOG_INFO("ReadFuturesTickData futures_name:{}, size:{}", futures_name, tickDatas.size());
        file_count++;
        if (file_count == 22) {
            break;
        }
    }

    SPDLOG_INFO("ReadFuturesTickData futures_name:{}, all size:{}", futures_name, tickDatas.size());
    return 0;
}

int32_t DataCard::InserKlineData(const string& code, const string& period, KlineData* pNewKline) {
    if (!pNewKline) {
        SPDLOG_WARN("pNewKline is NULL!");
        return -1;
    }

    ZenTheory* ns = ZenTheory::get_instance();
    auto pTM = ns->TaskManages[code];
    std::lock_guard<std::mutex> lck(*(pTM->th_mutex));
    //pTM->th_mutex->lock();
    //SPDLOG_WARN("mutex lock");

    vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
    KlineData* pKline = oriKlines.back();
    int32_t kline_ts = Utils::IntTimeToTs(pKline->starttime);
    int32_t ins_kline_ts = Utils::IntTimeToTs(pNewKline->starttime);
    if (kline_ts == ins_kline_ts) {
        pKline->open = pKline->open;
        pKline->high = pKline->high;
        pKline->low = pKline->low;
        pKline->close = pKline->close;
        pKline->vol = pKline->vol;
        pKline->amount = pKline->amount;
        pTM->update = true;
        //SPDLOG_INFO("Update Kline code:{}, starttime:{}", code, pKline->starttime);
        return 0;
    }

    bool bContinue = ns->JudgeContinueKlines(code, kline_ts, ins_kline_ts);
    if (bContinue) {
        pNewKline->index = pKline->index + 1;
        oriKlines.push_back(pNewKline);
        pTM->update = true;
        SPDLOG_INFO("Insert Kline code:{}, starttime:{}", code, pNewKline->starttime);
    }
    else {
        //pTM->th_mutex->unlock();
        //SPDLOG_WARN("mutex unlock");
        return -2;
    }

    //pTM->th_mutex->unlock();
    //SPDLOG_WARN("mutex unlock");
    return 0;
}


int32_t DataCard::ReadLineSegmentFromFile(const string& code, const string& filePath) {
    SPDLOG_INFO("ReadLineSegmentFromFile start! filePath:{}", filePath);
    ZenTheory* ns = ZenTheory::get_instance();
 
    ifstream klineFile(filePath.c_str(), ios::in);
    if (!klineFile) {
        SPDLOG_WARN("ifstream failed! filePath:{}", filePath);
        return -1;
    }

    string line;
    int32_t direction = 0;
    while (getline(klineFile, line)) // line中不包括每行的换行符
    {
        istringstream iline(line);

        LineSegmentData* pLine = new LineSegmentData;
        iline >> pLine->index >> pLine->starttime >> pLine->endtime >> pLine->start_stroke_idx >> pLine->end_stroke_idx >> pLine->vol 
            >> direction >> pLine->count >> pLine->high >> pLine->low >> pLine->amount;

        pLine->direction = direction;
        ns->OldLineSegments[code]["1min"].push_back(pLine);
    }
    klineFile.close();

    SPDLOG_INFO("ReadLineSegmentFromFile code:{}, size:{}", code, ns->OldLineSegments[code].size());
    return 0;
}

//合并kline
int32_t DataCard::MergeOriginKlineData() {
    SPDLOG_INFO("MergeOriginKlineData start!");
    ZenTheory* ns = ZenTheory::get_instance();

    int32_t iRet = 0;
    Merge<KlineMergeData, KlineData> merge;
    for (auto& oriKlineData : ns->OriKlines) {
        string code = oriKlineData.first;
        auto& oriKline = oriKlineData.second;
        for (auto& periodKline : oriKline) {
            vector<KlineData*>& vecKlineData = periodKline.second;
            vector<KlineMergeData*> vecMergeKlineData;
            iRet = merge.MergeKline(vecKlineData, vecMergeKlineData);
            SPDLOG_INFO("code:{}, period:{}, vecKlineData.size():{}, vecMergeKlineData.size():{}, iRet:{}", code, periodKline.first, vecKlineData.size(), vecMergeKlineData.size(), iRet);
            ns->MergeKlines[code][periodKline.first] = vecMergeKlineData;
        }
    }

    SPDLOG_INFO("MergeOriginKlineData end!");
    return 0;
}


//计算MACD
int32_t DataCard::CalcMACDForOriKlines() {
    SPDLOG_INFO("CalcMACDForOriKlines start!");
    ZenTheory* ns = ZenTheory::get_instance();

    int32_t iRet = 0;
    MACD<KlineData> macd;
    for (auto& oriKlineData : ns->OriKlines) {
        string code = oriKlineData.first;
        auto& oriKline = oriKlineData.second;
        for (auto& periodKline : oriKline) {
            vector<KlineData*>& vecKlineData = periodKline.second;
            iRet = macd.CalcMACD(vecKlineData);
            SPDLOG_INFO("code:{}, period:{}, vecKlineData.size():{}, CalcMACD iRet:{}", code, periodKline.first, vecKlineData.size(), iRet);
        }
    }

    SPDLOG_INFO("CalcMACDForOriKlines end!");
    return 0;
}

//对合并后的kline数据进行分型
int32_t DataCard::TypingMergeKlineData() {
    ZenTheory* ns = ZenTheory::get_instance();

    Typing<KlineMergeData> typing;
    int32_t count = 0;
    for (auto& mergeKlineData : ns->MergeKlines) {
        string code = mergeKlineData.first;
        auto & mergeKline = mergeKlineData.second;
        for (auto& periodKline : mergeKline) {
            vector<KlineMergeData*>& vecMergeKlineData = periodKline.second;
            count = typing.FindoutAndMarkTyping(vecMergeKlineData);
            SPDLOG_INFO("TypingMergeKlineData code:{}, period:{}, count:{}", code, periodKline.first, count);
        }
    }

    SPDLOG_INFO("TypingMergeKlineData end!");
    return 0;
}

//将分型后的合并kline数据以文本格式写入文件
int32_t DataCard::WriteTypingMergeKlineData(const string& dir) {
    SPDLOG_INFO("WriteTypingMergeKlineData start!");
    ZenTheory* ns = ZenTheory::get_instance();

    try {
        for (auto& mergeKlineData : ns->MergeKlines) {
            string code = mergeKlineData.first;
            bool bWrite = JudgeWrite(code);
            if (!bWrite) {
                continue;
            }
            //int32_t now_ts = int32_t(time(NULL));
            //int32_t write_time = 0;
            //auto wdt_iter = ns->WriteDataTs.find(code);
            //if (wdt_iter == ns->WriteDataTs.end()) {
            //    write_time = -1;
            //}
            //else {
            //    write_time = wdt_iter->second;
            //}

            //if ((now_ts - write_time) < 600) {
            //    continue;
            //}
            //
            //ns->WriteDataTs[code] = now_ts;
            

            auto& periodMergeKline = mergeKlineData.second;
            for (auto& periodKline : periodMergeKline) {
                string period = periodKline.first;
                Utils::CheckAndMakeDir(dir + period + "\\merge\\");
                string fullFilepath = dir + period + "\\merge\\" + code + ".txt";
                ofstream outFile(fullFilepath, ios::out | ios::trunc);
                int idx = 0;
                stringstream ss;
                for (auto& oneMergeKlineData : periodKline.second) {
                    // 文本格式写入
                    ss << std::fixed << std::setprecision(2);
                    ss << oneMergeKlineData->index << "\t" << oneMergeKlineData->starttime << "\t" << oneMergeKlineData->endtime << "\t"
                        << oneMergeKlineData->vol << "\t" << int32_t(oneMergeKlineData->direction) << "\t" << int32_t(oneMergeKlineData->typing) << "\t"
                        << oneMergeKlineData->count << "\t"
                        << oneMergeKlineData->high << "\t" << oneMergeKlineData->low << "\t" << oneMergeKlineData->amount;
                    outFile << ss.str() << std::endl;
                    ss.clear();
                    ss.str("");
                }

                outFile.close();
                SPDLOG_INFO("write fullFilepath:{}", fullFilepath);
            }
        }
    }
    catch (std::exception& e)
    {
        cerr << "WriteTypingMergeKlineData exception: " << e.what() << endl;
        SPDLOG_ERROR("WriteTypingMergeKlineData exception:{}", e.what());
        return -1;
    }

    SPDLOG_INFO("WriteTypingMergeKlineData end!");
    return 0;
}


//对分型后的数据进行分B
int32_t DataCard::GenerateStrokeFromTyping() {
    ZenTheory* ns = ZenTheory::get_instance();

    Stroke stroke;
    int32_t iRet = 0;
    for (auto& mergeKlineData : ns->MergeKlines) {
        string code = mergeKlineData.first;
        auto& periodMergeKline = mergeKlineData.second;
        for (auto& periodKline : periodMergeKline) {
            string period = periodKline.first;
            vector<KlineMergeData*> vecMergeKlineData = periodKline.second;
            vector<StrokeData*> strokeDatas;
            iRet = stroke.GenerateStroke(vecMergeKlineData, strokeDatas);
            vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
            stroke.FindStrokeKlineIdx(strokeDatas, oriKlines);
            ns->Strokes[code][period] = strokeDatas;
            SPDLOG_INFO("GenerateStrokeFromTyping code:{}, period:{}, iRet:{}", code, period, iRet);

            double all_len = 0;
            for (auto& pStroke : strokeDatas) {
                int32_t diff = pStroke->end_kline_idx - pStroke->start_kline_idx;
                if (diff < 0) {
                    SPDLOG_WARN("end_kline_idx less than start_kline_idx index:{}", pStroke->index);
                    cout << pStroke->index << endl;
                }

                all_len +=  double(diff);
            }
            SPDLOG_WARN("GenerateStrokeFromTyping code:{}, period:{}, all_len:{}, size:{}", code, period, all_len, strokeDatas.size());
        }
    }

    SPDLOG_INFO("GenerateStrokeFromTyping end!");
    return 0;
}


//将分B后的数据以文本格式写入文件
int32_t DataCard::WriteStrokeData(const string& dir) {
    //SPDLOG_INFO("WriteStrokeData start!");
    ZenTheory* ns = ZenTheory::get_instance();

    try {
        for (auto& stockStrokeData : ns->Strokes) {
            string code = stockStrokeData.first;
            bool bWrite = JudgeWrite(code);
            if (!bWrite) {
                continue;
            }

            auto& periodStrokeData = stockStrokeData.second;
            for (auto& periodStroke : periodStrokeData) {
                string period = periodStroke.first;
                Utils::CheckAndMakeDir(dir + period + "\\stroke\\");
                string fullFilepath = dir + period + "\\stroke\\" + code + ".txt";
                ofstream outFile(fullFilepath, ios::out | ios::trunc);
                int idx = 0;
                stringstream ss;
                for (auto& oneStrokeData : periodStroke.second) {
                    // 文本格式写入
                    ss << std::fixed << std::setprecision(2);
                    ss << oneStrokeData->index << "\t" << oneStrokeData->start_kline_idx << "\t" << oneStrokeData->end_kline_idx << "\t"
                        << oneStrokeData->starttime << "\t" << oneStrokeData->endtime << "\t"
                        << oneStrokeData->vol << "\t" << int32_t(oneStrokeData->direction) << "\t" << oneStrokeData->count << "\t"
                        << oneStrokeData->high << "\t" << oneStrokeData->low << "\t" << oneStrokeData->amount;
                    outFile << ss.str() << std::endl;
                    ss.clear();
                    ss.str("");
                }

                outFile.close();
                SPDLOG_INFO("write fullFilepath:{}", fullFilepath);
            }
            
        }
    }
    catch (std::exception& e)
    {
        cerr << "WriteStrokeData exception: " << e.what() << endl;
        SPDLOG_ERROR("WriteStrokeData exception:{}", e.what());
        return -1;
    }

    //SPDLOG_INFO("WriteStrokeData end!");
    return 0;
}

//对B数据划分L
int32_t DataCard::GenerateLineSegmentFromStroke() {
    ZenTheory* ns = ZenTheory::get_instance();

    LineSegment lineSegment;
    int32_t iRet = 0;
    for (auto& oneStockStroke : ns->Strokes) {
        string code = oneStockStroke.first;
        auto& periodStockStroke = oneStockStroke.second;
        for (auto& periodStroke : periodStockStroke) {
            string period = periodStroke.first;
            vector<StrokeData*> vecStrokeData = periodStroke.second;
            vector<LineSegmentData*> vecLineSegmentData;
            SPDLOG_INFO("GenerateLineSegment start, code:{}, period:{}", code, period);
            iRet = lineSegment.GenerateLineSegment(code, period, vecStrokeData, vecLineSegmentData);
            ns->LineSegments[code][period] = vecLineSegmentData;

            size_t iLineSegmentSize = vecLineSegmentData.size();
            for (size_t i = 1; i < iLineSegmentSize; i++) {
                if (vecLineSegmentData[i]->start_stroke_idx != vecLineSegmentData[i - 1]->end_stroke_idx + 1) {
                    SPDLOG_WARN("code:{}, error line stroke_idx, i:{}", code, i);
                }
            }

            SPDLOG_INFO("GenerateLineSegmentFromStroke code:{}, iRet:{}", code, iRet);
            //for test
            //break;
        }
    }

    SPDLOG_INFO("GenerateLineSegmentFromStroke end!");
    return 0;
}


//将L数据以文本格式写入文件
int32_t DataCard::WriteLineSegment(const string& dir) {
    //SPDLOG_INFO("WriteLineSegment start!");
    ZenTheory* ns = ZenTheory::get_instance();

    try {
        for (auto& lineSegment : ns->LineSegments) {
            string code = lineSegment.first;
            bool bWrite = JudgeWrite(code);
            if (!bWrite) {
                continue;
            }
             
            auto& periodLineSeg = lineSegment.second;
            for (auto& onePeriodLine : periodLineSeg) {
                string period = onePeriodLine.first;
                Utils::CheckAndMakeDir(dir + period + "\\line_segment\\");
                string fullFilepath = dir + period + "\\line_segment\\" + code + ".txt";
                ofstream outFile(fullFilepath, ios::out | ios::trunc);
                int idx = 0;
                stringstream ss;
                for (auto& onelineSegment : onePeriodLine.second) {
                    // 文本格式写入
                    ss << std::fixed << std::setprecision(2);
                    ss << onelineSegment->index << "\t" << onelineSegment->starttime << "\t" << onelineSegment->endtime << "\t"
                        << onelineSegment->start_stroke_idx << "\t" << onelineSegment->end_stroke_idx << "\t"
                        << onelineSegment->vol << "\t" << int32_t(onelineSegment->direction) << "\t" << onelineSegment->count << "\t"
                        << onelineSegment->high << "\t" << onelineSegment->low << "\t" << onelineSegment->amount;
                    outFile << ss.str() << std::endl;
                    ss.clear();
                    ss.str("");
                }

                outFile.close();
                SPDLOG_INFO("write fullFilepath:{}", fullFilepath);
            }

        }
    }
    catch (std::exception& e)
    {
        cerr << "WriteLineSegment exception: " << e.what() << endl;
        SPDLOG_ERROR("WriteLineSegment exception:{}", e.what());
        return -1;
    }

    //SPDLOG_INFO("WriteLineSegment end!");
    return 0;
}

//从L数据划分TT
int32_t DataCard::DivideTrendCentralFromLineSegment() {
    ZenTheory* ns = ZenTheory::get_instance();

    TrendCentral tc;
    int32_t iRet = 0;
    for (auto& oneStockLine : ns->LineSegments) {
        string code = oneStockLine.first;
 
        auto& periodKlines = oneStockLine.second;
        for (auto& periodKline : periodKlines) {
            string period = periodKline.first;
            vector<LineSegmentData*> vecLineSegmentData = periodKline.second;
            vector<TrendCentralData*> vecTrendCentralData;
            vector<TrendTypeData*> vecTrendTypeData;

            //iRet = tc.DivideTrendCentral(vecLineSegmentData, vecTrendCentralData, vecTrendTypeData);
            ns->TrendCentrals[code][period] = vecTrendCentralData;
            ns->TrendTypes[code][period] = vecTrendTypeData;

            SPDLOG_INFO("DivideTrendCentralFromLineSegment code:{}, iRet:{}", code, iRet);
        }
    }

    SPDLOG_INFO("DivideTrendCentralFromLineSegment end!");
    return 0;
}

//从S数据划分TT
int32_t DataCard::DivideTrendCentralFromStroke() {
    ZenTheory* ns = ZenTheory::get_instance();

    TrendCentral tc;
    int32_t iRet = 0;
    for (auto& oneStockLine : ns->Strokes) {
        string code = oneStockLine.first;

        auto& periodKlines = oneStockLine.second;
        for (auto& periodKline : periodKlines) {
            string period = periodKline.first;
            vector<StrokeData*> vecStrokeData = periodKline.second;
            vector<TrendCentralData*> vecTrendCentralData;
            vector<TrendTypeData*> vecTrendTypeData;

            iRet = tc.DivideTrendCentral(vecStrokeData, vecTrendCentralData, vecTrendTypeData);
            ns->TrendCentrals[code][period] = vecTrendCentralData;
            ns->TrendTypes[code][period] = vecTrendTypeData;

            SPDLOG_INFO("DivideTrendCentralFromStroke code:{}, iRet:{}", code, iRet);
        }
    }

    SPDLOG_INFO("DivideTrendCentralFromStroke end!");
    return 0;
}

// 从TT数据划分TT
int32_t DataCard::DivideTrendTypeFromTrendCentral() {
    ZenTheory* ns = ZenTheory::get_instance();

    TrendType trendType;
    int32_t iRet = 0;
    for (auto& trendCentral : ns->TrendCentrals) {
        string code = trendCentral.first;
        auto& periodTCs = trendCentral.second;
        for (auto& periodTC : periodTCs) {
            string period = periodTC.first;
            vector<TrendCentralData*> vecTrendCentralData = periodTC.second;
            vector<TrendTypeData*> vecTrendTypeData;

            //iRet = trendType.DivideTrendType(vecTrendCentralData, vecTrendTypeData);
            //ns->TrendTypes[code][period] = vecTrendTypeData;

            //size_t iTrendTypeSize = vecTrendTypeData.size();
            //for (size_t i = 1; i < iTrendTypeSize; i++) {
            //    if (vecTrendTypeData[i-1]->end_line_idx != (vecTrendTypeData[i]->start_line_idx+1)) {
            //        SPDLOG_INFO("error trend type i:{}", i);
            //    }
            //}

            SPDLOG_INFO("DivideTrendTypeFromTrendCentral code:{}, period:{}, iRet:{}", code, period, iRet);
        }
        
    }

    SPDLOG_INFO("DivideTrendTypeFromTrendCentral end!");
    return 0;
}


//将TT数据以文本格式写入文件
int32_t DataCard::WriteTrendCentral(const string& dir) {
    //SPDLOG_INFO("WriteTrendCentral start!");
    ZenTheory* ns = ZenTheory::get_instance();

    try {

        for (auto& stockTC : ns->TrendCentrals) {
            string code = stockTC.first;
            bool bWrite = JudgeWrite(code);
            if (!bWrite) {
                continue;
            }

            for (auto& levelTC: stockTC.second) {
                string period = levelTC.first;
                Utils::CheckAndMakeDir(dir + period + "\\trend_central\\");
                string fullFilepath = dir + period + "\\trend_central\\" + code + ".txt";
                ofstream outFile(fullFilepath, ios::out | ios::trunc);
                int idx = 0;
                stringstream ss;
                for (auto& oneTrendCentral : levelTC.second) {
                    // 文本格式写入
                    ss << std::fixed << std::setprecision(2);
                    ss << oneTrendCentral->index << "\t" << oneTrendCentral->start_stroke_idx << "\t" << oneTrendCentral->end_stroke_idx << "\t"
                        << int32_t(oneTrendCentral->trend_type) << "\t" << oneTrendCentral->high << "\t" << oneTrendCentral->low << "\t"
                        << oneTrendCentral->highest << "\t" << oneTrendCentral->lowest;
                    outFile << ss.str() << std::endl;
                    ss.clear();
                    ss.str("");
                }

                outFile.close();
                SPDLOG_INFO("WriteTrendCentral write fullFilepath:{}", fullFilepath);
            }
            
        }
    }
    catch (std::exception& e)
    {
        cerr << "WriteTrendCentral exception: " << e.what() << endl;
        SPDLOG_ERROR("WriteTrendCentral exception:{}", e.what());
        return -1;
    }

    //SPDLOG_INFO("WriteTrendCentral end!");
    return 0;
}


//将TT数据以文本格式写入文件
int32_t DataCard::WriteTrendType(const string& dir) {
    //SPDLOG_INFO("WriteTrendType start!");
    ZenTheory* ns = ZenTheory::get_instance();

    try {
        for (auto& stockTT : ns->TrendTypes) {
            string code = stockTT.first;
            bool bWrite = JudgeWrite(code);
            if (!bWrite) {
                continue;
            }

            for (auto& levelTT : stockTT.second) {
                string period = levelTT.first; 
                Utils::CheckAndMakeDir(dir + period + "\\trend_type\\");
                string fullFilepath = dir + period + "\\trend_type\\" + code + ".txt";

                ofstream outFile(fullFilepath, ios::out | ios::trunc);
                int idx = 0;
                stringstream ss;
                for (auto& oneTrendType : levelTT.second) {
                    // 文本格式写入
                    ss << std::fixed << std::setprecision(2);
                    ss << oneTrendType->index << "\t" << oneTrendType->start_central_idx << "\t" << oneTrendType->end_central_idx << "\t"
                         << int32_t(oneTrendType->type);
                    outFile << ss.str() << std::endl;
                    ss.clear();
                    ss.str("");
                }

                outFile.close();
                SPDLOG_INFO("WriteTrendType write fullFilepath:{}", fullFilepath);
            }
        }
    }
    catch (std::exception& e)
    {
        cerr << "WriteTrendType exception: " << e.what() << endl;
        SPDLOG_ERROR("WriteTrendType exception:{}", e.what());
        return -1;
    }

    //SPDLOG_INFO("WriteTrendType end!");
    return 0;
}


//将order数据以文本格式写入文件
int32_t DataCard::WriteOrder(const string& dir) {
    //SPDLOG_INFO("WriteOrder start!");
    ZenTheory* ns = ZenTheory::get_instance();

    try {
        for (auto& stockOrder : ns->Orders) {
            string code = stockOrder.first;
            bool bWrite = JudgeWrite(code);
            if (!bWrite) {
                continue;
            }

            for (auto& levelOrder : stockOrder.second) {
                string period = levelOrder.first;

                Utils::CheckAndMakeDir(dir + period + "\\order\\" );
                string fullFilepath = dir + period + "\\order\\" + code + ".txt";

                ofstream outFile(fullFilepath, ios::out | ios::trunc);
                int idx = 0;
                stringstream ss;
                for (auto& order : levelOrder.second) {
                    // 文本格式写入
                    ss << std::fixed << std::setprecision(2);
                    ss << order->order_id << "\t" << order->open_trans_time << "\t" << order->open_trans_price << "\t"
                        << order->cover_trans_time << "\t" << order->cover_trans_price << "\t" << order->stop_loss_price << "\t"
                        << order->profit << "\t" << int32_t(order->direction) << "\t" << int32_t(order->open_kline_idx) << "\t" << int32_t(order->cover_kline_idx)
                        << "\t" << int32_t(order->is_open) << "\t" << int32_t(order->is_cover) << "\t" << int32_t(order->open_type) << "\t" << int32_t(order->cover_type);
                    outFile << ss.str() << std::endl;
                    ss.clear();
                    ss.str("");
                }

                outFile.close();
                SPDLOG_INFO("WriteOrder write fullFilepath:{}", fullFilepath);
            }

        }
    }
    catch (std::exception& e)
    {
        cerr << "WriteOrder exception: " << e.what() << endl;
        SPDLOG_ERROR("WriteOrder exception:{}", e.what());
        return -1;
    }

    //SPDLOG_INFO("WriteOrder end!");
    return 0;
}

bool DataCard::JudgeWrite(const string& code) {
    ZenTheory* ns = ZenTheory::get_instance();
    int32_t now_ts = int32_t(time(NULL));
    int32_t write_time = 0;
    auto wdt_iter = ns->WriteDataTs.find(code);
    if (wdt_iter == ns->WriteDataTs.end()) {
        write_time = -1;
    }
    else {
        write_time = wdt_iter->second;
    }

    if ((now_ts - write_time) < WRITE_DATA_INTERVAL) {
        return false;
    }

    ns->WriteDataTs[code] = -1;
    return true;
}


int32_t DataCard::DivergenceHandle() {
    ZenTheory* ns = ZenTheory::get_instance();
    SPDLOG_INFO("DivergenceHandle begin!");

    Divergence dg;
    for (auto& oriKline : ns->OriKlines) {
        string secCode = oriKline.first;
        for (auto& klines : oriKline.second) {
            string period = klines.first;
            dg.DivergenceHandle(secCode, period);
            SPDLOG_DEBUG("Divergence secCode:{}, period:{}", secCode, period);
        }
    }

    SPDLOG_INFO("DivergenceHandle end!");
    return 0;
}

int32_t DataCard::WriteDivergence() {
    ZenTheory* ns = ZenTheory::get_instance();
    SPDLOG_INFO("WriteDivergence begin!");

    int32_t iRet = 0;
    for (auto& oriKline : ns->OriKlines) {
        string securitiesCode = oriKline.first;
        auto code_type = ns->m_trade_code_types.find(securitiesCode);
        if (code_type == ns->m_trade_code_types.end()) {
            SPDLOG_WARN("m_trade_code_types nto find securitiesCode:{}", securitiesCode);
            continue;
        }

        string secType = code_type->second;
        string dbName;
        if (secType == "stock") {
            dbName = "gp";
        }
        else if (secType == "index") {
            dbName = "idx";
        }
        else if (secType == "futures") {
            dbName = "futures";
        }

        Securities* pSecurities = NULL;

        if (secType == "stock") {
            auto mscim_iter = ns->m_stock_code_map.find(securitiesCode);
            if (mscim_iter == ns->m_stock_code_map.end()) {
                SPDLOG_WARN("m_stock_code_map not find securitiesCode:{}", securitiesCode);
                return -1;
            }

            pSecurities = mscim_iter->second;
        }
        else if (secType == "index") {
            auto mscim_iter = ns->m_index_code_map.find(securitiesCode);
            if (mscim_iter == ns->m_index_code_map.end()) {
                SPDLOG_WARN("m_index_code_map not find securitiesCode:{}", securitiesCode);
                return -1;
            }

            pSecurities = mscim_iter->second;
        }
        else if (secType == "futures") {
            auto mscim_iter = ns->m_futures_code_map.find(securitiesCode);
            if (mscim_iter == ns->m_futures_code_map.end()) {
                SPDLOG_WARN("m_futures_code_map not find securitiesCode:{}", securitiesCode);
                return -1;
            }

            pSecurities = mscim_iter->second;
        }


        if (!pSecurities) {
            SPDLOG_WARN("pSecurities is NULL! securitiesCode:{}", securitiesCode);
            return -5;
        }

        size_t iPos = securitiesCode.find(".");
        if (iPos == string::npos) {
            SPDLOG_WARN("error securitiesCode:{}", securitiesCode);
            continue;
        }

        string stockCodeSuffix = securitiesCode.substr(iPos - 2, 2);
        for (auto& klines : oriKline.second) {
            string period = klines.first;
            string tableName = period + "_prices_" + stockCodeSuffix;
            if (secType == "futures") {
                stockCodeSuffix = securitiesCode.substr(0, 2);
                tableName = period + "_prices_" + stockCodeSuffix;
                transform(tableName.begin(), tableName.end(), tableName.begin(), tolower);
            }

            // full update
            SPDLOG_DEBUG("update table:{} all divergence begin", dbName + "." + tableName);
            string allUp = "UPDATE " + dbName + "." + tableName + " SET divergence=0;";
            otl_stream os1(1, allUp.c_str(), ns->get_otl_connect());
            SPDLOG_DEBUG("update table:{} all divergence end", dbName + "." + tableName);
            stringstream ss;
            string strSql;
            int32_t ts = 0;
            int32_t dg_count = 0;
            for (auto& kline : klines.second) {
                if ((kline->divergence == TOP_DIVERGENCE) || (kline->divergence == BOTTOM_DIVERGENCE)) {
                    ts = Utils::IntTimeToTs(kline->starttime);
                    ss.clear();
                    ss.str("");
                    ss << std::fixed << std::setprecision(2);
                    ss << "UPDATE " << dbName << "." << tableName << " SET divergence=" << (int32_t)kline->divergence << " WHERE gp_id=" << pSecurities->gp_id << " AND ts=" << ts;
                    strSql = ss.str();
                    SPDLOG_DEBUG("strSql:{}", strSql);
                    otl_stream os2(1, strSql.c_str(), ns->get_otl_connect());
                    dg_count++;
                }
            }

            SPDLOG_DEBUG("table:{}, dg_count:{}", dbName + "." + tableName, dg_count);
        }
    }

    SPDLOG_INFO("WriteDivergence end!");
    return 0;
}

int32_t DataCard::StatCriticalValues(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();
    vector<KlineData*>& vecKline1Min = ns->OriKlines[code][period];
    int32_t kline_size = vecKline1Min.size();
    double sum1 = 0.0;
    int32_t count1 = 0;
    double sum2 = 0.0;
    int32_t count2 = 0;
    for (int32_t i = 1; i < (kline_size - 2); i++) {
        if ((Utils::DoubleCmp(vecKline1Min[i]->macd, 0.0) > 0 && Utils::DoubleCmp(vecKline1Min[i + 1]->macd, 0.0) < 0) ||
            (Utils::DoubleCmp(vecKline1Min[i]->macd, 0.0) < 0 && Utils::DoubleCmp(vecKline1Min[i + 1]->macd, 0.0) > 0)) {
            sum1 += fabs(vecKline1Min[i]->macd);
            sum1 += fabs(vecKline1Min[i + 1]->macd);
            count1 += 2;

            sum2 += fabs(vecKline1Min[i - 1]->macd);
            sum2 += fabs(vecKline1Min[i]->macd);
            sum2 += fabs(vecKline1Min[i + 1]->macd);
            sum2 += fabs(vecKline1Min[i + 2]->macd);
            count2 += 4;
        }
    }

    if (count1 > 0) {
        cout << "code:" << code << ", period:" << period << ", avg1:" << sum1 / count1 << ", avg2:" << sum2 / count2 << endl;
    }
    
    return 0;
}
