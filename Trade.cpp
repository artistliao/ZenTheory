#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "Merge.h"
#include "Typing.h"
#include "Divergence.h"
#include "TrendCentralAndType.h"
#include "DataCard.h"
#include "Trade.h"


TradeHandle::TradeHandle()
{
}

TradeHandle::~TradeHandle()
{
}


int32_t TradeHandle::TradeStrategyHandle(const string& code, const string & period) {
	//SPDLOG_INFO("TradeStrategyHandle code:{}", code);
	ZenTheory* ns = ZenTheory::get_instance();

	TrendCentralData* pTC = nullptr;
	KlineData* pKline = nullptr;
	StrokeData* pStroke = nullptr;
	//LineSegmentData* pLine = nullptr;
	Order* pOrder = nullptr;
	Order* pLastOrder = nullptr;

	string highLevelPeriod;
	if (period == "5min") {
		highLevelPeriod = "15min";
	}

	vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
	int32_t ori_kline_size = oriKlines.size();
	vector<KlineMergeData*>& mergeKlines = ns->MergeKlines[code][period];

	vector<StrokeData*>& strokes = ns->Strokes[code][period];
	int32_t stroke_size = strokes.size();

	//vector<LineSegmentData*>& lines = ns->LineSegments[code]["1min"];
	//int32_t line_size = lines.size();

	vector<TrendCentralData*>& tcDatas = ns->TrendCentrals[code][period];
	int32_t tc_size = tcDatas.size();

	vector<TrendTypeData*>& ttDatas = ns->TrendTypes[code][period];
	int32_t tt_size = ttDatas.size();

	vector<Order*>& orders = ns->Orders[code][period];

	if (tc_size < 2) {
		//SPDLOG_WARN("tcDatas size:{}", tc_size);
		return -1;
	}

	double macd_critical = 0.0;
	if (period == "1min") {
		macd_critical = 1; // 0.478
	} else if (period == "5min") {
		macd_critical = 2.51; //1.08
	}
	else if (period == "15min") {
		macd_critical = 5.33;
	}
	else {
		return -3;
	}

	bool bTradeInterval = true;
	bool haveProcessingOrder = false;
	int32_t open_stroke_end_kline_idx = 0;
	if (orders.size() > 0) {
		pOrder = orders.back();
		if (pOrder->is_cover == 0) {
			haveProcessingOrder = true;
		}

		if ((ori_kline_size - 1 - pOrder->open_kline_idx) < TRADE_INTERVAL) {
			bTradeInterval = false;
		}

		open_stroke_end_kline_idx = pOrder->open_stroke_end_kline_idx;
	}

	int32_t last_trend_type = 0;
	for (int32_t i = tc_size - 1; i >= 0; i--) {
		pTC = tcDatas[i];
		if ((pTC->trend_type != CONSOLIDATION)&& (pTC->trend_type_confirm == TT_CONFIRM)) {
			last_trend_type = int32_t(pTC->trend_type);
			break;
		}
	}

	if (tc_size >= 3) {
		int32_t ret1 = JudgeTCRelation(tcDatas[tc_size - 3], tcDatas[tc_size - 2]);
		int32_t ret2 = JudgeTCRelation(tcDatas[tc_size - 2], tcDatas[tc_size - 1]);
		if (ret1 == TC_UP && ret2 == TC_UP) {
			last_trend_type = TREND_UP;
		} else if (ret1 == TC_DOWN && ret2 == TC_DOWN) {
			last_trend_type = TREND_DOWN;
		}
	}

	if (last_trend_type == 0) {
		return -2;
	}

	pTC = tcDatas[tc_size-1];
	int32_t ori_kline_idx = 0;

	pKline = oriKlines.back();
	double newest_price = pKline->close;

	int32_t stroke_idx = stroke_size-1;
	pStroke = strokes.back();
	//for test
	if (Utils::DoubleCmp(pStroke->low, 3432.51) == 0 && pStroke->direction == DIRECTION_UP && period=="5min") {
		cout << pStroke->starttime << endl;
	}

	//
	double limti_macd = GetLimitMACD(pStroke, code, period);
	macd_critical = fabs(limti_macd * 0.33);
	macd_critical = (Utils::DoubleCmp(macd_critical, 2.51)>0) ? macd_critical : 2.51;
	bool bNewThirdClassOrder = false;
start1:
	if (JudgeThirdClassBSPoint(pStroke, pTC, last_trend_type)) {
		if ((stroke_size - pTC->end_stroke_idx) <= 6) {
			if ((!haveProcessingOrder) && (bTradeInterval) && (bNewThirdClassOrder || pStroke->end_kline_idx != open_stroke_end_kline_idx) &&
				JudgeMACD(pKline, last_trend_type, macd_critical) && JudgePrice(pStroke, pKline)) {
				//zhishun价设置
				double stop_loss_price = GetStopLossPrice(pStroke, pKline);
				double diff = fabs(pKline->close - stop_loss_price);
				double diff2 = (pStroke->high - pStroke->low) / 5;
				diff2 = (Utils::DoubleCmp(diff2, pKline->close * 0.004) >= 0) ? diff2 : pKline->close * 0.004;
				if ((pStroke->direction == last_trend_type) && (Utils::DoubleCmp(diff, diff2)<=0)) {
					pOrder = new Order;
					memset(pOrder, 0, sizeof(Order));
					pOrder->order_id = ns->GetOrderId();

					ori_kline_idx = pKline->index;
					pOrder->open_trans_price = oriKlines[ori_kline_idx]->close;
					pOrder->open_trans_time = oriKlines[ori_kline_idx]->starttime;
					pOrder->open_kline_idx = ori_kline_idx;
					pOrder->amount = 1;
					pOrder->pSecurity = ns->m_futures_code_map[code];
					pOrder->direction = (last_trend_type == TREND_UP) ? DIRECTION_DOWN : DIRECTION_UP;
					//pOrder->stop_loss_price = (pOrder->direction == DIRECTION_DOWN) ? pOrder->open_trans_price*1.003 : pOrder->open_trans_price*0.997;
					
					pOrder->stop_loss_price = CorrectStopLossPrice(pStroke, pKline); 
					pOrder->limit_price = pOrder->open_trans_price;
					pOrder->limit_price_stroke_idx = stroke_idx;
					pOrder->is_open = 1;
					pOrder->is_cover = 0;
					pOrder->last_tc_idx = pTC->index;
					pOrder->open_stroke_idx = stroke_idx;
					pOrder->open_stroke_end_kline_idx = pStroke->end_kline_idx;
					pOrder->open_type =THIRDCLASS_OPEN;
					ns->Orders[code][period].push_back(pOrder);
					haveProcessingOrder = true;
					SPDLOG_INFO("code:{} open, price:{}, direction:{}", code, pOrder->open_trans_price, pOrder->direction);
					PutNoticeTrade(pOrder, pKline, period);

					goto out1;
				}
			}
			else if (haveProcessingOrder){
				pOrder = orders.back();
				if (pOrder->direction == last_trend_type) { //haveProcessingOrder
					CoverOrder(pOrder, pKline, 1, haveProcessingOrder);
					pOrder->cover_type = THIRDCLASS_COVER;
					bNewThirdClassOrder = true;
					PutNoticeTrade(pOrder, pKline, period);

					goto start1;
				}
			}
		}
	}
	
	// 
	bool bNewFirstClassOrder = false;
start2:
	StrokeData* pTFLStroke = strokes[stroke_size - 3]; //pThirdFromLastStroke
	if ((pStroke->direction == last_trend_type) && JudgeDivergence(pTFLStroke, pStroke, code, period, last_trend_type)) {
		if ((!haveProcessingOrder) && (bTradeInterval) && (bNewFirstClassOrder || pStroke->end_kline_idx != open_stroke_end_kline_idx) &&
			JudgeMACD(pKline, last_trend_type, macd_critical) && JudgePrice(pStroke, pKline)) {
			//zhishun价设置
			double stop_loss_price = GetStopLossPrice(pStroke, pKline);
			double diff = fabs(pKline->close - stop_loss_price);
			double diff2 = (pStroke->high - pStroke->low) / 5;
			diff2 = (Utils::DoubleCmp(diff2, pKline->close * 0.004) >= 0) ? diff2 : pKline->close * 0.004;
			if ((pStroke->direction == last_trend_type) && (Utils::DoubleCmp(diff, diff2) <= 0)) {
				pOrder = new Order;
				memset(pOrder, 0, sizeof(Order));
				pOrder->order_id = ns->GetOrderId();

				ori_kline_idx = pKline->index;
				pOrder->open_trans_price = oriKlines[ori_kline_idx]->close;
				pOrder->open_trans_time = oriKlines[ori_kline_idx]->starttime;
				pOrder->open_kline_idx = ori_kline_idx;
				pOrder->amount = 1;
				pOrder->pSecurity = ns->m_futures_code_map[code];
				pOrder->direction = (last_trend_type == TREND_UP) ? DIRECTION_DOWN : DIRECTION_UP;
				//pOrder->stop_loss_price = (pOrder->direction == DIRECTION_DOWN) ? pOrder->open_trans_price*1.003 : pOrder->open_trans_price*0.997;
				pOrder->stop_loss_price = CorrectStopLossPrice(pStroke, pKline); 
				pOrder->limit_price = pOrder->open_trans_price;
				pOrder->limit_price_stroke_idx = stroke_idx;
				pOrder->is_open = 1;
				pOrder->is_cover = 0;
				pOrder->last_tc_idx = pTC->index;
				pOrder->open_stroke_idx = stroke_idx;
				pOrder->open_stroke_end_kline_idx = pStroke->end_kline_idx;
				pOrder->open_type = FIRSTCLASS_OPEN;
				ns->Orders[code][period].push_back(pOrder);
				haveProcessingOrder = true;
				SPDLOG_INFO("code:{} open, price:{}, direction:{}", code, pOrder->open_trans_price, pOrder->direction);
				PutNoticeTrade(pOrder, pKline, period);
				goto out1;
			}
		}
		else if (haveProcessingOrder) {
			pOrder = orders.back();
			if (pOrder->direction == last_trend_type) { //haveProcessingOrder
				CoverOrder(pOrder, pKline, 1, haveProcessingOrder);
				pOrder->cover_type = FIRSTCLASS_COVER;
				bNewFirstClassOrder = true;
				PutNoticeTrade(pOrder, pKline, period);

				goto start2;
			}
		}
	}

start3:
	if ((pTC->trend_type == TREND_UP || pTC->trend_type == TREND_DOWN) && (pTC->trend_type_confirm == TT_CONFIRM) &&
		JudgeTrendBSPoint(pStroke, pTC)) {
		if ((stroke_size - pTC->end_stroke_idx) <= 6) {
			if ((!haveProcessingOrder) && (bTradeInterval) && ( pStroke->end_kline_idx != open_stroke_end_kline_idx) &&
				JudgeMACD(pKline, pStroke->direction, macd_critical)&& JudgePrice(pStroke, pKline)) {
				//zhishun价设置
				double stop_loss_price = GetStopLossPrice(pStroke, pKline); 
				double diff = fabs(pKline->close - stop_loss_price);
				double diff2 = (pStroke->high - pStroke->low) / 5;
				diff2 = (Utils::DoubleCmp(diff2, pKline->close * 0.004) >= 0) ? diff2 : pKline->close * 0.004;
				if (Utils::DoubleCmp(diff, diff2) <= 0) {
					pOrder = new Order;
					memset(pOrder, 0, sizeof(Order));
					pOrder->order_id = ns->GetOrderId();

					ori_kline_idx = pKline->index;
					pOrder->open_trans_price = oriKlines[ori_kline_idx]->close;
					pOrder->open_trans_time = oriKlines[ori_kline_idx]->starttime;
					pOrder->open_kline_idx = ori_kline_idx;
					pOrder->amount = 1;
					pOrder->pSecurity = ns->m_futures_code_map[code];
					pOrder->direction = (pStroke->direction == DIRECTION_UP) ? DIRECTION_DOWN : DIRECTION_UP;

					pOrder->stop_loss_price = CorrectStopLossPrice(pStroke, pKline); 
					pOrder->limit_price = pOrder->open_trans_price;
					pOrder->limit_price_stroke_idx = stroke_idx;
					pOrder->is_open = 1;
					pOrder->is_cover = 0;
					pOrder->last_tc_idx = pTC->index;
					pOrder->open_stroke_idx = stroke_idx;
					pOrder->open_stroke_end_kline_idx = pStroke->end_kline_idx;
					pOrder->open_type = TREND_OPEN;
					ns->Orders[code][period].push_back(pOrder);
					haveProcessingOrder = true;
					SPDLOG_INFO("code:{} open, price:{}, direction:{}", code, pOrder->open_trans_price, pOrder->direction);
					PutNoticeTrade(pOrder, pKline, period);

					goto out1;
				}
			}
		}
	}

	//for test
	if (Utils::DoubleCmp(pStroke->high, 3599.61) == 0 && pStroke->direction == DIRECTION_UP) {
		cout << pStroke->starttime << endl;
	}

	//移动设置zhishun值
	if (haveProcessingOrder) {
		pOrder = orders.back();
		for (int32_t i = pOrder->limit_price_stroke_idx; i < stroke_size; i++) {
			pStroke = strokes[i];
			if (pOrder->direction == pStroke->direction) {
				if (pOrder->direction == DIRECTION_UP) {
					if (Utils::DoubleCmp(pStroke->high, pOrder->limit_price) > 0) {
						pOrder->limit_price = pStroke->high;
						pOrder->limit_price_stroke_idx = i;
					}
				}
				else if (pOrder->direction == DIRECTION_DOWN) {
					if (Utils::DoubleCmp(pStroke->low, pOrder->limit_price) < 0) {
						pOrder->limit_price = pStroke->low;
						pOrder->limit_price_stroke_idx = i;
					}
				}
			}
		}

		if (pOrder->direction == DIRECTION_UP) {
			double diff_price = pOrder->limit_price - pOrder->open_trans_price;
			if (Utils::DoubleCmp(diff_price, pOrder->open_trans_price * 0.003) >= 0) {
				double new_stop_loss_price = pOrder->open_trans_price + diff_price/3.0;
				//double new_stop_loss_price = pOrder->open_trans_price + 1.0;
				if (Utils::DoubleCmp(new_stop_loss_price, pOrder->stop_loss_price) > 0) {
					pOrder->stop_loss_price = new_stop_loss_price;
				}
			}

			if (Utils::DoubleCmp(diff_price, pOrder->open_trans_price * 0.006) >= 0) {
				double new_stop_loss_price = pOrder->open_trans_price + diff_price / 2.0;
				if (Utils::DoubleCmp(new_stop_loss_price, pOrder->stop_loss_price) > 0) {
					pOrder->stop_loss_price = new_stop_loss_price;
				}
			}
		} else if (pOrder->direction == DIRECTION_DOWN) {
			double diff_price = pOrder->open_trans_price - pOrder->limit_price;
			if (Utils::DoubleCmp(diff_price, pOrder->open_trans_price * 0.003) >= 0) {
				double new_stop_loss_price = pOrder->open_trans_price - diff_price/3.0;
				//double new_stop_loss_price = pOrder->open_trans_price - 1.0;
				if (Utils::DoubleCmp(new_stop_loss_price, pOrder->stop_loss_price) < 0) {
					pOrder->stop_loss_price = new_stop_loss_price;
				}
			}

			if (Utils::DoubleCmp(diff_price, pOrder->open_trans_price * 0.006) >= 0) {
				double new_stop_loss_price = pOrder->open_trans_price - diff_price/2.0;
				if (Utils::DoubleCmp(new_stop_loss_price, pOrder->stop_loss_price) < 0) {
					pOrder->stop_loss_price = new_stop_loss_price;
				}
			}
		}
	}

	//zhi shun判断
	if (haveProcessingOrder) {
		pOrder = orders.back();
		int32_t cover_price_type = 1;
		if (pKline->index > pOrder->open_kline_idx) {
			newest_price = pKline->open;
			cover_price_type = 2;
		}
		else {
			newest_price = pKline->close;
			cover_price_type = 1;
		}

		if ((pOrder->direction == DIRECTION_DOWN && newest_price >= pOrder->stop_loss_price) ||
			(pOrder->direction == DIRECTION_UP && newest_price <= pOrder->stop_loss_price)) {
			CoverOrder(pOrder, pKline, cover_price_type, haveProcessingOrder);
			pOrder->cover_type = ZHISHUN_COVER;

			PutNoticeTrade(pOrder, pKline, period);
		}
	}

out1:

	return 0;
}

