#ifndef __MACD_H__
#define __MACD_H__

#include "stdafx.h"
#include "ZenTheory.h"
#include "EMA.h"

//MACD计算模板类
template<class T_DATA>
class MACD
{
public:
	MACD();
	~MACD();

public:
	//Kline计算MACD
	static int32_t CalcMACD(vector<T_DATA*>& klineDatas);

};

template<class T_DATA>
MACD<T_DATA>::MACD()
{

}

template<class T_DATA>
MACD<T_DATA>::~MACD()
{

}

template<class T_DATA>
int32_t MACD<T_DATA>::CalcMACD(vector<T_DATA*>& klineDatas) {
	int32_t klineDataSize = klineDatas.size();

	//vector<double> inputDatas;
	T_DATA* pKline = NULL;
	int32_t start_idx = -1;
	for (int32_t i = (klineDataSize-1); i>=0; i--) {
		pKline = klineDatas[i];
		//inputDatas.push_back(pKline->close);
		start_idx = i;
		if ((Utils::DoubleCmp(pKline->ema12, 0) != 0) && (Utils::DoubleCmp(pKline->ema26, 0) != 0)) {
			break;
		}
		
	}

	if (start_idx == -1) {
		return -1;
	}

	EMA ema;
	ema.CalcEMA(klineDatas, 12, start_idx);
	ema.CalcEMA(klineDatas, 26, start_idx);

	for (int32_t i = start_idx; i < klineDataSize; i++) { 
		pKline = klineDatas[i];
		pKline->dif = pKline->ema12 - pKline->ema26;
		if (i == 0) {
			pKline->dea = pKline->dif;
		} else {
			pKline->dea = ((klineDatas[i-1]->dea)*8.0 + (pKline->dif)*2.0)*0.1;
		}

		pKline->macd = 2.0*(pKline->dif - pKline->dea);
	}

	return 0;
}


#endif	// __MACD_H__

