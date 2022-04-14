#ifndef _THOST_FTDC_HANDLE_H__
#define _THOST_FTDC_HANDLE_H__

#include "ThostFtdcMdApi.h"

class CZenThostFtdcMdSpi : public CThostFtdcMdSpi 
{
public:
	CZenThostFtdcMdSpi();
	~CZenThostFtdcMdSpi();

public:
	void Connect();
	void Login();
	void Subscribe();
	void OnRspUserLogin(CThostFtdcRspUserLoginField* pRspUserLogin, CThostFtdcRspInfoField* pRspInfo, int nRequestID, bool bIsLast);
	void OnRtnDepthMarketData(CThostFtdcDepthMarketDataField* pDepthMarketData);
	void OnRspSubMarketData(CThostFtdcSpecificInstrumentField* pSpecificInstrument, CThostFtdcRspInfoField* pRspInfo, int nRequestID, bool bIsLast);
	void OnRspQryMulticastInstrument(CThostFtdcMulticastInstrumentField* pMulticastInstrument, CThostFtdcRspInfoField* pRspInfo, int nRequestID, bool bIsLast);

public:
	CThostFtdcMdApi* m_mdApi;
};

void CtpQuotationHandle();

#endif	// _THOST_FTDC_HANDLE_H__