void TradeHandle::CoverOrder(Order* pOrder, KlineData* pKline, int32_t cover_price_type, bool& haveProcessingOrder) {
	if (!pOrder || !pKline) {
		return;
	}

	double newest_price = pKline->close;
	if (cover_price_type == 1) {
		newest_price = pKline->close;
	}
	else {
		newest_price = pKline->open;
	}

	pOrder->cover_trans_price = newest_price;
	pOrder->cover_trans_time = pKline->starttime;
	pOrder->cover_kline_idx = pKline->index;
	pOrder->is_cover = 1;
	haveProcessingOrder = false;

	if ((pOrder->direction == DIRECTION_DOWN)) {
		pOrder->profit = pOrder->open_trans_price - pOrder->cover_trans_price;
		SPDLOG_INFO("code:{} cover, price:{}, profit:{}", pOrder->pSecurity->gp_code, pOrder->cover_trans_price, pOrder->profit);
	}

	if ((pOrder->direction == DIRECTION_UP) ) {
		pOrder->profit = pOrder->cover_trans_price - pOrder->open_trans_price;
		SPDLOG_INFO("code:{} cover, price:{}, profit:{}", pOrder->pSecurity->gp_code, pOrder->cover_trans_price, pOrder->profit);
	}

	return;
}

void TradeHandle::PutNoticeTrade(Order* pOrder, KlineData* pKline, const string& period) {
	if (!pOrder || !pKline) {
		return;
	}

	SPDLOG_INFO("PutNoticeTrade code:{}, period:{}, direction:{}, is_open:{}, is_cover:{}, open_type:{}, cover_type:{}", pOrder->pSecurity->gp_code, period, 
		int32_t(pOrder->direction), int32_t(pOrder->is_open), int32_t(pOrder->is_cover), int32_t(pOrder->open_type), int32_t(pOrder->cover_type));

	ZenTheory* ns = ZenTheory::get_instance();
	//notice
	int32_t nowTs = int32_t(time(NULL));
	int32_t kline_start_ts = Utils::IntTimeToTs(pKline->starttime);
	if ((nowTs - kline_start_ts) <= 1200) {
		std::lock_guard<std::mutex> lock(ns->notice_mtx);
		NoticeTrade* pNoticeTrade = new NoticeTrade;
		memset(pNoticeTrade, 0, sizeof(pNoticeTrade));
		snprintf(pNoticeTrade->code, sizeof(pNoticeTrade->code), "%s", pOrder->pSecurity->gp_code);
		snprintf(pNoticeTrade->sec_type, sizeof(pNoticeTrade->sec_type), "futures");
		snprintf(pNoticeTrade->period, sizeof(pNoticeTrade->period), "%s", period.c_str());
		if (pOrder->is_cover == 1) {
			pNoticeTrade->trade_type = 2;
			pNoticeTrade->open_cover_type = pOrder->cover_type;
		}
		else {
			pNoticeTrade->trade_type = 1;
			pNoticeTrade->open_cover_type = pOrder->open_type;
		}

		pNoticeTrade->direction = pOrder->direction;
		pNoticeTrade->trigger_ts = Utils::IntTimeToTs(pKline->starttime);
		pNoticeTrade->kline_start_ts = Utils::IntTimeToTs(pKline->starttime);
		pNoticeTrade->price = pKline->close;
		pNoticeTrade->stop_loss_price = pOrder->stop_loss_price;
		snprintf(pNoticeTrade->ext_info, sizeof(pNoticeTrade->ext_info), "{\"1min\":%d,\"5min\":%d,\"15min\":%d,\"30min\":%d}", 
			ns->StartTs["1min"], ns->StartTs["5min"], ns->StartTs["15min"], ns->StartTs["30min"]);
		ns->NoticeTrades.push_back(pNoticeTrade);
	}

	return;
}

