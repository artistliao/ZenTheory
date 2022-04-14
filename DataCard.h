#ifndef __DATA_CARD_H__
#define __DATA_CARD_H__

class DataCard
{
public:
	DataCard();
	~DataCard();

public:
	//从文件中读取原始数据
	int32_t ReadOriginKlineDataFromFile(const string& dir);

	int32_t ReadLineSegmentFromFile(const string& code, const string& filePath);

	//从数据库中读取原始Kline数据；参数：securitiesType:证券类型，securitiesCode:stock code，period:kline周期；返回值：0:成功, <0:错误
	int32_t ReadOriginKlineDataFromDb(const string& securitiesType, const string& securitiesCode, const string& period, int32_t start_ts);

	int32_t ReadFuturesTickData(const string& name, const string& dir, vector<TickPrice*>& tickDatas);

	//从数据库中读取原始Kline数据；参数：securitiesCode:stock code，period:kline周期, pKline:插入K线数据；返回值：0:成功, <0:错误
	int32_t InserKlineData(const string& code, const string& period, KlineData* pNewKline);

	//计算MACD
	int32_t CalcMACDForOriKlines();

	//合并kline
	int32_t MergeOriginKlineData();

	//对合并后的kline数据进行分型
	int32_t TypingMergeKlineData();

	//将分型后的合并kline数据以文本格式写入文件
	int32_t WriteTypingMergeKlineData(const string& dir);

	//对分型后的数据进行分B
	int32_t GenerateStrokeFromTyping();

	//将分B后的数据以文本格式写入文件
	int32_t WriteStrokeData(const string& dir);

	//对B数据划分L
	int32_t GenerateLineSegmentFromStroke();

 
	//将L数据以文本格式写入文件
	int32_t WriteLineSegment(const string& dir);

	//从L数据划分TT
	int32_t DivideTrendCentralFromLineSegment();

	int32_t DivideTrendCentralFromStroke();

	//从TT数据划分TT
	int32_t DivideTrendTypeFromTrendCentral();

	// 
	int32_t DivideTrendCentralAndTrendType();

	//将TT数据以文本格式写入文件
	int32_t WriteTrendCentral(const string& dir); 

	//将TT数据以文本格式写入文件
	int32_t WriteTrendType(const string& dir);

	int32_t DivergenceHandle();
	
	int32_t WriteDivergence();

	int32_t WriteOrder(const string& dir);

	bool JudgeWrite(const string& code);

	int32_t StatCriticalValues(const string& code, const string& period);

};

#endif	// __DATA_CARD_H__

