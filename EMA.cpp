#include "stdafx.h"
#include "ZenTheory.h"
#include "EMA.h"

EMA::EMA()
{
	
}

EMA::~EMA()
{
}

////计算ema，返回值：0:成功, -1:错误
//int32_t EMA::CalcEMA(vector<double>& inputDatas, int32_t iPeriod, vector<double>& outputDatas) {
//	double inputData = 0.0;
//	double lastEma = 0.0;
//	double ema = 0.0;
//	double period = double(iPeriod);
//	size_t inputSize = inputDatas.size();
//	for (size_t i = 0; i < inputSize; i++) {
//		inputData = inputDatas[i];
//		if (i == 0) {
//			outputDatas.push_back(inputData);
//			lastEma = inputData;
//			continue;
//		}
//
//		ema = (2.0 * inputData + (period - 1.0) * lastEma) / (period + 1.0);
//		outputDatas.push_back(ema);
//		lastEma = ema;
//	}
//
//	return 0;
//}

//计算ema，返回值：0:成功, -1:错误
int32_t EMA::CalcEMA(vector<KlineData*>& inputDatas, int32_t iPeriod, int32_t startIdx) {
	double inputData = 0.0;
	double lastEma = 0.0;
	double ema = 0.0;
	double period = double(iPeriod);
	int32_t inputSize = inputDatas.size();
	for (int32_t i = startIdx; i < inputSize; i++) {
		inputData = inputDatas[i]->close;
		if (i == 0) {
			if (iPeriod == 12) {
				inputDatas[i]->ema12 = inputData;
			} else if (iPeriod == 26) {
				inputDatas[i]->ema26 = inputData;
			}
			
			continue;
		}

		if (iPeriod == 12) {
			lastEma = inputDatas[i-1]->ema12 ;
		}
		else if (iPeriod == 26) {
			lastEma = inputDatas[i-1]->ema26;
		}

		ema = (2.0 * inputData + (period - 1.0) * lastEma) / (period + 1.0);

		if (iPeriod == 12) {
			inputDatas[i]->ema12 = ema;
		}
		else if (iPeriod == 26) {
			inputDatas[i]->ema26 = ema;
		}
	}

	return 0;
}

////计算ema，返回计算的ema值, 小于0则失败
//double EMA::CalcEMA(double lastEma, int32_t iPeriod, double inputData) {
//	double period = double(iPeriod);
//	double ema = (2.0 * inputData + (period - 1.0) * lastEma) / (period + 1.0);
//	return ema;
//}
//