bool TradeHandle::JudgeThirdClassBSPoint(StrokeData* pStroke, TrendCentralData* pTC, int32_t type) {
	if (!pStroke || !pTC) {
		SPDLOG_WARN("!pStroke || !pTC");
		return false;
	}

	if (pStroke->direction == type) {
		if (type == DIRECTION_UP) {
			if (Utils::DoubleCmp(pStroke->high, pTC->low) < 0) {
				return true;
			}
		}
		else if (type == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(pStroke->low, pTC->high) > 0) {
				return true;
			}
		}
	}

	return false;
}

bool TradeHandle::JudgeTrendBSPoint(StrokeData* pStroke, TrendCentralData* pTC) {
	if (!pStroke || !pTC) {
		SPDLOG_WARN("!pStroke || !pTC");
		return false;
	}

	if (pTC->trend_type != TREND_UP && pTC->trend_type != TREND_DOWN) {
		return false;
	}

	if (pTC->trend_type_confirm != TT_CONFIRM) {
		return false;
	}

	if (pStroke->direction != pTC->trend_type) {
		if (pStroke->direction == DIRECTION_UP) {
			if (Utils::DoubleCmp(pStroke->high, pTC->low) < 0) {
				return true;
			}
		}
		else if (pStroke->direction == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(pStroke->low, pTC->high) > 0) {
				return true;
			}
		}
	}

	return false;
}

