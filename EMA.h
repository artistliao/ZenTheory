#ifndef __EMA_H__
#define __EMA_H__

//
class EMA
{
public:
	EMA();
	~EMA();

public:
	//计算ema，返回值：0:成功, -1:错误
	//static int32_t CalcEMA(vector<double>& inputDatas, int32_t iPeriod, vector<double>& outputDatas);

	static int32_t CalcEMA(vector<KlineData*>& inputDatas, int32_t iPeriod, int32_t startIdx);

	//计算ema，返回计算的ema值
	//static double CalcEMA(double lastEma, int32_t iPeriod, double inputData);

};

#endif	// __EMA_H__

