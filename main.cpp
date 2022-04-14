
#include "stdafx.h"
#include "ZenTheory.h"
#include "KlineGenerate.h"
#include "DataCard.h"
#include "Typing.h"
#include "EncodeTransform.h"
#include "Utils.h"
#include "ZenSchedule.h"
#include "ThostFtdcHandle.h"
#include "QuotationHandle.h"
#include "NoticeHandle.h"


#include <iostream>
#include <memory>
#include <string>
#include <grpcpp/grpcpp.h>

#ifdef BAZEL_BUILD
#include "examples/protos/secdata_transfer.grpc.pb.h"
#else
#include "secdata_transfer.grpc.pb.h"
#endif

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;
using secdata_transfer::KlineRequest;
using secdata_transfer::KlineReply;
using secdata_transfer::SecdataHandle;

int counter = 0;
std::mutex mtx;
void func();
int32_t testMutex();
int32_t testOrderId();
int32_t TickAnalysis();

// Logic and data behind the server's behavior.
class SecdataHandleServiceImpl final : public SecdataHandle::Service {
	Status TransferKlineData(ServerContext* context, const KlineRequest* request,
		KlineReply* reply) override {
		ZenTheory* ns = ZenTheory::get_instance();
		int32_t ts = request->ts();
		string code = request->code();
		string period = request->period();
		double open = request->open();
		double high = request->high();
		double low = request->low();
		double close = request->close();
		double amount = request->amount();
		int64_t vol = request->vol();

		int32_t handleType = 0; // 1:增加 2：更新
		int32_t index = -1;
		KlineData* pKline = nullptr;
		vector<KlineData*> &oriKlines = ns->OriKlines[code][period];
		if (oriKlines.size() == 0) {
			handleType = 1;
			//pKline = ns->GetKlineData();
			pKline = new KlineData;
		}
		else {
			pKline = *(oriKlines.rbegin());
			index = pKline->index;
			int64_t starttime = pKline->starttime;
			int32_t last_ts = Utils::IntTimeToTs(starttime);
			if (ts == last_ts) {
				handleType = 2;
			}
			else if (ts > last_ts) {
				handleType = 1;
				//pKline = ns->GetKlineData();
				pKline = new KlineData;;
			}
		}

		if ((handleType == 1) || (handleType == 2)) {
			
			while (true)
			{
				auto pTM = ns->TaskManages[code];
				if (!pTM->update) {
					std::lock_guard<std::mutex> lck(*(pTM->th_mutex));
					pKline->open = open;
					pKline->high = high;
					pKline->low = low;
					pKline->close = close;
					pKline->vol = vol;
					pKline->amount = amount;
					pKline->dif = 0.0;
					pKline->dea = 0.0;
					pKline->macd = 0.0;
					pKline->ema12 = 0.0;
					pKline->ema26 = 0.0;

					if (handleType == 1) {
						pKline->index = index + 1;
						pKline->starttime = Utils::TsToIntTime(ts);
						pKline->endtime = Utils::TsToIntTime(ts + 60);
						oriKlines.push_back(pKline);
					}

					pTM->update = true;
					break;
				}

				std::this_thread::sleep_for(std::chrono::microseconds(100));
			}
			
		}

		if (oriKlines.size()%10000 == 0) {
			SPDLOG_INFO("oriKlines.size:{}", oriKlines.size());;
		}

		reply->set_status(0);
		reply->set_message("ok");
		return Status::OK;
	}
};

void RunServer() {
	try {
		std::string server_address("0.0.0.0:50051");
		SecdataHandleServiceImpl service;

		ServerBuilder builder;
		// Listen on the given address without any authentication mechanism.
		builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
		// Register "service" as the instance through which we'll communicate with
		// clients. In this case it corresponds to an *synchronous* service.
		builder.RegisterService(&service);
		// Finally assemble the server.
		std::unique_ptr<Server> server(builder.BuildAndStart());
		SPDLOG_INFO("Server listening on {}", server_address);
		std::cout << "Server listening on " << server_address << std::endl;

		// Wait for the server to shutdown. Note that some other thread must be
		// responsible for shutting down the server for this call to ever return.
		server->Wait();
	}
	catch (std::exception& e)
	{
		cerr << "RunServer exception: " << e.what() << endl;
		SPDLOG_ERROR("RunServer exception:{}", e.what());
	}
}

