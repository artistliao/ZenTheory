#ifndef _ZEN_SCHEDULE_H__
#define _ZEN_SCHEDULE_H__

//缠论处理调度类
class ZenSchedule
{
public:
	ZenSchedule(map<string, string> &trade_code_types);
	~ZenSchedule();

public:

	int32_t ReadOriginKlineDataFromDb(const string& securitiesType, const string& securitiesCode, const string& period, int32_t startTs);

	// 
	int32_t CalcMACDForOriKlines(const string& code, const string& period);

	//合并kline
	int32_t MergeOriginKlineData(const string& code, const string& period);

	//对合并后的kline数据进行分型
	int32_t TypingMergeKlineData(const string& code, const string& period);

	//对分型后的数据进行分B
	int32_t GenerateStrokeFromTyping(const string& code, const string& period);

	//对B数据划分L
	int32_t GenerateLineSegmentFromStroke(const string& code, const string& period);

	//从L数据划分TT
	int32_t DivideTrendCentralFromLineSegment(const string& code, const string& period);

	int32_t DivideTrendCentralFromStroke(const string& code, const string& period);

	int32_t DivergenceHandle(const string& code, const string& period);

	int32_t TradeProcessHandle(const string& code, const string& period);

public:
	map<string, string> m_trade_code_types;
	//vector<string> m_trade_periods = { "1min", "5min"};

};

#endif	// _ZEN_SCHEDULE_H__

