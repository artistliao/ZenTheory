#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"


ZenTheory *ZenTheory::_ns = nullptr;

ZenTheory::ZenTheory()
{
	m_level_map[1] = "1min";
	m_level_map[2] = "5min";
	m_level_map[3] = "30min";
	m_level_map[4] = "1day";

	RealTimeHandleExit = 0;
	lastOrderId = 0;
	LoadKlineEnd = 0;

	for (auto& tct : m_trade_code_types) {
		KlineCheckedIdx[tct.first] = 0;
	}
}

ZenTheory::~ZenTheory()
{
	if (m_otl_connect.connected)
	{
		try
		{
			m_otl_connect.commit();
			m_otl_connect.logoff();
		}
		catch (otl_exception &p)
		{
			cerr << "[error] commit to dbserver error: " << endl; // print out error message
			cerr << "msg: " << p.msg << endl;		// print out error message
			cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
			cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
			cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		}
	}
}

bool ZenTheory::run(const char *conf_file)
{
	dsa_xml_document<> xml_conf;
	try
	{
		xml_conf.parse_file<0>(conf_file);
	}
	catch (parse_error &e)
	{
		printf("\t配置文件“%s”解析错误: %s，位置：%s，异常退出！\n", conf_file, e.what(), e.where<char>());
		return false;
	}

	xml_node<> *root_conf = xml_conf.first_node("ZenTheory", 0, false);
	if (!root_conf)
	{
		printf("\t配置文件“%s”内容无效，异常退出！\n", conf_file);
		return false;
	}

	xml_attribute<>* attribute = root_conf->first_attribute("db_name", 0, false);
	if (!attribute || *(attribute->value()) == '\0')
	{
		printf("配置文件“%s”ZenTheory.db_name缺失或为空，异常退出！\n", conf_file);
		return false;
	}

	strcpy(db_name, attribute->value());

	attribute = root_conf->first_attribute("is_analysis", 0, false);
	if (!attribute || *(attribute->value()) == '\0')
	{
		printf("配置文件“%s”ZenTheory.is_analysis缺失或为空，异常退出！\n", conf_file);
		return false;
	}

	is_analysis = atoi(attribute->value());

	attribute = root_conf->first_attribute("log_path", 0, false);
	if (!attribute || *(attribute->value()) == '\0')
	{
		printf("配置文件“%s”ZenTheory.log_path缺失或为空，异常退出！\n", conf_file);
		return false;
	}
	log_path.assign(attribute->value());

	attribute = root_conf->first_attribute("log_level", 0, false);
	if (!attribute || *(attribute->value()) == '\0')
	{
		printf("配置文件“%s”ZenTheory.log_level缺失或为空，异常退出！\n", conf_file);
		return false;
	}
	log_level.assign(attribute->value());

	attribute = root_conf->first_attribute("trade_codes", 0, false);
	if (!attribute || *(attribute->value()) == '\0')
	{
		printf("配置文件“%s”ZenTheory.trade_codes缺失或为空，异常退出！\n", conf_file);
		return false;
	}

	trade_codes.assign(attribute->value());

	attribute = root_conf->first_attribute("connect_str", 0, false);
	if (!attribute || *(attribute->value()) == '\0')
	{
		printf("配置文件“%s”ZenTheory.connect_str缺失或为空，异常退出！\n", conf_file);
		return false;
	}

	Utils::InitLogger(log_path, log_level);

	otl_connect::otl_initialize();
	try
	{
		m_otl_connect.rlogon(attribute->value());
		m_otl_connect.auto_commit_on();
	}
	catch (otl_exception& p)
	{
		cerr << "【错误】连接数据库失败：" << attribute->value() << endl;
		cerr << "msg: " << p.msg << endl;		// print out error message
		cerr << "stm_text: " << p.stm_text << endl;	// print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl;	// print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl;	// print out the variable that caused the error
		return false;
	}

	if (!m_otl_connect.connected)
		return false;

	need_reconnect = false;
	connect_str = attribute->value();

	return initialize();
}

ZenTheory* ZenTheory::get_instance()
{
	if (_ns == nullptr)
		_ns = new ZenTheory();

	return _ns;
}

bool ZenTheory::initialize()
{
	if (!parse_securities()) {
		return false;
	}

	if (!parse_trade_time_sections()) {
		return false;
	}

	if(!load_trade_codes()) {
		return false;
	}

	if (!init_task_manages()) {
		return false;
	}

	StartTs["1min"] = Utils::Load1MinStartTs();
	StartTs["5min"] = Utils::Load5MinStartTs();
	StartTs["15min"] = Utils::Load15MinStartTs();
	StartTs["30min"] = Utils::Load30MinStartTs();

	return true;
}