int32_t TraditionAnalysis() {
	ZenTheory* ns = ZenTheory::get_instance();
	//EncodeTransform et;
	//et.EncodeOriginFilesFromGBKToUTF8("E:\\otherdata\\stock_data\\1min\\origin\\", "E:\\otherdata\\stock_data\\1min\\utf8\\");
	//return 0;

	KlineGenerate kg;
	//kg.GenerateNewKlineAndSaveToDB("index","000001.XSHG", "5min");
	//kg.GenerateNewKlineAndSaveToDB("futures","RB8888.XSGE", "5min");
	//return 0;

	DataCard dc;
	for (auto& code_type : ns->m_trade_code_types) {
		string code = code_type.first;
		string type = code_type.second;
		SPDLOG_INFO("ReadOriginKlineDataFromDb code:{}, type:{}", code, type);
		for (auto& period : ns->m_period_lengths) {
			dc.ReadOriginKlineDataFromDb(type, code, period.first, 1577808000);
		}
	}

	dc.CalcMACDForOriKlines();
	//return 0;

	//dc.ReadOriginKlineDataFromFile("E:\\otherdata\\stock_data\\1min\\utf8\\");
	//dc.CalcMACDForOriKlines();
	//return 0;

	dc.MergeOriginKlineData();
	dc.TypingMergeKlineData();
	dc.GenerateStrokeFromTyping();
	//return 0;
	dc.GenerateLineSegmentFromStroke();
	dc.DivideTrendCentralFromStroke();
	//dc.DivideTrendTypeFromTrendCentral();
	dc.DivergenceHandle();

	dc.WriteTypingMergeKlineData("E:\\otherdata\\stock_data\\");
	dc.WriteStrokeData("E:\\otherdata\\stock_data\\");
	dc.WriteLineSegment("E:\\otherdata\\stock_data\\");
	dc.WriteTrendCentral("E:\\otherdata\\stock_data\\");
	dc.WriteTrendType("E:\\otherdata\\stock_data\\");
	//dc.WriteDivergence();
	return 0;
}

