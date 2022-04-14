#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "ThostFtdcHandle.h"
#include "ThostFtdcMdApi.h"
#include "ThostFtdcTraderApi.h"

CZenThostFtdcMdSpi::CZenThostFtdcMdSpi()
{
	m_mdApi = CThostFtdcMdApi::CreateFtdcMdApi(".//flow_md/", true, true);
	cout << "版本号为:" << m_mdApi->GetApiVersion() << endl;
}

CZenThostFtdcMdSpi::~CZenThostFtdcMdSpi()
{
}

void CZenThostFtdcMdSpi::Connect() {
	//创建并初始化API
	m_mdApi->RegisterSpi(this);
	//m_mdApi->RegisterFront("tcp://180.168.146.187:10010");
	m_mdApi->RegisterFront("tcp://180.168.146.187:10212");
	m_mdApi->Init();
	printf("获取当前交易日期:%s\n", m_mdApi->GetTradingDay());
}

//登陆
void CZenThostFtdcMdSpi::Login() {
	CThostFtdcReqUserLoginField t = { 0 };
	strcpy(t.UserID, "156146");
	strcpy(t.BrokerID, "9999");
	strcpy(t.Password, "Cass@#2021");
	while (m_mdApi->ReqUserLogin(&t, 1) != 0) {
		printf("ReqUserLogin not success!\n");
		Sleep(1000);
	}

	printf("ReqUserLogin success!\n");
}

// 订阅行情
void CZenThostFtdcMdSpi::Subscribe() {

	char** ppInstrument = new char* [50];
	ppInstrument[0] = "rb2110";
	ppInstrument[1] = "j2109";
	ppInstrument[2] = "cu2107";
	ppInstrument[3] = "IF2106";
	ppInstrument[4] = "IC2106";
	while (m_mdApi->SubscribeMarketData(ppInstrument, 5) != 0) { 
		printf("SubscribeMarketData not success!\n");
		Sleep(1000); 
	}

	//CThostFtdcQryMulticastInstrumentField a = { 0 };
	//a.TopicID = 1001;//对应上期所的组播行情topic
	////a.TopicID = 5001;//对应原油交易所的组播行情topic
	////strcpy_s(g_chInstrumentID, "cu1906");
	////m_mdApi->ReqQryMulticastInstrument(&a, 100);
	//while (m_mdApi->ReqQryMulticastInstrument(&a, 100) != 0) {
	//	printf("ReqQryMulticastInstrument not success!\n");
	//	Sleep(1000);
	//}

	printf("Subscribe success!\n");
}

//接收登录回调
void CZenThostFtdcMdSpi::OnRspUserLogin(CThostFtdcRspUserLoginField* pRspUserLogin, CThostFtdcRspInfoField* pRspInfo, int nRequestID, bool bIsLast) {
	printf("OnRspUserLogin\n");
}

//接收深度行情
void CZenThostFtdcMdSpi::OnRtnDepthMarketData(CThostFtdcDepthMarketDataField* pDepthMarketData) {
	//printf("OnRtnDepthMarketData\n");
	//cout << std::fixed << std::setprecision(2) << "TradingDay:" << pDepthMarketData->TradingDay << ", ExchangeID:" << pDepthMarketData->ExchangeID 
	//	<< ", InstrumentID:" << pDepthMarketData->InstrumentID
	//	<< ", LastPrice:" << pDepthMarketData->LastPrice << ", Volume:" << pDepthMarketData->Volume << ", Turnover:" << pDepthMarketData->Turnover 
	//	<< ", UpdateTime:" << pDepthMarketData->UpdateTime << ", UpdateMillisec:" << pDepthMarketData->UpdateMillisec << endl;
	SPDLOG_WARN("OnRtnDepthMarketData InstrumentID:{}, LastPrice:{}, UpdateTime:{}, UpdateMillisec:{}, Volume:{}, Turnover:{}", pDepthMarketData->InstrumentID, 
		pDepthMarketData->LastPrice, pDepthMarketData->UpdateTime, pDepthMarketData->UpdateMillisec, pDepthMarketData->Volume, pDepthMarketData->Turnover);;
}

//接收行情
void CZenThostFtdcMdSpi::OnRspSubMarketData(CThostFtdcSpecificInstrumentField* pSpecificInstrument, CThostFtdcRspInfoField* pRspInfo, int nRequestID, bool bIsLast) {
	printf("OnRspSubMarketData\n");
	cout << "InstrumentID:" << pSpecificInstrument->InstrumentID   << endl;
}

void CZenThostFtdcMdSpi::OnRspQryMulticastInstrument(CThostFtdcMulticastInstrumentField* pMulticastInstrument, CThostFtdcRspInfoField* pRspInfo, int nRequestID, bool bIsLast) {
	printf("OnRspQryMulticastInstrument\n");
	cout << "TopicID:" << pMulticastInstrument->TopicID << ", InstrumentNo:" << pMulticastInstrument->InstrumentNo 
		<< ", InstrumentID:" << pMulticastInstrument->InstrumentID << endl;
}


void CtpQuotationHandle() {
	CZenThostFtdcMdSpi *pZtfm = new CZenThostFtdcMdSpi;
	pZtfm->Connect();
	pZtfm->Login();
	pZtfm->Subscribe();

	while (true) {
		Sleep(3000);
	}
}

