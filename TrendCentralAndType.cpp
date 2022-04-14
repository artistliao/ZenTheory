
#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "TrendCentralAndType.h"

TrendCentral::TrendCentral()
{

}

TrendCentral::~TrendCentral()
{
}


// 
int32_t TrendCentral::DivideTrendCentral(vector<StrokeData*>& StrokeDatas, vector<TrendCentralData*>& trendCentralDatas, vector<TrendTypeData*>& trendTypeDatas) {
	SPDLOG_INFO("DivideTrendCentral StrokeDatas size:{}, trendCentralDatas size:{}, trendTypeDatas size:{}", StrokeDatas.size(), trendCentralDatas.size(), trendTypeDatas.size());
	ZenTheory* ns = ZenTheory::get_instance();

	// 
	TrendCentral tc;
	TrendType tt;
	StrokeData* pStroke = nullptr;
	TrendCentralData* pTC = nullptr;
	TrendCentralData* pLastTC = nullptr;
	int32_t next_stroke_start_idx = 0;
	int32_t index = -1;
	size_t strokeSize = StrokeDatas.size();
	int32_t tcSize = trendCentralDatas.size();
	if (tcSize > 0) {
		pTC = *(trendCentralDatas.rbegin());
		next_stroke_start_idx = pTC->end_stroke_idx + 2;
		index = pTC->index;
	}

	int32_t iRet = 0;
 
	TrendCentralData* pTrendCentral = ns->GetTrendCentralData();
	index++;
	pTrendCentral->index = index;
	pTrendCentral->trend_type = -1;
	pTrendCentral->trend_type_confirm = TT_NOT_CONFIRM;
	int32_t next_tc_start_idx = 0;
	for (int32_t i = next_stroke_start_idx; i < strokeSize; ) {
		//for test
		if (i == 109 && strokeSize==112) {
			SPDLOG_DEBUG("i:{}", i);
		}
		pStroke = StrokeDatas[i];
		if (Utils::DoubleCmp(pStroke->low, 3419.01) == 0) {
			SPDLOG_DEBUG("i:{}", i);
		}

		if (strokeSize == (i + 3) && Utils::DoubleCmp(StrokeDatas[strokeSize-1]->low, 3534.92)==0 && StrokeDatas[strokeSize - 1]->direction==DIRECTION_UP) {
			SPDLOG_DEBUG("i:{}", i);
		}

		if (trendCentralDatas.size() > 0) {
			pLastTC = trendCentralDatas.back();
		}

		iRet = tc.FindTrendCentral(StrokeDatas, i, pTrendCentral, pLastTC);
		if (iRet == -1) {
			SPDLOG_WARN("FindTrendCentral error iRet:{}", iRet);
			return -1;
		}
		else if (iRet == -2) {
			//SPDLOG_WARN("FindTrendCentral end lineIdx:{}", i);
			break;
		}
		else if (iRet == -3) {
			i++;
			continue;
		}
		else if (iRet == 0) {
			trendCentralDatas.push_back(pTrendCentral);
			//for test
			//if (pTrendCentral->index == 3 && pTrendCentral->start_line_idx == 17) {
			//	printf("aaa");
			//}
			if (Utils::DoubleCmp(pTrendCentral->low, 3534.92) == 0) {
				SPDLOG_DEBUG("i:{}", i);
			}

			tt.DivideTrendType(StrokeDatas, trendCentralDatas, trendTypeDatas);
			int32_t tcSize = trendCentralDatas.size();
			int32_t delCount = 0;
			for (int32_t j = tcSize - 1; j >= 0; j--) {
				pTC = trendCentralDatas[j];
				if (pTC->trend_type_confirm == TC_INVALID) {
					delCount++;
				}
				else {
					break;
				}
			}

			i = (size_t)pTrendCentral->end_stroke_idx + 2; // 本TT过后下一个次级别走势当连接用，不能直接划分进TT
			for (int32_t j = 0; j < delCount; j++) {
				pTC = trendCentralDatas.back();
				trendCentralDatas.pop_back();
				if (j == (delCount - 1)) {
					index = pTC->index - 1;
					i = (size_t)pTC->start_stroke_idx + 1;
				}

				//delete pTC;
				ns->PutTrendCentralData(pTC);

				if (j == (delCount - 1)) {
					if (trendCentralDatas.size() > 1) {
						pTC = trendCentralDatas.back();
						if (pTC->trend_type == CONSOLIDATION) {
							pTC->trend_type_confirm = TT_NOT_CONFIRM;
						}
					}
				}
			}

			index++;
			pTrendCentral = ns->GetTrendCentralData();
			pTrendCentral->index = index;
			pTrendCentral->trend_type = -1;
			pTrendCentral->trend_type_confirm = TT_NOT_CONFIRM;
		}
	}

	if (!pTrendCentral) {
		if (trendCentralDatas.size() == 0) {
			ns->PutTrendCentralData(pTrendCentral);
		}
		else if (pTrendCentral != trendCentralDatas.back()) {
			ns->PutTrendCentralData(pTrendCentral);
		}
	}

	SPDLOG_INFO("DivideTrendCentral trendCentralDatas size:{}", trendCentralDatas.size());
	return 0;
}