int32_t TickAnalysis() {
	ZenTheory* ns = ZenTheory::get_instance();

	DataCard dc;
	dc.ReadFuturesTickData("hc", "E:\\otherdata\\quant_data", ns->HCTickDatas);
	dc.ReadFuturesTickData("rb", "E:\\otherdata\\quant_data", ns->RBTickDatas);

	int32_t hc_size = ns->HCTickDatas.size();
	int32_t rb_size = ns->RBTickDatas.size();
	int32_t rb_idx = 0;
	TickPrice* pHcTick = nullptr;
	TickPrice* pRbTick = nullptr;
	bool bFind = false;
	int32_t j = 0;
	for (int32_t i = 0; i < hc_size; i++) {
		pHcTick = ns->HCTickDatas[i];
		bFind = false;
		for (j = rb_idx; j < rb_size; j++) {
			pRbTick = ns->RBTickDatas[j];
			if (pRbTick->tick_time < pHcTick->tick_time) {
				continue;
			} else if (pHcTick->tick_time == pRbTick->tick_time) {
				DiffTickPrice* pDiffPrice = new DiffTickPrice;
				pDiffPrice->tick_time = pHcTick->tick_time;
				pDiffPrice->diff_price = pHcTick->price- pRbTick->price;
				pDiffPrice->hc_price = pHcTick->price ;
				pDiffPrice->rb_price = pRbTick->price ;
				ns->HCRBDiffTickDatas.push_back(pDiffPrice);
				bFind = true;
			}
			else if (pRbTick->tick_time > pHcTick->tick_time) {
				rb_idx = j;
				break;
			}
		}

		//if (!bFind) {
		//	SPDLOG_INFO("not find i:{}, j:{}", i, j);
		//}
	}

	int32_t high_diff = 0;
	int64_t high_time = 0;
	int32_t high_idx = 0;
	int32_t low_diff = 0;
	int64_t low_time = 0;
	int32_t low_idx = 0;
	int32_t idx = -1;
	int32_t trade_idx = -1;
	int32_t trade_direction = 0; //1:向内 2:向外
	int32_t profit = 0; 
	int32_t all_profit = 0; 
	int32_t all_count = 0; 
	int32_t p_count = 0; 
	int32_t n_count = 0; 
	DiffTickPrice* pTrade = nullptr;
	DiffTickPrice* pDiff2 = nullptr;
	for (auto& pDiffPrice : ns->HCRBDiffTickDatas) {
		//if (ns->TickStats.find(pDiffPrice->diff_price) == ns->TickStats.end()) {
		//	ns->TickStats[pDiffPrice->diff_price] = 1;
		//}
		//else {
		//	ns->TickStats[pDiffPrice->diff_price] += 1;
		//}

		idx++;
		if (idx % 10000 == 0) {
			SPDLOG_INFO("idx:{}", idx);
		}

		if (idx==0) {
			high_diff = pDiffPrice->diff_price;
			low_diff = pDiffPrice->diff_price;
			high_time = pDiffPrice->tick_time;
			high_idx = idx;
			low_time = pDiffPrice->tick_time;
			low_idx = idx;
			continue;
		}

		if ((trade_idx != -1) && (pTrade)) {
			if (trade_direction == 1) {
				profit = (pTrade->hc_price - pDiffPrice->hc_price) + (pDiffPrice->rb_price - pTrade->rb_price);
				if (profit >= 22 || profit <= -10) {
					// 
					all_profit += profit;
					all_count += 1;
					if (profit > 0){
						p_count++;
					}
					else {
						n_count++;
					}
					SPDLOG_INFO("trade cover start idx:{}, cover idx:{}, trade_direction:{}, profit:{}", trade_idx, idx, trade_direction, profit);
					trade_idx = -1;
					trade_direction = 0;
					profit = 0;
					pTrade = nullptr;
				} 
			}
			else if (trade_direction == 2)
			{
				profit = (pDiffPrice->hc_price-pTrade->hc_price) + (pTrade->rb_price-pDiffPrice->rb_price);
				if (profit >= 22 || profit <= -10) {
					// 
					all_profit += profit;
					all_count += 1;
					if (profit > 0) {
						p_count++;
					}
					else {
						n_count++;
					}
					SPDLOG_INFO("trade cover start idx:{}, cover idx:{}, trade_direction:{}, profit:{}", trade_idx, idx, trade_direction, profit);
					trade_idx = -1;
					trade_direction = 0;
					profit = 0;
					pTrade = nullptr;
				}
			}
		}

		if (pDiffPrice->diff_price >= high_diff) {
			high_diff = pDiffPrice->diff_price;
			high_idx = idx;
		}
		else if ((idx - high_idx) > 5400) {
			high_diff = 0;
			high_idx = -1;
			for (int32_t i = high_idx + 1; i <= idx; i++) {
				pDiff2 = ns->HCRBDiffTickDatas[i];
				if (pDiff2->diff_price >= high_diff) {
					high_diff = pDiff2->diff_price;
					high_idx = i;
				}
			}
		}

		if (pDiffPrice->diff_price <= low_diff) {
			low_diff = pDiffPrice->diff_price;
			low_idx = idx;
		}
		else if ((idx - low_idx) > 5400) {
			low_diff = 10000;
			low_idx = -1;
			for (int32_t i = low_idx + 1; i <= idx; i++) {
				pDiff2 = ns->HCRBDiffTickDatas[i];
				if (pDiff2->diff_price <= low_diff) {
					low_diff = pDiff2->diff_price;
					low_idx = i;
				}
			}
		}


		if ((pDiffPrice->diff_price - low_diff) >= 40 && (trade_idx == -1)) {
			trade_idx = idx;
			trade_direction = 1;
			pTrade = pDiffPrice;
		}

		if ((high_diff - pDiffPrice->diff_price) >= 40 && (trade_idx == -1)) {
			trade_idx = idx;
			trade_direction = 2;
			pTrade = pDiffPrice;
		}
		
		
	}

	//for (auto& tickStat : ns->TickStats) {
	//	SPDLOG_INFO("tickStat diff:{}, count:{}", tickStat.first, tickStat.second);
	//}
	SPDLOG_INFO("trade all_profit:{}, all_count:{}, p_count:{}, n_count:{}", all_profit, all_count, p_count, n_count);
	return 0;
}