bool ZenTheory::reconnect()
{
	if (m_otl_connect.connected)
	{
		try
		{
			m_otl_connect.logoff();
		}
		catch (otl_exception &p)
		{
			cerr << "[error] commit to dbserver error: " << endl; // print out error message
			cerr << "msg: " << p.msg << endl;		// print out error message
			cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
			cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
			cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
			SPDLOG_ERROR("reconnect 1 msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		}
	}

	try
	{
		m_otl_connect.rlogon(connect_str.c_str());
		m_otl_connect.auto_commit_on();
	}
	catch (otl_exception& p)
	{
		cerr << "【错误】连接数据库失败：" << connect_str << endl;
		cerr << "msg: " << p.msg << endl;		// print out error message
		cerr << "stm_text: " << p.stm_text << endl;	// print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl;	// print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl;	// print out the variable that caused the error
		SPDLOG_ERROR("reconnect 2 msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return false;
	}

	if (m_otl_connect.connected)
		need_reconnect = false;

	return m_otl_connect.connected != 0;
}

void ZenTheory::analyse_sql_state(unsigned char *sqlstate)
{
	if (sqlstate[0] == '\0' || (sqlstate[0] == '0' && sqlstate[1] == '8'))
		need_reconnect = true;
}

void ZenTheory::Test_db_connect()
{
	try
	{
		char buffer[128];
		sprintf(buffer, "SELECT 1 from DUAL");
		otl_stream ost(10, buffer, m_otl_connect);
		int id = 0;
		while (!ost.eof())
		{
			ost >> id;
		}
	}
	catch (otl_exception& p)
	{
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		analyse_sql_state(p.sqlstate);
		SPDLOG_ERROR("Test_db_connect msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return;
	}
	catch (...)
	{
		return;
	}

	return;
}

bool ZenTheory::load_trade_codes()
{
	try
	{
		SPDLOG_INFO("load_trade_codes start");
		vector<string> vec_codes;
		Utils::StringSplit(trade_codes, vec_codes, ",", true);
		for (auto& code : vec_codes) {
			auto pSec = m_futures_code_map.find(code);
			if (pSec == m_futures_code_map.end()) {
				SPDLOG_INFO("m_futures_code_map not find code:{}", code);
				continue;
			}
			m_trade_code_types[code] = "futures";
		}
		SPDLOG_INFO("m_trade_code_types size:{}", m_trade_code_types.size());
	}
	catch (otl_exception& p)
	{
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		SPDLOG_ERROR("otl_exception msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return false;
	}

	return true;
}

bool ZenTheory::parse_securities()
{
	try
	{
		SPDLOG_INFO("parse_securities start");
		char buffer[256];
		sprintf(buffer, "select id, code, display_name, name, start_date,end_date from gp.securities");
		otl_stream os1(200, buffer, m_otl_connect);
		while (!os1.eof())
		{
			Securities* securities = reinterpret_cast<Securities*>(allocate_aligned(sizeof(Securities)));
			memset(securities, 0, sizeof(Securities));
			os1 >> securities->gp_id >> securities->gp_code >> securities->display_name >> securities->name
				>> securities->start_date >> securities->end_date;
			m_stock_id_map[securities->gp_id] = securities;
			m_stock_code_map[securities->gp_code] = securities;
		}

		SPDLOG_INFO("m_stock_id_map size:{}", m_stock_id_map.size());
		SPDLOG_INFO("m_stock_code_map size:{}", m_stock_code_map.size());

		sprintf(buffer, "select id, code, display_name, name, start_date,end_date from idx.securities");
		otl_stream os2(200, buffer, m_otl_connect);
		while (!os2.eof())
		{
			Securities* securities = reinterpret_cast<Securities*>(allocate_aligned(sizeof(Securities)));
			memset(securities, 0, sizeof(Securities));
			os2 >> securities->gp_id >> securities->gp_code >> securities->display_name >> securities->name
				>> securities->start_date >> securities->end_date;
			m_index_id_map[securities->gp_id] = securities;
			m_index_code_map[securities->gp_code] = securities;
		}

		SPDLOG_INFO("m_index_id_map size:{}", m_index_id_map.size());
		SPDLOG_INFO("m_index_code_map size:{}", m_index_code_map.size());

		sprintf(buffer, "select id, code, display_name, name, start_date,end_date, IFNULL(trade_times, '') from futures.securities");
		otl_stream os3(200, buffer, m_otl_connect);
		while (!os3.eof())
		{
			string trade_time_idxs;
			//Securities* securities = reinterpret_cast<Securities*>(allocate_aligned(sizeof(Securities)));
			Securities* securities = new Securities;
			memset(securities, 0, sizeof(Securities));
			os3 >> securities->gp_id >> securities->gp_code >> securities->display_name >> securities->name
				>> securities->start_date >> securities->end_date >> trade_time_idxs;
			
			if (trade_time_idxs.length() > 0) {
				vector<string> vec_trade_time_idxs;
				Utils::StringSplit(trade_time_idxs, vec_trade_time_idxs, ",", true);
				for (auto& strIdx : vec_trade_time_idxs) {
					int32_t tradeIdx = atoi(strIdx.c_str());
					if (tradeIdx <= 0) {
						continue;
					}

					securities->trade_times.push_back(tradeIdx);
				}
			}

			m_futures_id_code_map[securities->gp_id] = securities;
			m_futures_code_map[securities->gp_code] = securities;
		}

		SPDLOG_INFO("m_index_id_map size:{}", m_index_id_map.size());
		SPDLOG_INFO("m_index_code_map size:{}", m_index_code_map.size());
	}
	catch (otl_exception& p)
	{
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		SPDLOG_ERROR("parse_securities msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return false;
	}

	return true;
}


bool ZenTheory::parse_trade_time_sections()
{
	try
	{
		SPDLOG_INFO("parse_trade_time_sections start");
		char buffer[256] = {0};
		string start_time;
		string end_time;
		snprintf(buffer, sizeof(buffer), "select id, start_time, end_time from futures.trade_time_section");
		otl_stream os1(200, buffer, m_otl_connect);
		while (!os1.eof())
		{
			TradeTimeSection* time_section = new TradeTimeSection;
			memset(time_section, 0, sizeof(TradeTimeSection));
			os1 >> time_section->id >> start_time >> end_time;
			time_section->start_time = Utils::StrTimeToDiffTs(start_time);
			time_section->end_time = Utils::StrTimeToDiffTs(end_time);
			m_time_sections[time_section->id] = time_section;
		}

		SPDLOG_INFO("m_time_sections size:{}", m_time_sections.size());
	}
	catch (otl_exception& p)
	{
		cerr << "msg: " << p.msg << endl; // print out error message
		cerr << "stm_text: " << p.stm_text << endl; // print out SQL that caused the error
		cerr << "sqlstate: " << p.sqlstate << endl; // print out SQLSTATE message
		cerr << "var_info: " << p.var_info << endl; // print out the variable that caused the error
		SPDLOG_ERROR("otl_exception msg:{}, stm_text:{}, sqlstate:{}, var_info:{}", p.msg, p.stm_text, p.sqlstate, p.var_info);
		return false;
	}

	return true;
}

bool ZenTheory::init_task_manages()
{
	try
	{
		SPDLOG_INFO("init_task_manages start");
		for (auto& trade_code_type : m_trade_code_types) {
			TaskManage* pTaskManage = new TaskManage;
			pTaskManage->th_mutex = new mutex;
			pTaskManage->update = true;
			pTaskManage->last_checked_ts = 0;
			TaskManages[trade_code_type.first] = pTaskManage;
		}

		SPDLOG_INFO("TaskManages size:{}", TaskManages.size());
	}
	catch (std::exception& e)
	{
		cerr << "init_task_manages exception: " << e.what() << endl;
		SPDLOG_ERROR("init_task_manages exception:{}", e.what());
		return false;
	}

	return true;
}

int64_t ZenTheory::GetOrderId() {
	std::lock_guard<std::mutex> lock(order_id_mutex);
	int64_t orderId = Utils::OrderId();
	if (orderId <= lastOrderId) {
		orderId = lastOrderId+1;
	}

	lastOrderId = orderId;
	return orderId;
}

int32_t ZenTheory::PutKlineData(KlineData* pKlineData) {
	if (!pKlineData) {
		return -1;
	}

	std::lock_guard<std::mutex> lock(kline_mutex);
	memset(pKlineData, 0, sizeof(KlineData));
	KlineBuf.push_back(pKlineData);
	return 0;
}

KlineData* ZenTheory::GetKlineData() {
	std::lock_guard<std::mutex> lock(kline_mutex);
	KlineData* pKlineData = nullptr;
	if (KlineBuf.size() > 0) {
		pKlineData = KlineBuf.back();
		KlineBuf.pop_back();
	}
	else {
		pKlineData = new KlineData;
		memset(pKlineData, 0, sizeof(KlineData));
	}

	return pKlineData;
}

int32_t ZenTheory::PutFeatureSeq(FeatureSequenceData* pFeatureSeq) {
	if (!pFeatureSeq) {
		return -1;
	}

	std::lock_guard<std::mutex> lock(feature_seq_mutex);
	memset(pFeatureSeq, 0, sizeof(FeatureSequenceData));
	FeatureSeqBuf.push_back(pFeatureSeq);
	return 0;
}

FeatureSequenceData* ZenTheory::GetFeatureSeq() {
	std::lock_guard<std::mutex> lock(feature_seq_mutex);
	FeatureSequenceData* pFeatureSeq = nullptr;
	if (FeatureSeqBuf.size() > 0) {
		pFeatureSeq = *(FeatureSeqBuf.rbegin());
		FeatureSeqBuf.pop_back();
	}
	else {
		pFeatureSeq = new FeatureSequenceData;
		memset(pFeatureSeq, 0, sizeof(FeatureSequenceData));
	}

	return pFeatureSeq;
}


int32_t ZenTheory::PutStrokeData(StrokeData* pStrokeData) {
	if (!pStrokeData) {
		return -1;
	}

	std::lock_guard<std::mutex> lock(stroke_mutex);
	memset(pStrokeData, 0, sizeof(StrokeData));
	StrokeBuf.push_back(pStrokeData);
	return 0;
}

StrokeData* ZenTheory::GetStrokeData() {
	std::lock_guard<std::mutex> lock(stroke_mutex);
	StrokeData* pStrokeData = nullptr;
	if (StrokeBuf.size() > 0) {
		pStrokeData = *(StrokeBuf.rbegin());
		StrokeBuf.pop_back();
	}
	else {
		pStrokeData = new StrokeData;
		memset(pStrokeData, 0, sizeof(StrokeData));
	}

	return pStrokeData;
}

int32_t ZenTheory::PutLineSegmentData(LineSegmentData* pLineSegmentData) {
	if (!pLineSegmentData) {
		return -1;
	}

	std::lock_guard<std::mutex> lock(linesegment_mutex);
	memset(pLineSegmentData, 0, sizeof(LineSegmentData));
	LineSegmentBuf.push_back(pLineSegmentData);
	return 0;
}

LineSegmentData* ZenTheory::GetLineSegmentData() {
	std::lock_guard<std::mutex> lock(linesegment_mutex);
	LineSegmentData* pLineSegmentData = nullptr;
	if (LineSegmentBuf.size() > 0) {
		pLineSegmentData = LineSegmentBuf.back();
		LineSegmentBuf.pop_back();
	}
	else {
		pLineSegmentData = new LineSegmentData;
		memset(pLineSegmentData, 0, sizeof(LineSegmentData));
	}

	return pLineSegmentData;
}

int32_t ZenTheory::PutTrendCentralData(TrendCentralData* pTrendCentralData) {
	if (!pTrendCentralData) {
		return -1;
	}

	std::lock_guard<std::mutex> lock(tc_mutex);
	memset(pTrendCentralData, 0, sizeof(TrendCentralData));
	TCBuf.push_back(pTrendCentralData);
	return 0;
}

TrendCentralData* ZenTheory::GetTrendCentralData() {
	std::lock_guard<std::mutex> lock(tc_mutex);
	TrendCentralData* pTrendCentralData = nullptr;
	if (TCBuf.size() > 0) {
		pTrendCentralData = TCBuf.back();
		TCBuf.pop_back();
	}
	else {
		pTrendCentralData = new TrendCentralData;
		memset(pTrendCentralData, 0, sizeof(TrendCentralData));
	}

	return pTrendCentralData;
}

int32_t ZenTheory::PutMissingKline(MissingKline* pMissingKline) {
	if (!pMissingKline) {
		return -1;
	}

	std::lock_guard<std::mutex> lock(missing_kline_mutex);
	memset(pMissingKline, 0, sizeof(MissingKline));
	MissingKlineBuf.push_back(pMissingKline);
	return 0;
}

MissingKline* ZenTheory::GetMissingKline() {
	std::lock_guard<std::mutex> lock(missing_kline_mutex);
	MissingKline* pMissingKline = nullptr;
	if (MissingKlineBuf.size() > 0) {
		pMissingKline = MissingKlineBuf.back();
		MissingKlineBuf.pop_back();
	}
	else {
		pMissingKline = new MissingKline;
		memset(pMissingKline, 0, sizeof(MissingKline));
	}

	return pMissingKline;
}

bool ZenTheory::JudgeContinueKlines(const string& code, int32_t last_ts, int32_t this_ts) {
	if ((this_ts - last_ts) == 60) {
		return true;
	}

	ZenTheory* ns = ZenTheory::get_instance();
	auto pSecu = ns->m_futures_code_map[code];
	if (!pSecu) {
		SPDLOG_ERROR("m_futures_code_map not find:{}", code);
		return false;
	}

	int32_t last_diff_ts = ((last_ts + 8 * 3600) % 86400);
	int32_t this_diff_ts = ((this_ts + 8 * 3600) % 86400);
	int32_t trade_times_size = pSecu->trade_times.size();
	for (int32_t i = 0; i < trade_times_size; i++) {
		int32_t trade_time_idx1 = pSecu->trade_times[(i - 1 + trade_times_size) % trade_times_size];
		int32_t trade_time_idx2 = pSecu->trade_times[i];
		TradeTimeSection* pTTS1 = ns->m_time_sections[trade_time_idx1];
		TradeTimeSection* pTTS2 = ns->m_time_sections[trade_time_idx2];
		if (last_diff_ts == (pTTS1->end_time - 60) && this_diff_ts == pTTS2->start_time) {
			return true;
		}
	}

	return false;
}

int32_t ZenTheory::GetLastKlineTs(const string& code, int32_t this_ts) {
	ZenTheory* ns = ZenTheory::get_instance();
	auto pSecu = ns->m_futures_code_map[code];
	if (!pSecu) {
		SPDLOG_ERROR("m_futures_code_map not find:{}", code);
		return -1;
	}

	int32_t this_diff_ts = ((this_ts + 8 * 3600) % 86400);
	this_diff_ts -= (this_diff_ts % 60);
	int32_t trade_times_size = pSecu->trade_times.size();
	for (int32_t i = 0; i < trade_times_size; i++) {
		int32_t trade_time_idx1 = pSecu->trade_times[(i - 1 + trade_times_size) % trade_times_size];
		int32_t trade_time_idx2 = pSecu->trade_times[i];
		TradeTimeSection* pTTS1 = ns->m_time_sections[trade_time_idx1];
		TradeTimeSection* pTTS2 = ns->m_time_sections[trade_time_idx2];
		if (this_diff_ts > pTTS1->end_time && this_diff_ts <= pTTS2->start_time) {
			if (i != 0) {
				return Utils::DayZeroTs(this_ts) + pTTS1->end_time - 60;
			}
			else {
				return Utils::DayZeroTs(this_ts) - 86400 + pTTS1->end_time - 60;
			}
		}
		else if (this_diff_ts > pTTS1->start_time && this_diff_ts <= pTTS1->end_time) {
			return this_ts - 60;
		}
	}

	return -2;
}


//有瑕疵，没有考虑周五，非交易日等情况
int32_t ZenTheory::GetNextKlineTs(const string& code, int32_t this_ts) {
	ZenTheory* ns = ZenTheory::get_instance();
	auto pSecu = ns->m_futures_code_map[code];
	if (!pSecu) {
		SPDLOG_ERROR("m_futures_code_map not find:{}", code);
		return -1;
	}

	int32_t this_diff_ts = ((this_ts + 8 * 3600) % 86400);
	int32_t trade_times_size = pSecu->trade_times.size();
	for (int32_t i = 0; i < trade_times_size; i++) {
		int32_t trade_time_idx1 = pSecu->trade_times[i];
		int32_t trade_time_idx2 = pSecu->trade_times[(i + 1) % trade_times_size];
		TradeTimeSection* pTTS1 = ns->m_time_sections[trade_time_idx1];
		TradeTimeSection* pTTS2 = ns->m_time_sections[trade_time_idx2];
		if (this_diff_ts == (pTTS1->end_time - 60)) {
			if (i != (trade_times_size - 1)) {
				return Utils::DayZeroTs(this_ts) + pTTS2->start_time;
			}
			else {
				return Utils::DayZeroTs(this_ts) + pTTS2->start_time + 86400;
			}
		}
		else if (this_diff_ts >= pTTS1->start_time && this_diff_ts < (pTTS1->end_time - 60)) {
			return this_ts + 60;
		}
	}

	return -2;
}