//根据L寻找TT，入参：startIdx:开始L索引 出参:pTrendCentral 返回值：0:成功, <0:错误
int32_t TrendCentral::FindTrendCentral(vector<StrokeData*>& StrokeDatas, int32_t startIdx, TrendCentralData* pTrendCentral, TrendCentralData* pLastTC) {
	if (!pTrendCentral) {
		SPDLOG_WARN("FindTrendCentral pTrendCentral is null!");
		return -1;
	}

	int32_t strokeSize = StrokeDatas.size();
	if (startIdx > (strokeSize - 3)) {
		//SPDLOG_WARN("FindTrendCentral err startIdx:{}, strokeSize:{}", startIdx, strokeSize);
		return -2;
	}

	// 查找TT边界的高低点和最高点、最低点
	double high = StrokeDatas[startIdx]->high;
	double low = StrokeDatas[startIdx]->low;
	for (int32_t i = startIdx; i < startIdx + 3; i++) {
		if (Utils::DoubleCmp(StrokeDatas[i]->high, high) < 0) {
			high = StrokeDatas[i]->high;
		}

		if (Utils::DoubleCmp(StrokeDatas[i]->low, low) > 0) {
			low = StrokeDatas[i]->low;
		}
	}

	//如果TT边界的低点高于高点则不存在TT
	//也即三L低点中的高点大于高点中的低点
	if (Utils::DoubleCmp(low, high) > 0) {
		//SPDLOG_WARN("not central start from startIdx:{}", startIdx);
		return -3;
	}

	double lineHigh = 0.0;
	double lineLow = 0.0;
	double begin = 0.0;
	double end = 0.0;
	int32_t end_stroke_idx = startIdx + 2;

	//如果上一个中枢是趋势，那么本中枢要么是趋势延续；或者上一个趋势的反趋势中枢
	//这个规则暂时取消
	//if (pLastTC) {
	//	if ((pLastTC->trend_type != CONSOLIDATION) && (pLastTC->trend_type_confirm == TT_CONFIRM)) {
	//		begin = (Utils::DoubleCmp(low, pLastTC->low) > 0) ? low : pLastTC->low;
	//		end = (Utils::DoubleCmp(high, pLastTC->high) < 0) ? high : pLastTC->high;
	//		if (Utils::DoubleCmp(end, begin) >= 0) { // 有交集
	//			if (StrokeDatas[startIdx]->direction != pLastTC->trend_type) {
	//				return -3;
	//			}
	//		}
	//	}
	//}

	end_stroke_idx = startIdx + 2;

	pTrendCentral->start_stroke_idx = startIdx;
	pTrendCentral->end_stroke_idx = end_stroke_idx;
	pTrendCentral->high = high;
	pTrendCentral->low = low;

	double highest = 0.0;
	double lowest = 10000000.0;
	//TT区间计算最高值和最低值得时候要去掉进入和离开的L
	for (int32_t i = startIdx; i <= end_stroke_idx; i++) {
		lineHigh = StrokeDatas[i]->high;
		lineLow = StrokeDatas[i]->low;

		if (Utils::DoubleCmp(lineHigh, highest) > 0) {
			highest = lineHigh;
		}

		if (Utils::DoubleCmp(lineLow, lowest) < 0) {
			lowest = lineLow;
		}
	}

	pTrendCentral->highest = highest;
	pTrendCentral->lowest = lowest;
	pTrendCentral->trend_type_confirm = TT_NOT_CONFIRM;

	return 0;
}


//tt
TrendType::TrendType()
{

}

TrendType::~TrendType()
{
}