bool TradeHandle::JudgeMACD(KlineData* pKline, int32_t direction, double macd_critical) {
	if (!pKline) {
		SPDLOG_WARN("!pKline");
		return false;
	}

	if (direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pKline->macd, macd_critical) <= 0) {
			return true;
		}
	} else if (direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pKline->macd, -macd_critical) >= 0) {
			return true;
		}
	}
	
	return false;
}

bool TradeHandle::JudgeDivergence(StrokeData* pStroke1, StrokeData* pStroke2, const string& code, const string& period, int32_t direction) {
	if (!pStroke1 || !pStroke2) {
		SPDLOG_WARN("!pStroke1 || !pStroke2");
		return false;
	}

	if (pStroke1->direction != direction || pStroke2->direction != direction) {
		SPDLOG_WARN("error pStroke1->direction:{}, pStroke2->direction:{}, direction:{}", int32_t(pStroke1->direction), int32_t(pStroke2->direction), direction);
		return false;
	}

	if (direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pStroke2->high, pStroke1->high) <= 0 || Utils::DoubleCmp(pStroke2->low, pStroke1->low) <= 0) {
			return false;
		}
	}
	else if (direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pStroke2->high, pStroke1->high) >= 0 || Utils::DoubleCmp(pStroke2->low, pStroke1->low) >= 0) {
			return false;
		}
	}
	else {
		return false;
	}

	ZenTheory* ns = ZenTheory::get_instance();
	vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
	int32_t ori_kline_size = oriKlines.size();
	double macdSum1 = 0.0;
	int32_t count1 = 0;
	double limitDif1 = 0.0;
	for (int32_t i = pStroke1->start_kline_idx; i <= pStroke1->end_kline_idx; i++) {
		if (direction == DIRECTION_UP) {
			if (Utils::DoubleCmp(oriKlines[i]->macd, 0.0) > 0) {
				macdSum1 += oriKlines[i]->macd;
				count1++;
			}

			if (Utils::DoubleCmp(oriKlines[i]->dif, limitDif1) > 0) {
				limitDif1 = oriKlines[i]->dif;
			}
		} else if (direction == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(oriKlines[i]->macd, 0.0) < 0) {
				macdSum1 += oriKlines[i]->macd;
				count1++;
			}

			if (Utils::DoubleCmp(oriKlines[i]->dif, limitDif1) < 0) {
				limitDif1 = oriKlines[i]->dif;
			}
		}
	}

	double macdSum2 = 0.0;
	int32_t count2 = 0;
	double limitDif2 = 0.0;
	for (int32_t i = pStroke2->start_kline_idx; i <= pStroke2->end_kline_idx; i++) {
		if (direction == DIRECTION_UP) {
			if (Utils::DoubleCmp(oriKlines[i]->macd, 0.0) > 0) {
				macdSum2 += oriKlines[i]->macd;
				count2++;
			}

			if (Utils::DoubleCmp(oriKlines[i]->dif, limitDif2) > 0) {
				limitDif2 = oriKlines[i]->dif;
			}
		}
		else if (direction == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(oriKlines[i]->macd, 0.0) < 0) {
				macdSum2 += oriKlines[i]->macd;
				count2++;
			}

			if (Utils::DoubleCmp(oriKlines[i]->dif, limitDif2) < 0) {
				limitDif2 = oriKlines[i]->dif;
			}
		}
	}

	double avg1 = 0.0;
	if (count1 > 0) {
		avg1 = macdSum1 / double(count1);
	}

	double avg2 = 0.0;
	if (count2 > 0) {
		avg2 = macdSum2 / double(count2);
	}

	if (direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(avg2, avg1) < 0 && Utils::DoubleCmp(limitDif2, limitDif1) < 0) {
			return true;
		}
	}else if (direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(avg2, avg1) > 0 && Utils::DoubleCmp(limitDif2, limitDif1) > 0) {
			return true;
		}
	}

	return false;
}

