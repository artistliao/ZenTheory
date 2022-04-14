#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "DataCard.h"
#include "NoticeHandle.h"

#include <grpcpp/grpcpp.h>

#ifdef BAZEL_BUILD
#include "examples/protos/zen_notice.grpc.pb.h"
#else
#include "zen_notice.grpc.pb.h"
#endif

using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;
using ::google::protobuf::RepeatedField;
using ::google::protobuf::RepeatedPtrField;
using zen_notice::NoticeLineReq;
using zen_notice::NoticeLineRsp;
using zen_notice::NoticeDrawReq;
using zen_notice::NoticeDrawRsp;
using zen_notice::NoticeTradeReq;
using zen_notice::NoticeTradeRsp;
using zen_notice::ZenNoticeHandle;

class ZenNoticeHandleClient {
public:
	ZenNoticeHandleClient(std::shared_ptr<Channel> channel)
		: stub_(ZenNoticeHandle::NewStub(channel)) {}

	int32_t DoNoticeLine(const NoticeLine* pNotice) {
		if (!pNotice) {
			SPDLOG_WARN("pNotice is NULL!");
			return -1;
		}

		ZenTheory* ns = ZenTheory::get_instance();
		//DataCard dc;
		NoticeLineReq request;
		request.set_code(pNotice->code);
		request.set_sec_type(pNotice->sec_type);
		//request.set_name(pNotice->name);
		request.set_period(pNotice->period);
		request.set_trigger_ts(pNotice->trigger_ts);
		request.set_direction(pNotice->direction);
		request.set_line_start_ts(pNotice->line_start_ts);
		request.set_line_end_ts(pNotice->line_end_ts);
		request.set_high(pNotice->high);
		request.set_low(pNotice->low);
		request.set_kline_start_ts(pNotice->kline_start_ts);

		NoticeLineRsp reply;
		ClientContext context;
		Status status = stub_->NoticeLine(&context, request, &reply);

		if (status.ok()) {
			int32_t iStatus = reply.status();
			string message = reply.message();
			SPDLOG_INFO("Send NoticeLine success, code:{}, period:{}, direction:{}, starttime:{}, endtime:{}, high:{}, low:{}",
				pNotice->code, pNotice->period, pNotice->direction, Utils::TsToIntTime(pNotice->line_start_ts) , Utils::TsToIntTime(pNotice->line_end_ts), 
				pNotice->high, pNotice->low);
			SPDLOG_INFO("NoticeLine status:{}, message:{}", iStatus, message);
			return 0;
		}
		else {
			SPDLOG_WARN("NoticeLine error_code:{}, error_message:{}", status.error_code(), status.error_message());
			return -1;
		}
	}

	int32_t DoNoticeDraw(const NoticeDraw* pNotice) {
		if (!pNotice) {
			SPDLOG_WARN("pNotice is NULL!");
			return -1;
		}

		ZenTheory* ns = ZenTheory::get_instance();
		DataCard dc;
		NoticeDrawReq request;
		request.set_code(pNotice->code);
		request.set_name(pNotice->name);
		request.set_period(pNotice->period);

		NoticeDrawRsp reply;
		ClientContext context;
		Status status = stub_->NoticeDraw(&context, request, &reply);

		if (status.ok()) {
			int32_t iStatus = reply.status();
			string message = reply.message();
			SPDLOG_INFO("NoticeDraw status:{}, message:{}", iStatus, message);
			return 0;
		}
		else {
			SPDLOG_WARN("NoticeDraw error_code:{}, error_message:{}", status.error_code(), status.error_message());
			return -1;
		}
	}