void RealtimeHandle(map<string, string> trade_code_types) {
	try {
		ZenTheory* ns = ZenTheory::get_instance();
		KlineGenerate kg;
		DataCard dc;
		int32_t last_write_ts = 0;
		int32_t now_ts = 0;
		int32_t start_ts = Utils::Load1MinStartTs();
		ZenSchedule zen_sched(trade_code_types);
		for (auto& trade_code_type : zen_sched.m_trade_code_types) {
			for (auto& oneperiod : ns->m_period_lengths) {

				start_ts = ns->StartTs[oneperiod.first];

				//for test
				//start_ts = 1577808000;
				zen_sched.ReadOriginKlineDataFromDb(trade_code_type.second, trade_code_type.first, oneperiod.first, start_ts);
				//vector<KlineData*> vec_klines;
				//ns->OriKlines[trade_code_type.first][oneperiod.first] = vec_klines;
			}
		}

		//dc.ReadLineSegmentFromFile("000001.XSHG", "E:\\otherdata\\stock_data\\1min - trad\\line_segment\\000001.XSHG.txt");
		ns->LoadKlineEnd = 1;

		while (true) {
			for (auto& trade_code_type : zen_sched.m_trade_code_types) {
				auto pTM = ns->TaskManages[trade_code_type.first];
				std::lock_guard<std::mutex> lck(*(pTM->th_mutex));
				if (!pTM->update) {
					Sleep(2);
					continue;
				}

				for (auto& oneperiod : ns->m_period_lengths) {
					if (oneperiod.first == "1min") {
						continue;
					}

					kg.GenerateNewKline(trade_code_type.second, trade_code_type.first, oneperiod.first);
				}

				for (auto& oneperiod : ns->m_period_lengths) {
					//for test
					//if (oneperiod.first != "5min") {
					//	continue;
					//}

					zen_sched.CalcMACDForOriKlines(trade_code_type.first, oneperiod.first);
					zen_sched.MergeOriginKlineData(trade_code_type.first, oneperiod.first);
					zen_sched.TypingMergeKlineData(trade_code_type.first, oneperiod.first);
					zen_sched.GenerateStrokeFromTyping(trade_code_type.first, oneperiod.first);
					zen_sched.GenerateLineSegmentFromStroke(trade_code_type.first, oneperiod.first);
					//for test
					//if (ns->RealTimeHandleExit == 1) {
					//	dc.WriteTypingMergeKlineData("E:\\otherdata\\stock_data\\");
					//	dc.WriteStrokeData("E:\\otherdata\\stock_data\\");
					//	dc.WriteLineSegment("E:\\otherdata\\stock_data\\");
					//	dc.WriteTrendCentral("E:\\otherdata\\stock_data\\");
					//	dc.WriteTrendType("E:\\otherdata\\stock_data\\");
					//	dc.WriteOrder("E:\\otherdata\\stock_data\\");
					//	SPDLOG_WARN("RealTimeHandle Exit!");
					//	return;
					//}

					zen_sched.DivideTrendCentralFromStroke(trade_code_type.first, oneperiod.first);
					//zen_sched.DivergenceHandle(trade_code_type.first, oneperiod.first);
				}

				//zen_sched.TradeProcessHandle(trade_code_type.first, "1min");
				zen_sched.TradeProcessHandle(trade_code_type.first, "5min");

				if (dc.JudgeWrite(trade_code_type.first)) {
					last_write_ts = now_ts;
					//dc.WriteTypingMergeKlineData("E:\\otherdata\\stock_data\\");
					dc.WriteStrokeData("E:\\otherdata\\stock_data\\");
					dc.WriteLineSegment("E:\\otherdata\\stock_data\\");
					dc.WriteTrendCentral("E:\\otherdata\\stock_data\\");
					dc.WriteTrendType("E:\\otherdata\\stock_data\\");
					dc.WriteOrder("E:\\otherdata\\stock_data\\");
					for (auto& wdt : ns->WriteDataTs) {
						if (wdt.second == -1) {
							wdt.second = int32_t(time(NULL));
						}
					}

					//SPDLOG_INFO("Write Data end!");
				}

				pTM->update = false;
			}

			//now_ts = int32_t(time(NULL));
			//if (((now_ts - last_write_ts) >= 180)) {
			//	last_write_ts = now_ts;
			//	//dc.WriteTypingMergeKlineData("E:\\otherdata\\stock_data\\");
			//	dc.WriteStrokeData("E:\\otherdata\\stock_data\\");
			//	dc.WriteLineSegment("E:\\otherdata\\stock_data\\");
			//	dc.WriteTrendCentral("E:\\otherdata\\stock_data\\");
			//	dc.WriteTrendType("E:\\otherdata\\stock_data\\");
			//	dc.WriteOrder("E:\\otherdata\\stock_data\\");
			//	for (auto& wdt : ns->WriteDataTs) {
			//		if (wdt.second == -1) {
			//			wdt.second = int32_t(time(NULL));
			//		}
			//	}

			//	//dc.StatCriticalValues("RB8888.XSGE", "5min");
			//	//dc.StatCriticalValues("RB8888.XSGE", "15min");
			//	SPDLOG_INFO("Write Data end!");
			//}

			Sleep(1);
		}
	}
	catch (std::exception& e)
	{
		cerr << "RealtimeHandle exception: " << e.what() << endl;
		SPDLOG_ERROR("RealtimeHandle exception:{}", e.what());
	}
}