double TradeHandle::GetStopLossPrice(StrokeData* pStroke, KlineData* pKline) {
	if (!pStroke || !pKline) {
		return 0.0;
	}

	//zhishun价设置
	double stop_loss_price = (pStroke->direction == DIRECTION_UP) ? pStroke->high + 1 : pStroke->low - 1;
	if (pStroke->direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pKline->close, pStroke->high) >= 0) {
			stop_loss_price = pKline->close + 1;
		}
		else {
			stop_loss_price = pStroke->high + 1;
		}
	}
	else if (pStroke->direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pKline->close, pStroke->low) <= 0) {
			stop_loss_price = pKline->close - 1;
		}
		else {
			stop_loss_price = pStroke->low - 1;
		}
	}

	return stop_loss_price;
}

double TradeHandle::CorrectStopLossPrice(StrokeData* pStroke, KlineData* pKline) {
	if (!pStroke || !pKline) {
		return 0.0;
	}

	//zhishun价设置
	double stop_loss_price = (pStroke->direction == DIRECTION_UP) ? pStroke->high + 1 : pStroke->low - 1;
	if (pStroke->direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pStroke->high-pKline->close, pKline->close*0.002) <= 0) {
			stop_loss_price = pStroke->high + 1;
		}
		else {
			stop_loss_price = pKline->close*1.002 + 1;
		}
	}
	else if (pStroke->direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pKline->close -pStroke->low, pKline->close * 0.002) <= 0) {
			stop_loss_price = pStroke->low - 1;
		}
		else {
			stop_loss_price = pKline->close * 0.998 - 1;
		}
	}

	return stop_loss_price;
}

