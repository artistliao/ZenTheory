#ifndef __MARKET_DATA_H__
#define __MARKET_DATA_H__

#include "stdafx.h"
#include "ZenTheory.h"
#include "ThostFtdcMdApi.h"
#include "ThostFtdcTraderApi.h"

class MarketData
{
public:
	MarketData();
	~MarketData();

public:
	static int32_t AnalysisMarketData(CThostFtdcDepthMarketDataField* pDmd1, CThostFtdcDepthMarketDataField* pDmd2, MarketDataAnalysis* pMda);
};
 
#endif	// __MARKET_DATA_H__