// 
int32_t TrendType::DivideTrendType(vector<StrokeData*>& strokeDatas, vector<TrendCentralData*>& tcDatas, vector<TrendTypeData*>& ttDatas) {
	StrokeData* pStroke1 = nullptr;
	StrokeData* pStroke2 = nullptr;
	TrendCentralData* pTrendCentral = nullptr;

	int32_t tcRelation = -1;
	int32_t index = 0;
	size_t tcSize = tcDatas.size();
	if (tcSize == 1) {
		return 0;
	}

	int32_t not_confirm_tc_idx = -1;
	for (int32_t i = (tcSize - 1); i > 0; i--) {
		pTrendCentral = tcDatas[i];
		if (pTrendCentral->trend_type_confirm == TT_CONFIRM) {
			break;
		}

		not_confirm_tc_idx = i;
	}

	if ((not_confirm_tc_idx == -1)) {
		SPDLOG_WARN("error not_confirm_tc_idx={}", not_confirm_tc_idx);
		return -2;
	}

	for (size_t i = not_confirm_tc_idx; i < tcSize; i++) {
		pTrendCentral = tcDatas[i];
		//for test
		//if (Utils::DoubleCmp(pTrendCentral->high, 1665.37) == 0) {
		//	cout << i << endl;
		//}

		tcRelation = JudgeTrendCentralRelation(tcDatas[i - 1], tcDatas[i]);
		if (tcRelation == -1) {
			SPDLOG_WARN("JudgeTrendCentralRelation error i:{}", i);
			return -1;
		}

		if (i == 1) {
			pStroke1 = strokeDatas[tcDatas[i - 1]->start_stroke_idx];
			pStroke2 = strokeDatas[tcDatas[i]->start_stroke_idx];
			if ((tcRelation == TC_UP) || (tcRelation == TC_DOWN)) {
				if (pStroke1->direction == tcRelation) {
					MarkTrendCentralInvalid(tcDatas, i - 1);
					return -3;
				}

				if (pStroke2->direction == tcRelation) {
					MarkTrendCentralInvalid(tcDatas, i);
					return -3;
				}

				tcDatas[i - 1]->trend_type = (char)tcRelation;
				tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
				tcDatas[i]->trend_type = (char)tcRelation;
				tcDatas[i]->trend_type_confirm = TT_CONFIRM;
			}
			else if (tcRelation == TC_OVERLAP) {
				tcDatas[i - 1]->trend_type = (char)CONSOLIDATION;
				tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
				tcDatas[i]->trend_type = (char)CONSOLIDATION;
				tcDatas[i]->trend_type_confirm = TT_NOT_CONFIRM;
			}
		}
		else {
			if ((tcRelation == TC_UP) || (tcRelation == TC_DOWN)) {
				pStroke1 = strokeDatas[tcDatas[i - 1]->start_stroke_idx];
				pStroke2 = strokeDatas[tcDatas[i]->start_stroke_idx];

				if (tcDatas[i - 1]->trend_type == (char)tcRelation) {
					if (pStroke1->direction == tcRelation) {
						MarkTrendCentralInvalid(tcDatas, i - 1);
						return -3;
					}

					if (pStroke2->direction == tcRelation) {
						MarkTrendCentralInvalid(tcDatas, i);
						return -3;
					}

					tcDatas[i - 1]->trend_type = (char)tcRelation;
					tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
					tcDatas[i]->trend_type = (char)tcRelation;
					tcDatas[i]->trend_type_confirm = TT_CONFIRM;
				}
				else if (tcDatas[i - 1]->trend_type == CONSOLIDATION && tcDatas[i - 1]->trend_type_confirm == TT_NOT_CONFIRM) {
					if (tcDatas[i - 2]->trend_type == tcRelation) {
						tcDatas[i - 1]->trend_type = (char)CONSOLIDATION;
						tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
						tcDatas[i]->trend_type = (char)CONSOLIDATION;
						tcDatas[i]->trend_type_confirm = TT_NOT_CONFIRM;
					}
					else {
						if (pStroke1->direction == tcRelation) {
							MarkTrendCentralInvalid(tcDatas, i - 1);
							return -3;
						}

						if (pStroke2->direction == tcRelation) {
							MarkTrendCentralInvalid(tcDatas, i);
							return -3;
						}

						tcDatas[i - 1]->trend_type = (char)tcRelation;
						tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
						tcDatas[i]->trend_type = (char)tcRelation;
						tcDatas[i]->trend_type_confirm = TT_CONFIRM;
					}
				}
				else if (tcDatas[i - 1]->trend_type != tcDatas[i - 2]->trend_type) {
					tcDatas[i - 1]->trend_type = (char)CONSOLIDATION;
					tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;

					tcDatas[i]->trend_type = (char)CONSOLIDATION;
					tcDatas[i]->trend_type_confirm = TT_NOT_CONFIRM;
				}
				else {
					if (tcDatas[i - 1]->trend_type_confirm == TT_NOT_CONFIRM) {
						tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
					}

					tcDatas[i]->trend_type = (char)tcRelation;
					tcDatas[i]->trend_type_confirm = TT_NOT_CONFIRM;
				}
			}
			else if ((tcRelation == TC_OVERLAP)) {
				//SPDLOG_DEBUG("tcRelation:{}, i:{}", tcRelation, i);

				if (tcDatas[i - 1]->trend_type_confirm == TT_NOT_CONFIRM) {
					if (tcDatas[i - 1]->trend_type != tcDatas[i - 2]->trend_type) {
						tcDatas[i - 1]->trend_type = (char)CONSOLIDATION;
					}

					tcDatas[i - 1]->trend_type_confirm = TT_CONFIRM;
				}

				tcDatas[i]->trend_type = CONSOLIDATION;
				tcDatas[i]->trend_type_confirm = TT_NOT_CONFIRM;
			}
		}

	}

	GenerateTTFromTC(tcDatas, ttDatas);
	return 0;
}