bool TradeHandle::JudgePrice(StrokeData* pStroke, KlineData* pKline) {
	if (!pStroke || !pKline) {
		return false;
	}

	if (pStroke->direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pKline->close, pStroke->high) > 0) {
			return false;
		}
	}
	else if (pStroke->direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pKline->close, pStroke->low) <= 0) {
			return false;
		}
	}

	return true;
}


double TradeHandle::GetLimitMACD(StrokeData* pStroke, const string& code, const string& period) {
	if (!pStroke) {
		SPDLOG_WARN("!pStroke");
		return 0.0;
	}

	ZenTheory* ns = ZenTheory::get_instance();
	vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
	double limitMACD = 0.0;
	for (int32_t i = pStroke->start_kline_idx; i <= pStroke->end_kline_idx; i++) {
		if (pStroke->direction == DIRECTION_UP) {
			if (Utils::DoubleCmp(oriKlines[i]->macd, limitMACD) > 0) {
				limitMACD  = oriKlines[i]->macd;
			}

		}
		else if (pStroke->direction == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(oriKlines[i]->macd, limitMACD) < 0) {
				limitMACD = oriKlines[i]->macd;
			}
		}
	}

	return limitMACD;
}

 
int32_t TradeHandle::JudgeTCRelation(TrendCentralData* frontTC, TrendCentralData* nextTc) {
	if (!frontTC || !nextTc) {
		return -1;
	}

	if (Utils::DoubleCmp(nextTc->high, frontTC->high) > 0 && Utils::DoubleCmp(nextTc->low, frontTC->low) > 0) {
		return TC_UP;
	}
	
	if (Utils::DoubleCmp(nextTc->high, frontTC->high) < 0 && Utils::DoubleCmp(nextTc->low, frontTC->low) < 0) {
		return TC_DOWN;
	}

	return -2;
}