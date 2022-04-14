#include "stdafx.h"
#include "ZenTheory.h"
#include "ZenSchedule.h"
#include "Utils.h"
#include "MACD.h"
#include "Merge.h"
#include "Typing.h"
#include "Stroke.h"
#include "LineSegment.h"
#include "TrendCentralAndType.h"
#include "Divergence.h"
#include "Trade.h"


ZenSchedule::ZenSchedule(map<string, string>& trade_code_types)
{
    m_trade_code_types = trade_code_types;
}

ZenSchedule::~ZenSchedule()
{

}

// 
int32_t ZenSchedule::ReadOriginKlineDataFromDb(const string& securitiesType, const string& securitiesCode, const string& period, int32_t startTs) {
    SPDLOG_INFO("ReadOriginKlineDataFromDb start! securitiesType:{}, securitiesCode:{}, period:{}, startTs:{}", securitiesType, securitiesCode, period, startTs);
    ZenTheory* ns = ZenTheory::get_instance();

    string dbName;
    if (securitiesType == "stock") {
        dbName = "gp";
    }
    else if (securitiesType == "index") {
        dbName = "idx";
    }
    else if (securitiesType == "futures") {
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
            SPDLOG_WARN("m_index_code_map not find securitiesCode:{}", securitiesCode);
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
        //snprintf(buffer, sizeof(buffer), "SELECT id, ts, open, high, low, close, volume, money FROM %s.%s WHERE gp_id=%d AND ts>=%d AND ts<1626364800 ORDER BY ts ASC LIMIT 0, 17000",
        //    dbName.c_str(), tableName.c_str(), pSecurities->gp_id, startTs);
        snprintf(buffer, sizeof(buffer), "SELECT id, ts, open, high, low, close, volume, money FROM %s.%s WHERE gp_id=%d AND ts>=%d ORDER BY ts ASC",
            dbName.c_str(), tableName.c_str(), pSecurities->gp_id, startTs);
        SPDLOG_DEBUG("sql:{}", buffer);

        otl_stream os1(1000, buffer, ns->get_otl_connect());
        int32_t iId = 0;
        int32_t count = 0;
        int idx = -1;
        double volume = 0.0;
        while (!os1.eof())
        {
            KlineData* pKline = new KlineData;
            os1 >> iId >> pKline->starttime >> pKline->open >> pKline->high >> pKline->low >> pKline->close >> volume >> pKline->amount;
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
            //ns->CompOriKlines[securitiesCode][period].push_back(pKline);
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


//合并kline
int32_t ZenSchedule::MergeOriginKlineData(const string& code, const string &period) {
    ZenTheory* ns = ZenTheory::get_instance();

    int32_t iRet = 0;
    Merge<KlineMergeData, KlineData> merge;
    vector<KlineData*>& vecKlineData = ns->OriKlines[code][period];
    vector<KlineMergeData*>& vecMergeKlineData = ns->MergeKlines[code][period];
    iRet = merge.MergeKline(vecKlineData, vecMergeKlineData);
    SPDLOG_INFO("code:{}, period:{}, vecKlineData.size():{}, vecMergeKlineData.size():{}, iRet:{}", code, period, vecKlineData.size(), vecMergeKlineData.size(), iRet);
    return 0;
}

// 
int32_t ZenSchedule::CalcMACDForOriKlines(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();

    int32_t iRet = 0;
    MACD<KlineData> macd;
    vector<KlineData*>& vecKlineData = ns->OriKlines[code][period];
    iRet = macd.CalcMACD(vecKlineData);
    SPDLOG_INFO("code:{}, period:{}, vecKlineData.size():{}, CalcMACD iRet:{}", code, period, vecKlineData.size(), iRet);
    return 0;
}

//对合并后的kline数据进行分型
int32_t ZenSchedule::TypingMergeKlineData(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();

    Typing<KlineMergeData> typing;
    int32_t count = 0;
    vector<KlineMergeData*>& vecMergeKlineData = ns->MergeKlines[code][period];
    count = typing.FindoutAndMarkTyping(vecMergeKlineData);
    SPDLOG_INFO("TypingMergeKlineData code:{}, period:{}, count:{}", code, period, count);

    return 0;
}

//对分型后的数据进行分B
int32_t ZenSchedule::GenerateStrokeFromTyping(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();

    Stroke stroke;
    int32_t iRet = 0;
    vector<KlineMergeData*> &vecMergeKlineData = ns->MergeKlines[code][period];
    vector<StrokeData*> &strokeDatas = ns->Strokes[code][period];
    iRet = stroke.GenerateStroke(vecMergeKlineData, strokeDatas);

    vector<KlineData*> &oriKlines = ns->OriKlines[code][period];
    stroke.FindStrokeKlineIdx(strokeDatas, oriKlines);

    SPDLOG_INFO("GenerateStrokeFromTyping code:{}, period:{}, iRet:{}", code, period, iRet);
    return 0;
}

 
//对B数据划分L
int32_t ZenSchedule::GenerateLineSegmentFromStroke(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();

    LineSegment lineSegment;
    int32_t iRet = 0;
    vector<StrokeData*> &vecStrokeData = ns->Strokes[code][period];
    vector<LineSegmentData*> &vecLineSegmentData = ns->LineSegments[code][period];
    iRet = lineSegment.GenerateLineSegment(code, period, vecStrokeData, vecLineSegmentData);
    SPDLOG_INFO("GenerateLineSegmentFromStroke code:{}, period:{}, iRet:{}", code, period, iRet);
    return 0;
}


//从L数据划分TT
int32_t ZenSchedule::DivideTrendCentralFromLineSegment(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();

    TrendCentral tc;
    int32_t iRet = 0;
    vector<LineSegmentData*> &vecLineSegmentData = ns->LineSegments[code][period];
    vector<TrendCentralData*> &vecTrendCentralData = ns->TrendCentrals[code][period];
    vector<TrendTypeData*> &vecTrendTypeData = ns->TrendTypes[code][period];
    //iRet = tc.DivideTrendCentral(vecLineSegmentData, vecTrendCentralData, vecTrendTypeData);
    SPDLOG_INFO("DivideTrendCentralFromLineSegment code:{}, iRet:{}", code, iRet);
    return 0;
}

//从S数据划分TT
int32_t ZenSchedule::DivideTrendCentralFromStroke(const string& code, const string& period) {
    ZenTheory* ns = ZenTheory::get_instance();

    TrendCentral tc;
    int32_t iRet = 0;
    vector<StrokeData*>& vecStrokeData = ns->Strokes[code][period];
    vector<TrendCentralData*>& vecTrendCentralData = ns->TrendCentrals[code][period];
    vector<TrendTypeData*>& vecTrendTypeData = ns->TrendTypes[code][period];
    iRet = tc.DivideTrendCentral(vecStrokeData, vecTrendCentralData, vecTrendTypeData);
    SPDLOG_INFO("DivideTrendCentralFromStroke code:{}, iRet:{}", code, iRet);
    return 0;
}

int32_t ZenSchedule::DivergenceHandle(const string& code, const string& period) {
    
    Divergence dg;
    dg.DivergenceHandle(code, period);
    SPDLOG_DEBUG("Divergence code:{}, period:{}", code, period);
    return 0;
}

int32_t ZenSchedule::TradeProcessHandle(const string& code, const string& period) {
    TradeHandle th;
    th.TradeStrategyHandle(code, period);
    return 0;
}
