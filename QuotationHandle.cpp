#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "DataCard.h"
#include "QuotationHandle.h"

#include <grpcpp/grpcpp.h>

#ifdef BAZEL_BUILD
#include "examples/protos/zen_data_svr.grpc.pb.h"
#else
#include "zen_data_svr.grpc.pb.h"
#endif

using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;
using ::google::protobuf::RepeatedField;
using ::google::protobuf::RepeatedPtrField;
using zen_data_svr::AskKlineReq;
using zen_data_svr::AskKlineRsp;
using zen_data_svr::Kline;
using zen_data_svr::ZendataHandle;

class ZendataHandleClient {
public:
	ZendataHandleClient(std::shared_ptr<Channel> channel)
		: stub_(ZendataHandle::NewStub(channel)) {}

	int32_t AskKlineData(const MissingKline* pMissKline) {
		if (!pMissKline) {
			SPDLOG_WARN("pMissKline is NULL!");
			return -1;
		}

		ZenTheory* ns = ZenTheory::get_instance();
		DataCard dc;
		AskKlineReq request;
		request.set_code(pMissKline->code);
		request.set_period(pMissKline->period);
		request.set_sec_type(pMissKline->sec_type);
		request.set_from_ts(pMissKline->from_ts);
		request.set_to_ts(pMissKline->to_ts);

		AskKlineRsp reply;
		ClientContext context;
		Status status = stub_->AskKlineData(&context, request, &reply);

		if (status.ok()) {
			int32_t iStatus = reply.status();
			string message = reply.message();
			string code = reply.code();
			string period = reply.period();
			string sec_type = reply.sec_type();
			int32_t ts = 0;
			int32_t iRet = 0;
			KlineData* pKline = nullptr;

			const RepeatedPtrField<Kline>& klines = reply.klines();
			for (const Kline& kline : klines) {
				KlineData* pNewKline = ns->GetKlineData();
				ts = kline.ts();
				pNewKline->starttime = Utils::TsToIntTime(ts);
				pNewKline->endtime = Utils::TsToIntTime(ts+60);
				pNewKline->open = kline.open();
				pNewKline->high = kline.high();
				pNewKline->low = kline.low();
				pNewKline->close = kline.close();
				pNewKline->vol = kline.vol();
				pNewKline->amount = kline.amount();

				iRet = dc.InserKlineData(code, period, pNewKline);
				if (iRet < 0) {
					ns->PutKlineData(pNewKline);
				}
			}

			//int32_t klines_size = reply.klines_size();
			//for (int32_t i = 0; i < klines_size; i++) {
			//	Kline& kline = reply.klines(i);
			//}
		 
			return 0;
		}
		else {
			SPDLOG_WARN("AskKlineData error_code:{}, error_message:{}", status.error_code(), status.error_message());
			return -1;
		}
	}

private:
	std::unique_ptr<ZendataHandle::Stub> stub_;
};


void JQuantDataHandle() {
	SPDLOG_INFO("JQuantDataHandle start!");
	ZenTheory* ns = ZenTheory::get_instance();

	ZendataHandleClient zdhClient(grpc::CreateChannel(
		"127.0.0.1:18101", grpc::InsecureChannelCredentials()));
	int32_t iRet = 0;
	while (true) {
		if (ns->LoadKlineEnd == 0) {
			Sleep(3000);
			continue;
		}

		try {
			std::lock_guard<std::mutex> lock(ns->pending_missing_kline_mtx);
			int32_t missing_kline_size = ns->PendingMissingKlines.size();
			if (missing_kline_size > 0) {
				MissingKline* pMissKline = nullptr;
				for (int32_t i = 0; i < missing_kline_size; i++) {
					pMissKline = ns->PendingMissingKlines[i];
					if (!pMissKline) {
						SPDLOG_WARN("pMissKline is NULL, i:{}", i);
						continue;
					}

					iRet = zdhClient.AskKlineData(pMissKline);
					if (iRet < 0) {
						SPDLOG_WARN("AskKlineData iRet:{}, code:{}, int32_t:{}", iRet, pMissKline->code, Utils::TsToIntTime(pMissKline->from_ts));
					}

					ns->PutMissingKline(pMissKline);
				}

				ns->PendingMissingKlines.clear();
			}		
		}
		catch (std::exception& e)
		{
			cerr << "JQuantDataHandle exception: " << e.what() << endl;
			SPDLOG_ERROR("JQuantDataHandle exception:{}", e.what());
		}

		Sleep(500);
	}
}


void MissingKlineCheck() {
	SPDLOG_INFO("MissingKlineCheck start!");
	ZenTheory* ns = ZenTheory::get_instance();

	while (true) {
		if (ns->LoadKlineEnd == 0) {
			Sleep(3000);
			continue;
		}

		try {
			for (auto& tct : ns->m_trade_code_types) {
				auto pTM = ns->TaskManages[tct.first];
				std::lock_guard<std::mutex> lock(ns->pending_missing_kline_mtx);
				std::lock_guard<std::mutex> lck(*(pTM->th_mutex));
				//pTM->th_mutex->lock();
				//SPDLOG_WARN("mutex lock");

				auto pSecu = ns->m_futures_code_map[tct.first];
				if (!pSecu) {
					SPDLOG_ERROR("m_futures_code_map not find:{}", tct.first);
					//pTM->th_mutex->unlock();
					//SPDLOG_WARN("mutex unlock");
					return;
				}

				int32_t now_ts = int32_t(time(NULL));
				now_ts -= now_ts % 60;

				vector<KlineData*>& oriKlines = ns->OriKlines[tct.first]["1min"];
				int32_t ori_kline_size = oriKlines.size();
				KlineData* pKline = oriKlines.back();

				int32_t kline_ts = Utils::IntTimeToTs(pKline->starttime);
				int32_t nextKlineTs = ns->GetNextKlineTs(tct.first, kline_ts);
				if (nextKlineTs < 0) {
					SPDLOG_ERROR("error nextKlineTs:{}, code:{}, kline_ts:{}", nextKlineTs, tct.first, kline_ts);
					//pTM->th_mutex->unlock();
					//SPDLOG_WARN("mutex unlock");
					continue;
				}

				if (nextKlineTs > (now_ts+60)){
					//pTM->th_mutex->unlock();
					//SPDLOG_WARN("mutex unlock");
					continue;
				}
				else {
					//将要同步的kline信息放入PendingMissingKlines
					MissingKline* pMissKline = ns->GetMissingKline();
					snprintf(pMissKline->code, sizeof(pMissKline->code), "%s", tct.first.c_str());
					snprintf(pMissKline->period, sizeof(pMissKline->period), "1min");
					snprintf(pMissKline->sec_type, sizeof(pMissKline->sec_type), "futures");
					pMissKline->from_ts = kline_ts;
					pMissKline->to_ts = now_ts;
					//for test
					//pMissKline->to_ts = nextKlineTs;
					ns->PendingMissingKlines.push_back(pMissKline);
				}

				//pTM->th_mutex->unlock();
				//SPDLOG_WARN("mutex unlock");
			}
		}
		catch (std::exception& e)
		{
			cerr << "MissingKlineCheck exception: " << e.what() << endl;
			SPDLOG_ERROR("MissingKlineCheck exception:{}", e.what());
		}

		Sleep(500);
	}
}

