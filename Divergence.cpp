#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "Merge.h"
#include "Typing.h"
#include "Divergence.h"
#include "TrendCentralAndType.h"
#include "DataCard.h"


Divergence::Divergence()
{
}

Divergence::~Divergence()
{
}


int32_t Divergence::DivergenceHandle(const string& code, const string& period) {
	SPDLOG_INFO("DivergenceHandle code:{}, period:{}", code, period);
	ZenTheory* ns = ZenTheory::get_instance();

	vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
	vector<StrokeData*>& strokes = ns->Strokes[code][period];
	//vector<LineSegmentData*>& lines = ns->LineSegments[code][period];
	vector<TrendCentralData*>& tcDatas = ns->TrendCentrals[code][period];
	vector<TrendTypeData*>& ttDatas = ns->TrendTypes[code][period];
	TrendCentralData* pTC = nullptr;
	TrendTypeData* pTT = nullptr;
	SectionIndex lineSection1;
	SectionIndex lineSection2;
	SectionIndex klineSection1;
	SectionIndex klineSection2;
	int32_t end_tc_idx = 0;
	int32_t last_but_one_tc_idx = 0; //倒数第二个TC
	int32_t next_tc_idx = 0;
	int32_t stroke_idx = 0;
	int32_t iRet = 0;
	size_t ttSize = ttDatas.size();
	for (size_t i = 0; i < ttSize; i++) {
		pTT = ttDatas[i];
		if (pTT->type == TREND_UP || pTT->type == TREND_DOWN) {
			end_tc_idx = pTT->end_central_idx;
			last_but_one_tc_idx = end_tc_idx-1;
			next_tc_idx = 0;
			if (end_tc_idx < (ttSize - 1)) {
				next_tc_idx = end_tc_idx + 1;
			}

			//如果趋势最后一个TC没有下一个L
			if (tcDatas[end_tc_idx]->end_stroke_idx == (strokes.size() - 1)) {
				continue;
			}

			lineSection1.start_idx = tcDatas[last_but_one_tc_idx]->end_stroke_idx + 1;
			lineSection1.end_idx = tcDatas[end_tc_idx]->start_stroke_idx - 1;

			lineSection2.start_idx = tcDatas[end_tc_idx]->end_stroke_idx + 1;
			if (next_tc_idx != 0) {
				lineSection2.end_idx = tcDatas[next_tc_idx]->start_stroke_idx - 1;
			}
			else {
				lineSection2.end_idx = strokes.size() - 1;
			}


			klineSection1.start_idx = strokes[lineSection1.start_idx]->start_kline_idx;
			klineSection1.end_idx = strokes[lineSection1.end_idx]->end_kline_idx;

			//
			klineSection2.start_idx = strokes[lineSection2.start_idx]->start_kline_idx;
			klineSection2.end_idx = strokes[lineSection2.end_idx]->end_kline_idx;

			iRet = JudgeDivergence(code, period, pTT->type, klineSection1, klineSection2);
			if (iRet == 1) {
				if (pTT->type == TREND_UP) {
					oriKlines[klineSection2.end_idx]->divergence = TOP_DIVERGENCE;
					strokes[lineSection2.end_idx]->divergence = TOP_DIVERGENCE;
				}

				if (pTT->type == TREND_DOWN) {
					oriKlines[klineSection2.end_idx]->divergence = BOTTOM_DIVERGENCE;
					strokes[lineSection2.end_idx]->divergence = BOTTOM_DIVERGENCE;
				}
			}
		}
	}

	//
	return 0;
}

// 返回值：NO_DIVERGENCE:没有 1:TOP_DIVERGENCE 2:BOTTOM_DIVERGENCE 其他:失败
int32_t Divergence::JudgeDivergence(const string& code, const string& period, char type, SectionIndex& klineSection1, SectionIndex& klineSection2) {
	//SPDLOG_INFO("JudgeDivergence code:{}, period:{}, type:{}, klineSection1:{}, klineSection2:{}", code, period, type, klineSection1, klineSection2);
	ZenTheory* ns = ZenTheory::get_instance();

	vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
	vector<LineSegmentData*>& lines = ns->LineSegments[code][period];
	KlineData* pKline = nullptr;
	double dif_limit1 = 0.0;
	double dif_limit2 = 0.0;
	double macd_sum1 = 0.0;
	double macd_sum2 = 0.0;
	double macd_avg1 = 0.0;
	double macd_avg2 = 0.0;
	for (size_t i = klineSection1.start_idx; i <= klineSection1.end_idx; i++) {
		pKline = oriKlines[i];
		if (type == TREND_UP) {
			if (Utils::DoubleCmp(pKline->dif, dif_limit1) > 0) {
				dif_limit1 = pKline->dif;
			}

			if (Utils::DoubleCmp(pKline->dif, 0.0) > 0) {
				macd_sum1 += pKline->dif;
			}
		}

		if (type == TREND_DOWN) {
			if (Utils::DoubleCmp(pKline->dif, dif_limit1) < 0) {
				dif_limit1 = pKline->dif;
			}

			if (Utils::DoubleCmp(pKline->dif, 0.0) < 0) {
				macd_sum1 += pKline->dif;
			}
		}
	}
	
	int32_t count = klineSection1.end_idx - klineSection1.start_idx + 1;
	if (count > 0) {
		macd_avg1 = macd_sum1 / double(count);
	}

	for (size_t i = klineSection2.start_idx; i <= klineSection2.end_idx; i++) {
		pKline = oriKlines[i];
		if (type == TREND_UP) {
			if (Utils::DoubleCmp(pKline->dif, dif_limit2) > 0) {
				dif_limit2 = pKline->dif;
			}

			if (Utils::DoubleCmp(pKline->dif, 0.0) > 0) {
				macd_sum2 += pKline->dif;
			}
		}

		if (type == TREND_DOWN) {
			if (Utils::DoubleCmp(pKline->dif, dif_limit2) < 0) {
				dif_limit2 = pKline->dif;
			}

			if (Utils::DoubleCmp(pKline->dif, 0.0) < 0) {
				macd_sum2 += pKline->dif;
			}
		}
	}

	count = klineSection2.end_idx - klineSection2.start_idx + 1;
	if (count > 0) {
		macd_avg2 = macd_sum2 / double(count);
	}

	if (type == TREND_UP) {
		if ((Utils::DoubleCmp(oriKlines[klineSection2.end_idx]->close, oriKlines[klineSection1.end_idx]->close) > 0) &&
			(Utils::DoubleCmp(dif_limit2, dif_limit1) < 0 || Utils::DoubleCmp(macd_sum2, macd_sum1) < 0 || Utils::DoubleCmp(macd_avg2, macd_avg1) > 0) ) {
			return TOP_DIVERGENCE;
		}
	}

	if (type == TREND_DOWN) {
		if ((Utils::DoubleCmp(oriKlines[klineSection2.end_idx]->close, oriKlines[klineSection1.end_idx]->close) < 0) && 
			(Utils::DoubleCmp(dif_limit2, dif_limit1) > 0 || Utils::DoubleCmp(macd_sum2, macd_sum1) > 0 || Utils::DoubleCmp(macd_avg2, macd_avg1) > 0)) {
			return BOTTOM_DIVERGENCE;
		}
	}

	//
	return NO_DIVERGENCE;
}
