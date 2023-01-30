#ifndef __ZENTHEORY_H__
#define __ZENTHEORY_H__

//缠论类
class ZenTheory : public dsa_memory_pool<>
{
public:
	ZenTheory();
	~ZenTheory();

	bool run(const char *conf_file);
	otl_connect &get_otl_connect()
	{
		if (need_reconnect || m_otl_connect.connected == false)
			reconnect();

		return m_otl_connect;
	}

	const char* get_db_name()
	{
		return db_name;
	}

	//bool readconf(const char* conf_file);
	void Test_db_connect();

	bool initialize();
	bool reconnect();
	void analyse_sql_state(unsigned char *sqlstate);

	static ZenTheory* get_instance();

private:
	bool load_trade_codes();
	bool parse_securities();
	bool parse_trade_time_sections();
	bool init_task_manages();

public:
	map<string, string> m_trade_code_types;
	//vector<pair<string, int32_t>> m_generate_periods = { {"3min",180}, {"5min",300}, {"15min",900}, {"30min", 1800} };
	map<string, int32_t> m_generate_periods = {{"3min",180}, {"5min",300}, {"15min",900}, {"30min", 1800}};
	// map<string, int32_t> m_period_lengths = { {"1min",60}, {"3min",180}, {"5min",300}, {"15min",900}, {"30min", 1800}, {"60min",3600}, {"120min",7200}};
	map<string, int32_t> m_period_lengths = {{"1min", 60},{"5min",300},{"15min",900} ,{"30min", 1800}};

	map<int32_t, Securities*> m_stock_id_map;				//key:gp_id value:
	map<string, Securities*> m_stock_code_map;				//key:gp code

	map<int32_t, Securities*> m_index_id_map;				//key:index_id value:
	map<string, Securities*> m_index_code_map;				//key:index code

	map<int32_t, Securities*> m_futures_id_code_map;			//key:futures_id value:
	map<string, Securities*> m_futures_code_map;				//key:futures code

	map<int32_t, string> m_level_map;

	map<int32_t, TradeTimeSection*> m_time_sections;	//key:id value: start_diff_time、end_diff_time

public:
	map<string, TaskManage*> TaskManages;				// 锁 key1:strock代码 value: mutex
	//map<string, map<string, vector<KlineData*>>> CompOriKlines;			// 原始kline数据 key1:strock代码  key2:周期, value: kline数据
	map<string, map<string, vector<KlineData*>>> OriKlines;				// 原始kline数据 key1:strock代码  key2:周期, value: kline数据
	map<string, int32_t> KlineCheckedIdx;								// 原始kline数据完整确认idx  key1:strock代码 value: idx
	map<string, map<string, vector<KlineMergeData*>>> MergeKlines;		// 合并kline和分型数据 key1:strock代码  key2:周期, value: kline数据
	map<string, map<string, vector<StrokeData*>>> Strokes;				// B数据 key1:strock代码  key2:周期, value: B数据
	map<string, map<string, vector<LineSegmentData*>>> LineSegments;	// L数据 key1:strock代码  key2:周期, value: L数据
	map<string, map<string, vector<LineSegmentData*>>> OldLineSegments;	//old  L数据 key1:strock代码  key2:周期, value: L数据
	map<string, map<string, vector<TrendCentralData*>>> TrendCentrals;	// TC数据 key1:strock代码, key2:周期 value: TC数据
	map<string, map<string, vector<TrendTypeData*>>> TrendTypes;		// TT数据 key1:strock代码, key2:周期 value: TT数据
	map<string, map<string,vector<Order*>>> Orders;	
	int64_t lastOrderId = 0;
	mutex  order_id_mutex;

	mutex  kline_mutex;
	vector<KlineData*> KlineBuf;

	mutex  feature_seq_mutex;
	vector<FeatureSequenceData*> FeatureSeqBuf;

	mutex  stroke_mutex;
	vector<StrokeData*> StrokeBuf;

	mutex  linesegment_mutex;
	vector<LineSegmentData*> LineSegmentBuf;

	mutex  tc_mutex;
	vector<TrendCentralData*> TCBuf;

	mutex  missing_kline_mutex;
	vector<MissingKline*> MissingKlineBuf;

	mutex  pending_missing_kline_mtx;
	vector<MissingKline*> PendingMissingKlines;

	mutex  notice_mtx;
	vector<NoticeLine*> NoticeLines;
	vector<NoticeDraw*> NoticeDraws;
	vector<NoticeTrade*> NoticeTrades;

	map<string, int32_t> StartTs;
	map<string, int32_t> WriteDataTs;

	int32_t RealTimeHandleExit;
	int32_t LoadKlineEnd = 0;
	int32_t is_analysis = 0;

	vector<TickPrice*> HCTickDatas;
	vector<TickPrice*> RBTickDatas;
	vector<DiffTickPrice*> HCRBDiffTickDatas;
	map<int32_t, int32_t> TickStats;

public:
	int64_t GetOrderId();

	int32_t PutKlineData(KlineData* pFeatureSeq);
	KlineData* GetKlineData();

	int32_t PutFeatureSeq(FeatureSequenceData* pFeatureSeq);
	FeatureSequenceData* GetFeatureSeq();

	int32_t PutStrokeData(StrokeData* pFeatureSeq);
	StrokeData* GetStrokeData();

	int32_t PutLineSegmentData(LineSegmentData* pLineSeg);
	LineSegmentData* GetLineSegmentData();

	int32_t PutTrendCentralData(TrendCentralData* pTC);
	TrendCentralData* GetTrendCentralData();

	int32_t PutMissingKline(MissingKline* pFeatureSeq);
	MissingKline* GetMissingKline();

	bool JudgeContinueKlines(const string& code, int32_t last_ts, int32_t this_ts);
	int32_t GetLastKlineTs(const string& code, int32_t this_ts);
	int32_t GetNextKlineTs(const string& code, int32_t this_ts);

private:
	otl_connect m_otl_connect;
	string log_path;
	string log_level;
	string connect_str;
	string trade_codes;
	char db_name[24];
	bool need_reconnect;

	static ZenTheory *_ns;
};


#endif	// __ZENTHEORY_H__