int main(int argc, char* argv[])
{
	srand(unsigned int(time(NULL)));
	unsigned int n = std::thread::hardware_concurrency();
	std::cout << n << " concurrent threads are supported.\n";
	
	try {
		char conf[1024] = {0};
		char dir[1024] = {0};
		get_exe_path(conf, 1024);
		get_file_dir(dir, conf, 1024);
		if (!get_absolute_path(conf, "../conf/ZenTheory.xml", dir))
		{
			//SPDLOG_ERROR("配置文件缺失，异常退出！\n");
			return 1;
		}

		//SPDLOG_DEBUG("ZenTheory debug!");
		//SPDLOG_INFO("ZenTheory start!");

		ZenTheory* ns = ZenTheory::get_instance();
		if (!ns->run(conf))
		{
			SPDLOG_ERROR("ZenTheory init failed!");
			return 2;
		}

		TickAnalysis();
		return 0;

		//std::thread dataSvrThread(RunServer);  
		//dataSvrThread.detach();

		std::thread realtimeHandleThread(RealtimeHandle, ns->m_trade_code_types);
		realtimeHandleThread.detach();

		std::thread missKlineCheckThread(MissingKlineCheck);
		missKlineCheckThread.detach();

		std::thread jQuantDataHandleThread(JQuantDataHandle);
		jQuantDataHandleThread.detach();

		std::thread CtpQuotationHandleThread(CtpQuotationHandle);
		CtpQuotationHandleThread.detach();

		std::thread NoticeHandleThread(ZenNoticeThreadHandle);
		NoticeHandleThread.detach();

		while (true) {
			Sleep(1000);
		}

		SPDLOG_INFO("ZenTheory end!");
	}
	catch (std::exception& e)
	{
		cerr << "ZenTheory exception: " << e.what() << endl;
		SPDLOG_ERROR("ZenTheory exception:{}", e.what());
		spdlog::shutdown();
		return -1;
	}

	//清理所有日志
	spdlog::shutdown();
	system("pause");
	return 0;
}


void func()
{
	for (int i = 0; i < 100000; ++i)
	{
		std::lock_guard<std::mutex> lck(mtx);
		//mtx.lock();
		++counter;
		//mtx.unlock();
	}
}

int32_t testMutex() {
	////int64_t iTime = Utils::TsToIntTime(12312313);
	////return 0;

	chrono::steady_clock::time_point t1 = chrono::steady_clock::now();
	std::thread workerThreads[2];
	for (int i = 0; i < 2; ++i)
	{
		workerThreads[i] = std::thread(func);
		workerThreads[i].join();
	}
	//for (auto& workerThread : workerThreads)
	//{
	//	workerThread.join();
	//}
	std::cout << counter << " successful increases of the counter" << std::endl;

	chrono::steady_clock::time_point t2 = chrono::steady_clock::now();

	////毫秒
	std::chrono::duration<double, std::milli> dTimeSpan = std::chrono::duration<double, std::milli>(t2 - t1);
	std::cout << "dTimeSpan: " << dTimeSpan.count() << "ms\n";

	//system("pause");
	return 0;
}

int32_t testOrderId() {
	srand(unsigned int(time(NULL)));

	SPDLOG_DEBUG("rand start!");
	int64_t id = 0;
	set<int64_t> ids;
	int32_t count = 0;
	for (int32_t i = 0; i < 100000; i++) {
		id = Utils::OrderId();
		while (true) {
			if (ids.find(id) != ids.end()) {
				//SPDLOG_DEBUG("repeat id:{}", id);
				id++;
			}
			else {
				ids.insert(id);
			}
		}

		//if (i % 20 == 0) {
		//	Sleep(1000);
		//}
	}

	system("pause");
	SPDLOG_DEBUG("rand end! count:{}", count);
	return 0;
}


