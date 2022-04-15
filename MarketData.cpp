
#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "MarketData.h"

MarketData::MarketData()
{

}

MarketData::~MarketData()
{
}

int32_t MarketData::AnalysisMarketData(CThostFtdcDepthMarketDataField* pDmd1, CThostFtdcDepthMarketDataField* pDmd2, MarketDataAnalysis* pMda) {
	int32_t min_price = pDmd1->BidPrice1 <= pDmd2->BidPrice1 ? pDmd1->BidPrice1 : pDmd2->BidPrice1;
	int32_t max_price = pDmd1->AskPrice1 >= pDmd2->AskPrice1 ? pDmd1->AskPrice1 : pDmd2->AskPrice1;
	int32_t price_num = max_price - min_price + 1;
	int32_t price_vol[512][2] = { 0 };


	return 0;
}

