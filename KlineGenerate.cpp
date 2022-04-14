#include "stdafx.h"
#include "ZenTheory.h"
#include "KlineGenerate.h"
#include "DataCard.h"
#include "Utils.h"

KlineGenerate::KlineGenerate()
{
	
}

KlineGenerate::~KlineGenerate()
{
}

// 
int32_t KlineGenerate::GenerateNewKlineAndSaveToDB(const string& securitiesType, const string& securitiesCode, const string& newPeriod) {
	SPDLOG_DEBUG("GenerateNewKlineAndSaveToDB begin! securitiesCode:{}, newPeriod:{}", securitiesCode, newPeriod);
	ZenTheory* ns = ZenTheory::get_instance();

	int32_t iPeroid = atoi(newPeriod.c_str());
	if (iPeroid == 0) {
		SPDLOG_WARN("error newPeriod:{}", newPeriod);
		return -4;
	}

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
	string tableName = newPeriod + "_prices_" + stockCodeSuffix;
	if (securitiesType == "futures") {
		stockCodeSuffix = securitiesCode.substr(0, 2);
		tableName = newPeriod + "_prices_" + stockCodeSuffix;
		transform(tableName.begin(), tableName.end(), tableName.begin(), tolower);
	}

	int32_t iRet = CheckTableExist(dbName, tableName);
	if (iRet < 0) {
		int32_t iCTRet = CreateTable(dbName, tableName);
		if (iCTRet < 0) {
			SPDLOG_WARN("CreateTable failed! dbName:{}, tableName:{}", dbName, tableName);
			return -2;
		}
	}

	int32_t maxTs = GetMaxTs(dbName, tableName, pSecurities->gp_id);
	if (maxTs < 0) {
		SPDLOG_WARN("GetMaxTs failed! dbName:{}, tableName:{}, maxTs:{}", dbName, tableName, maxTs);
		return -6;
	}

	char buffer[512] = { 0 };
	try
	{
		//查询1min_prices_xx表
		snprintf(buffer, sizeof(buffer), "SELECT ts, open, high, low, close, volume, money, factor FROM %s.1min_prices_%s WHERE gp_id=%d ORDER BY ts ASC",
			dbName.c_str(), stockCodeSuffix.c_str(), pSecurities->gp_id);
		SPDLOG_DEBUG("sql:{}", buffer);

		GPKlineData gpKline;
		GPKlineData newGPKline;
		memset(&gpKline, 0, sizeof(GPKlineData));
		memset(&newGPKline, 0, sizeof(GPKlineData));

		newGPKline.low = 1000000.0;

		vector<GPKlineData*> gpKlineDatas;

		otl_stream os1(1000, buffer, ns->get_otl_connect());
		int32_t startTs = 0;
		int32_t endTs = 0;
		bool bNewKlineStart = false;
		bool bNewKlineStop = false;
		GPKlineData* pGPKline = NULL;
		struct tm* pTm = NULL;
		time_t iTm = 0;
		int32_t count = 0;
		while (!os1.eof())
		{
			os1 >> gpKline.ts >> gpKline.open >> gpKline.high >> gpKline.low >> gpKline.close >> gpKline.volume >> gpKline.money >> gpKline.factor;
			if (gpKline.ts < (maxTs + iPeroid * 60)) {
				continue;
			}

			count++;
			iTm = time_t(gpKline.ts);
			pTm = localtime(&iTm);
			if (pTm->tm_min % iPeroid == 0) {
				if (!bNewKlineStart) {
					bNewKlineStart = true;
					startTs = gpKline.ts;
					newGPKline.open = gpKline.open;
				}
				else {
					bNewKlineStop = true;
					endTs = gpKline.ts;
				}
			}

			if (bNewKlineStart && bNewKlineStop) {
				pGPKline = new GPKlineData;
				pGPKline->ts = startTs;
				pGPKline->open = newGPKline.open;
				pGPKline->high = newGPKline.high;
				pGPKline->low = newGPKline.low;
				pGPKline->close = newGPKline.close;
				pGPKline->volume = newGPKline.volume;
				pGPKline->money = newGPKline.money;
				pGPKline->factor = newGPKline.factor;
				gpKlineDatas.push_back(pGPKline);

				bNewKlineStart = true;
				bNewKlineStop = false;
				startTs = gpKline.ts;
				newGPKline.open = gpKline.open;
				newGPKline.high = 0.0;
				newGPKline.low = 1000000.0;
				newGPKline.volume = 0.0;
				newGPKline.money = 0.0;
				newGPKline.close = 0.0;
				newGPKline.factor = gpKline.factor;
			}

			if (bNewKlineStart && (!bNewKlineStop)) {
				if (Utils::DoubleCmp(gpKline.high, newGPKline.high) > 0) {
					newGPKline.high = gpKline.high;
				}

				if (Utils::DoubleCmp(gpKline.low, newGPKline.low) < 0) {
					newGPKline.low = gpKline.low;
				}

				newGPKline.volume += gpKline.volume;
				newGPKline.money += gpKline.money;
				newGPKline.close = gpKline.close;
			}

			if (count % 10000 == 0) {
				SPDLOG_DEBUG("count:{}", count);
			}
		}

		SPDLOG_DEBUG("count:{}", count);

		size_t gpKlineNum = gpKlineDatas.size();
		SPDLOG_DEBUG("gpKlineNum:{}", gpKlineNum);

		stringstream ss;
		bool bInsert = true;
		for (int i = 0; i < gpKlineNum; i++) {
			//
			pGPKline = gpKlineDatas[i];
			if (bInsert) {
				ss.clear();
				ss.str("");
				ss << std::fixed << std::setprecision(2);
				ss << "INSERT INTO " << dbName << "." << tableName << "(gp_id, ts, open, high, low, close, volume, money, factor) VALUES ";
				bInsert = false;
			}

			ss << std::fixed << std::setprecision(2);
			ss << "("
				<< pSecurities->gp_id << ", " << pGPKline->ts << ", " << pGPKline->open << ", " << pGPKline->high << ", " << pGPKline->low << ", " << pGPKline->close << ", "
				<< pGPKline->volume << ", " << pGPKline->money << ",";
			ss << std::fixed << std::setprecision(6);
			ss << pGPKline->factor << "),";

			if ((i > 0) && (i % 100 == 0)) {
				string strSql = ss.str();
				strSql = strSql.substr(0, strSql.length() - 1);
				otl_stream os2(1, strSql.c_str(), ns->get_otl_connect());
				bInsert = true;
			}

			if (i % 10000 == 0) {
				SPDLOG_DEBUG("insert i:{}", i);
			}
		}

		//插入最后一批kline
		if (!bInsert) {
			string strSql = ss.str();
			strSql = strSql.substr(0, strSql.length() - 1);
			otl_stream os2(1, strSql.c_str(), ns->get_otl_connect());
		}

		//释放内存
		for (int i = 0; i < gpKlineNum; i++) {
			delete gpKlineDatas[i];
		}

		SPDLOG_DEBUG("GenerateNewKlineAndSaveToDB end!");
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

	return 0;
}

// 
int32_t KlineGenerate::GenerateNewKline(const string& securitiesType, const string& securitiesCode, const string& newPeriod) {
	SPDLOG_DEBUG("GenerateNewKline begin! securitiesCode:{}, newPeriod:{}", securitiesCode, newPeriod);
	ZenTheory* ns = ZenTheory::get_instance();

	auto gp_iter = ns->m_generate_periods.find(newPeriod);
	if (gp_iter == ns->m_generate_periods.end()) {
		SPDLOG_WARN("m_generate_periods not find newPeriod:{}", newPeriod);
		return -4;
	}

	int32_t iPeroid = gp_iter->second/60;

	//vector<KlineData*>& compOriKlines = ns->CompOriKlines[securitiesCode][newPeriod];

	KlineData* pKline = NULL;
	KlineData* pNewKline = NULL;
	KlineData* pCompKline = NULL;
	vector<KlineData*> &min1OriKlines = ns->OriKlines[securitiesCode]["1min"];
	if (min1OriKlines.size() == 0) {
		SPDLOG_WARN("ming1_size ==0}");
		return -4;
	}

	if (ns->OriKlines[securitiesCode].find(newPeriod) == ns->OriKlines[securitiesCode].end()) {
		vector<KlineData*> vec_klines;
		ns->OriKlines[securitiesCode][newPeriod] = vec_klines;
	}

	vector<KlineData*> &newOriKlines = ns->OriKlines[securitiesCode][newPeriod];
	int64_t start_calc_time = 0;
	int32_t ori_klines_size = newOriKlines.size();
	if (ori_klines_size > 0) {
		pNewKline = newOriKlines.back();
		start_calc_time = pNewKline->starttime;
		//newOriKlines.pop_back();
	}

	try
	{
		bool bNewKlineStart = false;
		bool bNewKlineStop = false;
		struct tm* pTm = NULL;
		time_t iTm = 0;
		int32_t count = 0;
		int32_t ts = 0;
		int32_t start_ts = 0;
		int32_t end_ts = 0;
		int32_t index = 0;
		size_t ming1_size = min1OriKlines.size();
		int32_t ming1_start_calc_idx = -1;
		if (start_calc_time > 0) {
			for (int32_t i = ming1_size - 1; i >= 0; i--) {
				pKline = min1OriKlines[i];
				if ((pKline->starttime) == start_calc_time) {
					ming1_start_calc_idx = i;
					break;
				}
			}

			if (ming1_start_calc_idx == -1) {
				return 0;
			}
			else {
				newOriKlines.pop_back();
			}
		}
		else {
			ming1_start_calc_idx = 0;
		}

		if (pNewKline) {
			index = pNewKline->index;
		} else {
			pNewKline = ns->GetKlineData();
		}

		memset(pNewKline, 0, sizeof(KlineData));
		pNewKline->index = index;
		pNewKline->high = 0.0;
		pNewKline->low = 1000000.0;

		for (int32_t i = ming1_start_calc_idx; i < ming1_size; i++) {
			pKline = min1OriKlines[i];
			ts = Utils::IntTimeToTs(pKline->starttime);
			count++;
			iTm = time_t(ts);
			pTm = localtime(&iTm);
			if (pTm->tm_min % iPeroid == 0) {
				if (!bNewKlineStart) {
					bNewKlineStart = true;
					pNewKline->starttime = pKline->starttime;
					pNewKline->open = pKline->open;
				}
				else {
					bNewKlineStop = true;
					pNewKline->endtime = pKline->starttime;
					start_ts = Utils::IntTimeToTs(pNewKline->starttime);
					end_ts = Utils::IntTimeToTs(pNewKline->endtime);
					if ((end_ts - start_ts) / 60 > iPeroid) {
						pNewKline->endtime = Utils::TsToIntTime(start_ts + iPeroid * 60);
					}
				}
			}

			if (bNewKlineStart && bNewKlineStop) {
				//SPDLOG_DEBUG("GenerateNewKline starttime:{}", pNewKline->starttime);
				newOriKlines.push_back(pNewKline);
				//if (compOriKlines.size() > index) {
				//	pCompKline = compOriKlines[index];
				//	if (KLineCmp(pNewKline, pCompKline) != 0) {
				//		SPDLOG_WARN("kline not equal index:{}, period:{}", index, newPeriod);
				//	}
				//}

				bNewKlineStart = true;
				bNewKlineStop = false;
				pNewKline = new KlineData;
				memset(pNewKline, 0, sizeof(KlineData));
				index++;
				pNewKline->index = index;
				pNewKline->starttime = pKline->starttime;
				pNewKline->open = pKline->open;
				pNewKline->high = 0.0;
				pNewKline->low = 1000000.0;
				pNewKline->close = 0.0;
				pNewKline->vol = 0;
				pNewKline->amount = 0.0;
			}

			if (bNewKlineStart && (!bNewKlineStop)) {
				if (Utils::DoubleCmp(pKline->high, pNewKline->high) > 0) {
					pNewKline->high = pKline->high;
				}

				if (Utils::DoubleCmp(pKline->low, pNewKline->low) < 0) {
					pNewKline->low = pKline->low;
				}

				pNewKline->vol += pKline->vol;
				pNewKline->amount += pKline->amount;
				pNewKline->close = pKline->close;
				//待确定
				if (i == (ming1_size - 1)) {
					pNewKline->endtime = pKline->endtime;
				}
			}

			if (count % 10000 == 0) {
				SPDLOG_DEBUG("count:{}", count);
			}
		}

		//SPDLOG_DEBUG("GenerateNewKline starttime:{}", pNewKline->starttime);
		if (pNewKline->starttime == 0) {
			//delete pNewKline;
			ns->PutKlineData(pNewKline);
		}
		else {
			newOriKlines.push_back(pNewKline);
		}

		//SPDLOG_DEBUG("GenerateNewKline end!");
	}
	catch (std::exception& e)
	{
		SPDLOG_ERROR("GenerateNewKline exception:{}", e.what());
		return -1;
	}

	return 0;
}


//判断数据库表是否存在 返回值：0:存在, <0:不存在
int32_t KlineGenerate::CheckTableExist(const string& DbName, const string& tableName) {
	SPDLOG_INFO("CheckTableExist begin! DbName:{}, tableName:{}", DbName, tableName);
	ZenTheory* ns = ZenTheory::get_instance();
	char buffer[256] = { 0 };
	try
	{
		//查询数据库表是否存在
		snprintf(buffer, sizeof(buffer), "SELECT table_name FROM information_schema.TABLES WHERE table_schema='%s' AND table_name = '%s'", DbName.c_str(), tableName.c_str());
		
		char dbTableName[128] = { 0 };
		otl_stream os1(200, buffer, ns->get_otl_connect());
		while (!os1.eof())
		{
			memset(dbTableName, 0, sizeof(dbTableName));
			os1 >> dbTableName;
		}

		bool bExist = false;
		if (tableName.compare(dbTableName) == 0) {
			bExist = true;
		}

		if (bExist) {
			SPDLOG_INFO("DbName:{}, tableName:{} exist!", DbName, tableName);
			return 0;
		}

		SPDLOG_WARN("DbName:{}, tableName:{} not exist!", DbName, tableName);
		return -1;
	}
	catch (otl_exception& p) {
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		ns->analyse_sql_state(p.sqlstate);
		SPDLOG_ERROR("CheckTableExist msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return -2;
	}

	return -1;
}


//建表 返回值：0:成功, <0:错误
int32_t KlineGenerate::CreateTable(const string& DbName, const string& tableName) {
	SPDLOG_INFO("CreateTable DbName:{}, tableName:{}", DbName, tableName);
	ZenTheory* ns = ZenTheory::get_instance();
	char buffer[2048] = { 0 };
	try
	{
		//新建表
		snprintf(buffer, sizeof(buffer), "CREATE TABLE %s.%s (\
			`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id,无具体含义', \
			`gp_id` smallint(6) NOT NULL COMMENT 'gp id', \
			`ts` int(11) NOT NULL COMMENT '开始时间戳', \
			`open` FLOAT(8, 2) NOT NULL COMMENT 'open', \
			`high` FLOAT(8, 2) NOT NULL COMMENT 'high', \
			`low` FLOAT(8, 2) NOT NULL COMMENT 'low', \
			`close` FLOAT(8, 2) NOT NULL COMMENT 'close', \
			`volume` FLOAT(16, 2) NOT NULL COMMENT 'volume', \
			`money` FLOAT(16, 2) NOT NULL COMMENT 'money', \
			`factor` FLOAT(12, 6) NOT NULL COMMENT 'factor', \
			`divergence` tinyint(4) DEFAULT NULL COMMENT 'divergence',\
			PRIMARY KEY(`id`), \
			KEY `idx_gp_id` (`gp_id`), \
			KEY `idx_ts` (`ts`)\
			) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '行情表'; ", DbName.c_str(), tableName.c_str());

		otl_stream os2(1, buffer, ns->get_otl_connect());

		SPDLOG_DEBUG("CreateTable end!");
		return 0;
	}
	catch (otl_exception& p) {
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		ns->analyse_sql_state(p.sqlstate);
		SPDLOG_ERROR("CheckTableAndCreate msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return -2;
	}

	return -1;
}


//获取数据库表最大的ts值 返回值：>=0:正常值, <0:错误
int32_t KlineGenerate::GetMaxTs(const string& DbName, const string& tableName, int32_t gp_id) {
	SPDLOG_INFO("GetMaxTs DbName:{}, tableName:{}", DbName, tableName);
	ZenTheory* ns = ZenTheory::get_instance();
	char buffer[256] = { 0 };
	try
	{
		//查询数据库表是否存在
		snprintf(buffer, sizeof(buffer), "SELECT MAX(ts) FROM %s.%s WHERE gp_id='%d'", DbName.c_str(), tableName.c_str(), gp_id);

		int32_t maxTs = 0;
		otl_stream os1(200, buffer, ns->get_otl_connect());
		while (!os1.eof())
		{
			os1 >> maxTs;
		}

		SPDLOG_INFO("DbName:{}, tableName:{}, maxTs:{}", DbName, tableName, maxTs);
		return maxTs;
	}
	catch (otl_exception& p) {
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		ns->analyse_sql_state(p.sqlstate);
		SPDLOG_ERROR("GetMaxTs msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return -2;
	}

	return -1;
}


int32_t KlineGenerate::KLineCmp(KlineData* pKline1, KlineData* pKline2) {
	if (!pKline1 || !pKline2) {
		SPDLOG_WARN("KLineCmp error param, pKline1:{}, pKline2:{}", uint64_t(pKline1), uint64_t(pKline2));
		return -1;
	}

	// for test
	//if (pKline1->index == 23) {
	//	cout<< pKline1->index<<endl;
	//}

	if (pKline1->index != pKline2->index) {
		return 1;
	}

	if (pKline1->starttime != pKline2->starttime) {
		return 1;
	}

	if (pKline1->endtime != pKline2->endtime) {
		return 1;
	}

	//if (pKline1->vol != pKline2->vol) {
	//	return 1;
	//}

	if (Utils::DoubleCmp(pKline1->open, pKline2->open) != 0) {
		return 1;
	}

	if (Utils::DoubleCmp(pKline1->close, pKline2->close) != 0) {
		return 1;
	}

	if (Utils::DoubleCmp(pKline1->high, pKline2->high) != 0) {
		return 1;
	}

	if (Utils::DoubleCmp(pKline1->low, pKline2->low) != 0) {
		return 1;
	}

	//if (Utils::DoubleCmp(pKline1->amount, pKline2->amount) != 0) {
	//	return 1;
	//}

	return 0;
}