//判断两个TT的关系 返回值：1:上升, 2:下降, 5:有重叠, -1:错误
int32_t TrendType::JudgeTrendCentralRelation(TrendCentralData* frontTC, TrendCentralData* nextTc) {
	if (!frontTC || !nextTc) {
		SPDLOG_WARN("JudgeTrendCentralRelation frontTC:0x{:x}, nextTc:0x{:x}", uint64_t(frontTC), uint64_t(nextTc));
		return -1;
	}

	if (Utils::DoubleCmp(frontTC->high, nextTc->low) < 0) {
		return TC_UP;
	}else if (Utils::DoubleCmp(frontTC->low, nextTc->high) > 0 ) {
		return TC_DOWN;
	}else {
		return TC_OVERLAP;
	}

	return -1;
}

// 
int32_t TrendType::MarkTrendCentralInvalid(vector<TrendCentralData*>& tcDatas, int32_t startIdx) {
	TrendCentralData* pTrendCentral = nullptr;

	size_t trendCentralSize = tcDatas.size();
	for (size_t i = startIdx; i < trendCentralSize; i++) {
		pTrendCentral = tcDatas[i];
		pTrendCentral->trend_type_confirm = TC_INVALID;
	}

	return 0;
}

int32_t TrendType::GenerateTTFromTC(vector<TrendCentralData*>& tcDatas, vector<TrendTypeData*>& ttDatas) {
	TrendCentralData* pTC = nullptr;
	TrendTypeData* pTT = nullptr;

	int32_t startTcIdx = 0;
	int32_t index = -1;
	size_t ttSize = ttDatas.size();
	bool bHaveNotConfirmedTT = false;
	char last_trend_type = -1;
	if (ttSize > 0) {
		pTT = ttDatas.back();
		if (pTT->confirm == TT_NOT_CONFIRM) {
			index = pTT->index;
			startTcIdx = pTT->end_central_idx + 1; //
			bHaveNotConfirmedTT = true;
			last_trend_type = pTT->type;
		}
		else if (pTT->confirm == TT_CONFIRM) {
			startTcIdx = pTT->end_central_idx + 1; //
			index = pTT->index;
			bHaveNotConfirmedTT = false;
		}
	}
	else {
		startTcIdx = 0; //
		bHaveNotConfirmedTT = false;
	}

	size_t tcSize = tcDatas.size();
	for (size_t i = startTcIdx; i < tcSize; i++) {
		pTC = tcDatas[i];
		if (pTC->trend_type_confirm != TT_CONFIRM) {
			break;
		}

		if (bHaveNotConfirmedTT) {
			if (pTC->trend_type != last_trend_type) {
				pTT->confirm = TT_CONFIRM;

				pTT = new TrendTypeData;
				memset(pTT, 0, sizeof(TrendTypeData));
				index++;
				pTT->index = index;
				pTT->start_central_idx = i;
				pTT->end_central_idx = i;
				pTT->start_stroke_idx = pTC->start_stroke_idx;
				pTT->end_stroke_idx = pTC->end_stroke_idx;
				pTT->type = pTC->trend_type;
				if (pTC->trend_type == CONSOLIDATION) {
					pTT->confirm = TT_CONFIRM;
					bHaveNotConfirmedTT = false;
				}
				else {
					pTT->confirm = TT_NOT_CONFIRM;
					bHaveNotConfirmedTT = true;
				}
				last_trend_type = pTC->trend_type;

				ttDatas.push_back(pTT);
			} else {
				pTT->end_central_idx = i;
				pTT->end_stroke_idx = pTC->end_stroke_idx;
			}
		}
		else {
			pTT = new TrendTypeData;
			memset(pTT, 0, sizeof(TrendTypeData));
			index++;
			pTT->index = index;
			pTT->start_central_idx = i;
			pTT->end_central_idx = i;
			pTT->start_stroke_idx = pTC->start_stroke_idx;
			pTT->end_stroke_idx = pTC->end_stroke_idx;
			pTT->type = pTC->trend_type;
			if (pTC->trend_type == CONSOLIDATION) {
				pTT->confirm = TT_CONFIRM;
				bHaveNotConfirmedTT = false;
			}
			else {
				pTT->confirm = TT_NOT_CONFIRM;
				bHaveNotConfirmedTT = true;
			}
			last_trend_type = pTC->trend_type;

			ttDatas.push_back(pTT);
		}
	}

	return 0;
}

