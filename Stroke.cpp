#include "stdafx.h"
#include "ZenTheory.h"
#include "Stroke.h"
#include "DataCard.h"
#include "Utils.h"

Stroke::Stroke()
{
	
}

Stroke::~Stroke()
{
}


//根据合并且分型好的数据，生成B数据；返回值：0:成功, -1:错误
int32_t Stroke::GenerateStroke(vector<KlineMergeData*>& mergeKlineDatas, vector<StrokeData*>& strokeDatas) {
	ZenTheory* ns = ZenTheory::get_instance();
	int32_t mKlineSize = mergeKlineDatas.size();
	int32_t strokeSize = strokeDatas.size();
	SPDLOG_INFO("GenerateStroke mKlineSize:{}, strokeSize:{}", mKlineSize, strokeSize);
	StrokeData* pStroke = NULL;
	if (strokeSize > 0) { //先pop出最后一B
		pStroke = strokeDatas.back();
		strokeDatas.pop_back();
		ns->PutStrokeData(pStroke);
	}
	
	KlineMergeData* pKline = NULL;
	int32_t start_idx = 0;
	int64_t last_end_time = 0;
	int32_t index = -1;

	strokeSize = strokeDatas.size();
	if (strokeSize > 0) {
		pStroke = strokeDatas.back();
		last_end_time = pStroke->endtime;
		index = pStroke->index;

		for (int32_t i = (mKlineSize - 1); i >= 0; i--) {
			pKline = mergeKlineDatas[i];
			if (pKline->endtime == last_end_time) {
				start_idx = i;
				break;
			}
			else if (pKline->endtime < last_end_time) {
				break;
			}
		}
	}

	pStroke = NULL;

	for (int32_t i = start_idx; i < mKlineSize ; i++) {
		//for test
		//if ((mKlineSize >= 47)) {
		//	printf("aaa");
		//}

		pKline = mergeKlineDatas[i];
		if (pKline->typing != TOP_TYPING && pKline->typing != BOTTOM_TYPING) {
			if (pStroke) {
				 pStroke->vol += pKline->vol;
				 pStroke->count += pKline->count;
				 pStroke->amount += pKline->amount;
			}
			continue;
		} else {
			// 如果最开始一个分型就结束上一个分型
			if (pStroke) {
				if (pKline->typing == TOP_TYPING) {
					pStroke->high = pKline->high;
				} else {
					pStroke->low = pKline->low;
				}

				pStroke->endtime = pKline->endtime;
				pStroke->vol += pKline->vol;
				pStroke->count += pKline->count;
				pStroke->amount += pKline->amount;
				strokeDatas.push_back(pStroke);
				//for test
				//if (Utils::DoubleCmp(pStroke->low, 3124.4) == 0) {
				//	SPDLOG_DEBUG("index:{}", pStroke->index);
				//}
			}

			pStroke = ns->GetStrokeData();
			index++;
			pStroke->index = index;
			// for test
			//if ((index == 4) && (mKlineSize >=47)&&(i==22)) {
			//	printf("aaa");
			//}

			//这里的starttime改为合并Kline的开始时间，防止B起点数据丢失问题
			//pStroke->starttime = pKline->endtime;
			pStroke->starttime = pKline->starttime;
			if (pKline->typing == TOP_TYPING) {
				pStroke->direction = DIRECTION_DOWN;
				pStroke->high = pKline->high;
			} else {
				pStroke->direction = DIRECTION_UP;
				pStroke->low = pKline->low;
			}
		}
	}

	if ((pStroke) && (strokeSize > 0)) {
		if (pStroke != strokeDatas.back()) {
			ns->PutStrokeData(pStroke);
		}
	}

	return 0;
}

//根据B数据和原始Kline数据，找出每一B的开始原始Kline索引和结束Kline索引，返回值：0:成功, -1:错误
int32_t Stroke::FindStrokeKlineIdx(vector<StrokeData*>& strokeDatas, vector<KlineData*>& oriKlines) {
	int32_t oriKlinesSize = oriKlines.size();
	int32_t strokeSize = strokeDatas.size();
	SPDLOG_INFO("FindStrokeKlineIdx strokeDatas.size():{}", strokeSize);
	if (oriKlinesSize == 0 || strokeSize == 0) {
		//SPDLOG_WARN("FindStrokeKlineIdx oriKlinesSize:{}, strokeSize:{}", oriKlinesSize, strokeSize);
		return -1;
	}

	KlineData* pKline = NULL;
	StrokeData* pStroke = NULL;
	int32_t lastStrokeIdx = -1;
	int32_t lastKlineIdx = 0;
	char direction = 0;
	for (int32_t i = (strokeSize - 1); i >= 0; i--) {
		pStroke = strokeDatas[i];
		if ((pStroke->start_kline_idx != 0) && (pStroke->end_kline_idx != 0)) {
			//
			lastStrokeIdx = i;
			lastKlineIdx = pStroke->end_kline_idx;
			break;
		}
	}

	for (int32_t i = lastStrokeIdx+1; i < strokeSize; i++) {
		// for test
		//if (i == 24245) {
		//	printf("aaa");
		//}

		pStroke = strokeDatas[i];
		direction = pStroke->direction;
		for (int32_t j = lastKlineIdx; j < oriKlinesSize-1; j++) { //最后一根K线不参与运算
			// for test
			//if (j == 295) {
			//	printf("aaa");
			//}
			pKline = oriKlines[j];
			if (pKline->starttime >= pStroke->starttime && pKline->starttime < pStroke->endtime)  {
				if (pStroke->direction == 1 && Utils::DoubleCmp(pStroke->low, pKline->low) == 0) {
					if (pStroke->start_kline_idx == 0) {
						pStroke->start_kline_idx = j;
						continue;
					}
				} else if (pStroke->direction == 2 && Utils::DoubleCmp(pStroke->high, pKline->high) == 0) {
					if (pStroke->start_kline_idx == 0) {
						pStroke->start_kline_idx = j;
						continue;
					}
				}

				if (pStroke->direction == 1 && Utils::DoubleCmp(pStroke->high, pKline->high) == 0) {
					pStroke->end_kline_idx = (pStroke->end_kline_idx == 0) ? j : pStroke->end_kline_idx;
					lastKlineIdx = j;
					break;
				} else if (pStroke->direction == 2 && Utils::DoubleCmp(pStroke->low, pKline->low) == 0) {
					pStroke->end_kline_idx = (pStroke->end_kline_idx == 0) ? j : pStroke->end_kline_idx; 
					lastKlineIdx = j;
					break;
				}
			}
		}
	}

	return 0;
}