	int32_t DoNoticeTrade(const NoticeTrade* pNotice) {
		if (!pNotice) {
			SPDLOG_WARN("pNotice is NULL!");
			return -1;
		}

		ZenTheory* ns = ZenTheory::get_instance();
		DataCard dc;
		NoticeTradeReq request;
		request.set_code(pNotice->code);
		request.set_sec_type(pNotice->sec_type);
		request.set_name("");
		request.set_period(pNotice->period);
		request.set_trade_type(pNotice->trade_type);
		request.set_open_cover_type(pNotice->open_cover_type);
		request.set_direction(pNotice->direction);
		request.set_trigger_ts(pNotice->trigger_ts);
		request.set_kline_start_ts(pNotice->kline_start_ts);
		request.set_price(pNotice->price);
		request.set_stop_loss_price(pNotice->stop_loss_price);
		request.set_ext_info(pNotice->ext_info);

		NoticeTradeRsp reply;
		ClientContext context;
		Status status = stub_->NoticeTrade(&context, request, &reply);

		if (status.ok()) {
			int32_t iStatus = reply.status();
			string message = reply.message();
			SPDLOG_INFO("NoticeTrade status:{}, message:{}", iStatus, message);
			return 0;
		}
		else {
			SPDLOG_WARN("NoticeTrade error_code:{}, error_message:{}", status.error_code(), status.error_message());
			return -1;
		}
	}

private:
	std::unique_ptr<ZenNoticeHandle::Stub> stub_;
};


void ZenNoticeThreadHandle() {
	SPDLOG_INFO("ZenNoticeThreadHandle start!");
	ZenTheory* ns = ZenTheory::get_instance();

	ZenNoticeHandleClient zdhClient(grpc::CreateChannel(
		"127.0.0.1:18102", grpc::InsecureChannelCredentials()));
	int32_t iRet = 0;
	while (true) {
		try {
			std::lock_guard<std::mutex> lock(ns->notice_mtx);
			int32_t notice_line_size = ns->NoticeLines.size();
			if (notice_line_size > 0) {
				NoticeLine* pNoticeLine = nullptr;
				for (int32_t i = 0; i < notice_line_size; i++) {
					pNoticeLine = ns->NoticeLines[i];
					if (!pNoticeLine) {
						SPDLOG_WARN("pNoticeKline is NULL, i:{}", i);
						continue;
					}

					iRet = zdhClient.DoNoticeLine(pNoticeLine);
					if (iRet < 0) {
						SPDLOG_WARN("DoNoticeLine iRet:{}, code:{}, period:{}", iRet, pNoticeLine->code, pNoticeLine->period);
					}

					delete pNoticeLine;
				}

				ns->NoticeLines.clear();
			}

			int32_t notice_draw_size = ns->NoticeDraws.size();
			if (notice_draw_size > 0) {
				NoticeDraw* pNoticeDraw = nullptr;
				for (int32_t i = 0; i < notice_draw_size; i++) {
					pNoticeDraw = ns->NoticeDraws[i];
					if (!pNoticeDraw) {
						SPDLOG_WARN("pNoticeDraw is NULL, i:{}", i);
						continue;
					}

					iRet = zdhClient.DoNoticeDraw(pNoticeDraw);
					if (iRet < 0) {
						SPDLOG_WARN("DoNoticeDraw iRet:{}, code:{}, period:{}", iRet, pNoticeDraw->code, pNoticeDraw->period);
					}

					delete pNoticeDraw;
				}

				ns->NoticeDraws.clear();
			}

			int32_t notice_trade_size = ns->NoticeTrades.size();
			if (notice_trade_size > 0) {
				NoticeTrade* pNoticeTrade = nullptr;
				for (int32_t i = 0; i < notice_trade_size; i++) {
					pNoticeTrade = ns->NoticeTrades[i];
					if (!pNoticeTrade) {
						SPDLOG_WARN("pNoticeTrade is NULL, i:{}", i);
						continue;
					}

					iRet = zdhClient.DoNoticeTrade(pNoticeTrade);
					if (iRet < 0) {
						SPDLOG_WARN("DoNoticeTrade iRet:{}, code:{}, period:{}", iRet, pNoticeTrade->code, pNoticeTrade->period);
					}

					delete pNoticeTrade;
				}

				ns->NoticeTrades.clear();
			}

		}
		catch (std::exception& e)
		{
			cerr << "ZenNoticeThreadHandle exception: " << e.what() << endl;
			SPDLOG_ERROR("ZenNoticeThreadHandle exception:{}", e.what());
		}

		Sleep(1000);
	}
}

