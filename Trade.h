#ifndef _TRADE_H__
#define _TRADE_H__

// 
class TradeHandle
{
public:
	TradeHandle();
	~TradeHandle();

public:
	//
	//static int32_t FirstClassBSPointHandle(const string& code);
	//static int32_t SecondClassBSPointHandle(const string& code);
	//static bool JudgeSecondClassBSPoint(LineSegmentData* line1, LineSegmentData* line2, int32_t type);

	static int32_t TradeStrategyHandle(const string& code, const string& period);
	//static bool JudgeThirdClassBSPoint(LineSegmentData* pLine, TrendCentralData* pTC, int32_t type);
	static bool JudgeThirdClassBSPoint(StrokeData* pLine, TrendCentralData* pTC, int32_t type);
	static bool JudgeTrendBSPoint(StrokeData* pStroke, TrendCentralData* pTC);
	static double GetStopLossPrice(StrokeData* pStroke, KlineData* pKline);
	static double CorrectStopLossPrice(StrokeData* pStroke, KlineData* pKline);
	static void CoverOrder(Order* pOrder, KlineData* pKline, int32_t cover_price_type, bool& haveProcessingOrder);
	static void PutNoticeTrade(Order* pOrder, KlineData* pKline, const string& period);

	static bool JudgeMACD(KlineData* pKline, int32_t direction, double macd_critical);
	static bool JudgePrice(StrokeData* pStroke, KlineData* pKline);
	static bool JudgeDivergence(StrokeData* pStroke1, StrokeData* pStroke2, const string& code, const string& period, int32_t direction);
	static double GetLimitMACD(StrokeData* pStroke, const string& code, const string& period);
	static int32_t JudgeTCRelation(TrendCentralData* frontTC, TrendCentralData* nextTc);

};

#endif	// _TRADE_H__

