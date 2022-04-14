#include "stdafx.h"
#include "ZenTheory.h"
#include "Utils.h"
#include "Merge.h"
#include "Typing.h"
#include "LineSegment.h"
#include "DataCard.h"


LineSegment::LineSegment()
{
}

LineSegment::~LineSegment()
{
}

//根据B数据生成L 返回值：0:成功, -1:错误
int32_t LineSegment::GenerateLineSegment(const string& code, const string& period, vector<StrokeData*>& strokeDatas, vector<LineSegmentData*>& lineSegmentDatas) {
	int32_t strokeDataSize = strokeDatas.size();
	if (strokeDataSize <= 1) {
		//SPDLOG_WARN("GenerateLineSegment error strokeDataSize:{}", strokeDataSize);
		return -1;
	}

	ZenTheory* ns = ZenTheory::get_instance();
	//vector<LineSegmentData*>& oldLines = ns->OldLineSegments["000001.XSHG"]["1min"];
	KlineData* pKline = nullptr;
	vector<KlineData*>& oriKlines = ns->OriKlines[code][period];
	auto pSecu = ns->m_futures_code_map[code];
	if (!pSecu) {
		SPDLOG_ERROR("m_futures_code_map not find:{}", code);
		return -1;
	}

	int32_t nextLineStartIdx = 0;
	int32_t index = -1;
	int32_t idx = 0;
	LineSegmentData* pLineSegment = nullptr;
	int32_t lineDataSize = lineSegmentDatas.size();
	if (lineDataSize > 0) {
		pLineSegment = *(lineSegmentDatas.rbegin());
		nextLineStartIdx = pLineSegment->end_stroke_idx + 1;
		index = pLineSegment->index;
	}

	int32_t iRet = 0;
	if (lineDataSize == 0) {
		int32_t direction = strokeDatas[0]->direction;
		iRet = FindFirstLineSegment(strokeDatas, direction, nextLineStartIdx);
		if ((iRet != HAVE_LINE_SEGMENT)) {
			//SPDLOG_WARN("FindFirstLineSegment error, direction:{}, iRet:{}", direction, iRet);
			return -1;
		}
	}

	pLineSegment = ns->GetLineSegmentData();
	memset(pLineSegment, 0, sizeof(LineSegmentData));
	index++;
	pLineSegment->index = index;
	for (size_t i = nextLineStartIdx; i < strokeDataSize-1; ) { //最后一笔处于不确定的状态；不参与线段划分

		iRet = FindLineSegmentInDesignatedDirection(strokeDatas, i, strokeDatas[i]->direction, pLineSegment, nextLineStartIdx);
		if (iRet == HAVE_LINE_SEGMENT) {
			pLineSegment->direction = strokeDatas[i]->direction;
			lineSegmentDatas.push_back(pLineSegment);
			// fa notice
			std::lock_guard<std::mutex> lock(ns->notice_mtx);
			int32_t now_ts = int32_t(time(NULL));
			if ((Utils::IsSameDay(Utils::IntTimeToTs(pLineSegment->starttime), now_ts) ||
				Utils::IsSameDay(Utils::IntTimeToTs(pLineSegment->endtime), now_ts)) && (ns->is_analysis==0)) {
				NoticeLine* pNoticeLine = new NoticeLine;
				memset(pNoticeLine, 0, sizeof(pNoticeLine));
				snprintf(pNoticeLine->code, sizeof(pNoticeLine->code), "%s", code.c_str());
				snprintf(pNoticeLine->sec_type, sizeof(pNoticeLine->sec_type), "futures");
				snprintf(pNoticeLine->name, sizeof(pNoticeLine->name), "%s", pSecu->display_name);
				snprintf(pNoticeLine->period, sizeof(pNoticeLine->period), "%s", period.c_str());
				//pNoticeLine->trigger_ts = int32_t(time(NULL));
				//for test
				pKline = oriKlines.back();
				pNoticeLine->trigger_ts = Utils::IntTimeToTs(pKline->starttime);
				pNoticeLine->direction = pLineSegment->direction;
				pNoticeLine->line_start_ts = Utils::IntTimeToTs(pLineSegment->starttime);
				pNoticeLine->line_end_ts = Utils::IntTimeToTs(pLineSegment->endtime);
				pNoticeLine->high = pLineSegment->high;
				pNoticeLine->low = pLineSegment->low;
				pKline = oriKlines.front();
				pNoticeLine->kline_start_ts = Utils::IntTimeToTs(pKline->starttime);
				ns->NoticeLines.push_back(pNoticeLine);
				ns->WriteDataTs[code] = -1;
				SPDLOG_INFO("Push NoticeLine, code:{}, period:{}, direction:{}, starttime:{}, endtime:{}, high:{}, low:{}", 
					code, period, pLineSegment->direction, pLineSegment->starttime, pLineSegment->endtime, pLineSegment->high, pLineSegment->low);
			}

			//for test 
			if (Utils::DoubleCmp(pLineSegment->low, 5026) == 0) {
				cout << index << endl;
			}

			//for test
			//idx = lineSegmentDatas.size() - 1;
			//if (idx < oldLines.size()) {
			//	if (LineSegmentCmp(pLineSegment, oldLines[idx]) != 0) {
			//		cout << index << endl;
			//		//ns->RealTimeHandleExit = 1;
			//		//goto out1;
			//	}
			//}

			pLineSegment = ns->GetLineSegmentData();
			memset(pLineSegment, 0, sizeof(LineSegmentData));
			index++;
			pLineSegment->index = index;
			
			i = nextLineStartIdx;
		} else { //包含了 HAVE_LINE_SEGMENT)
			//SPDLOG_WARN("FindLineSegmentInDesignatedDirection error, iRet:{}, i:{}", iRet, i);
			break;
		}
	}

	if (!pLineSegment) {
		if (lineSegmentDatas.size() == 0) {
			ns->PutLineSegmentData(pLineSegment);
		}
		else if (pLineSegment != *(lineSegmentDatas.rbegin())) {
			ns->PutLineSegmentData(pLineSegment);
		}
	}

out1:
	return 0;
}


//根据B数据和方向找到第一条L，返回参数：L值，下一L开始B索引，返回值：-1:错误，0:没有L，1:有L，
int32_t LineSegment::FindFirstLineSegment(vector<StrokeData*>& strokeDatas, int32_t direction, int32_t& nextLineStartIdx) {
	SPDLOG_INFO("FindFirstLineSegment start");
	size_t strokeDataSize = strokeDatas.size();
	if (strokeDataSize <= 1) {
		SPDLOG_WARN("error strokeDataSize:{}", strokeDataSize);
		return -1;
	}

	// 
	if ((direction != DIRECTION_UP) && (direction != DIRECTION_DOWN)) {
		SPDLOG_WARN("error direction:{}", direction);
		return -1;
	}

	StrokeData* pStroke = NULL;
	int32_t iRet = 0;

	vector<StrokeData*> vecStrokes;
	for (size_t i = 2; i < strokeDataSize-2; i++) {
		pStroke = strokeDatas[i];
		//B的方向和L的方向一致则不属于特征序列
		if (pStroke->direction == direction) {
			continue;
		} else {
			vecStrokes.push_back(strokeDatas[i-2]);
			vecStrokes.push_back(strokeDatas[i]);
			vecStrokes.push_back(strokeDatas[i+2]);

			iRet = JudgeLineInFirstCaseOfStrokeBreak(vecStrokes, 1);
			if ((direction == iRet)) {
				nextLineStartIdx = i;
				SPDLOG_INFO("FindFirstLineSegment result, direction:{}, i:{}", direction, i);
				return HAVE_LINE_SEGMENT;
			}
			
			vecStrokes.clear();
		}
	}

	return NO_LINE_SEGMENT;
}


//根据B数据，起始索引，L方向，找到L，返回参数：L值，下一L开始B索引，返回值：-1:错误，0:没有L，1:有L，
int32_t LineSegment::FindLineSegmentInDesignatedDirection(vector<StrokeData*>& strokeDatas, size_t startIdx, int32_t direction, LineSegmentData* pLineSegment, int32_t& nextLineStartIdx) {
	ZenTheory* ns = ZenTheory::get_instance();
	//SPDLOG_DEBUG("FindLineSegmentInDesignatedDirection startIdx:{}, direction:{}", startIdx, direction);
	size_t strokeDataSize = strokeDatas.size();
	if (strokeDataSize <= 6) {
		//SPDLOG_WARN("error strokeDataSize:{}", strokeDataSize);
		return -1;
	}

	if ((startIdx < 2) || (startIdx > strokeDataSize-3)) {
		SPDLOG_WARN("error startIdx:{}", startIdx);
		return -1;
	}

	if ((direction != DIRECTION_UP) && (direction != DIRECTION_DOWN)) {
		SPDLOG_WARN("error direction:{}", direction);
		return -1;
	}

	if (!pLineSegment) {
		SPDLOG_WARN("error pLineSegment: 0x{:x}", uint64_t(pLineSegment));
		return -1;
	}

	int32_t relation = 0;
	int32_t index = -1;
	StrokeData* pStroke = NULL;
	FeatureSequenceData* pStdFeatureSeq = NULL;
	FeatureSequenceData* pLastStdFeatureSeq = NULL;
	Merge<FeatureSequenceData, FeatureSequenceData> merge;
	vector<FeatureSequenceData*> standardFeatureSeqs;
	Typing<FeatureSequenceData> typing;
	size_t  iFeatureSeqSize = 0;
	int32_t iTyping = 0;
	int32_t iHaveGap = 0; //是否有缺口
	size_t  endIdx = 0;
	int32_t iRet = 0;

	//遍历B数据
	for (size_t i = startIdx; i < strokeDataSize; i++) {
		pStroke = strokeDatas[i];
		//for test 
		//if ((Utils::DoubleCmp(pStroke->low, 1263.71) == 0) && strokeDataSize>(i+3)) {
		//	cout << pStroke->index << endl;
		//}

		//B的方向和L的方向一致则不属于特征序列
		if (pStroke->direction == direction) {
			continue;
		} else if (pStdFeatureSeq == NULL) {
			pStdFeatureSeq = ns->GetFeatureSeq();
			index++;
			pStdFeatureSeq->index = index;
			pStdFeatureSeq->direction = direction;
			StrokeToFeatureSequence(pStdFeatureSeq, strokeDatas[i], direction);
			standardFeatureSeqs.push_back(pStdFeatureSeq);
		} else {
			//先用B数据生成新的一个特征序列值
			pStdFeatureSeq = ns->GetFeatureSeq();
			index++;
			pStdFeatureSeq->index = index;
			pStdFeatureSeq->direction = direction;
			StrokeToFeatureSequence(pStdFeatureSeq, strokeDatas[i], direction);
			standardFeatureSeqs.push_back(pStdFeatureSeq);

			//判断是否有第一种情况的B破坏
			iFeatureSeqSize = standardFeatureSeqs.size();
			pLastStdFeatureSeq = standardFeatureSeqs[iFeatureSeqSize - 2];
			int32_t iStrokeBreak = JudgeFirstCaseStrokeBreak(pStdFeatureSeq, standardFeatureSeqs, direction);

			//
			bool bHaveLine = false;
			size_t j = 0;
			if (iStrokeBreak == 1) { //有第一种类型的B破坏
				int32_t iLineBreak = JudgeFirstCaseLineBreak(pStdFeatureSeq, strokeDatas, i+1, direction);

				//确认了L
				if (iLineBreak == 1) {
					LineAssignmentAndClear(pLineSegment, nextLineStartIdx, strokeDatas, startIdx, i, direction, standardFeatureSeqs);
					return HAVE_LINE_SEGMENT;
				}
				else if (iLineBreak == 2) {
					ClearFeatureSeqs(standardFeatureSeqs);
					return UNCERTAIN_LINE_SEGMENT;
				}
				else {
					relation = merge.ContainRelation(pLastStdFeatureSeq, pStdFeatureSeq);
					if (relation == FRONT_CONTAIN_BACK || relation == BACK_CONTAIN_FRONT) {
						merge.GenerateMergedKline(pLastStdFeatureSeq, pStdFeatureSeq, relation);
						standardFeatureSeqs.pop_back();
						ns->PutFeatureSeq(pStdFeatureSeq);
						pStdFeatureSeq= standardFeatureSeqs.back();

						//iFeatureSeqSize = standardFeatureSeqs.size();
						//pLastStdFeatureSeq = standardFeatureSeqs[iFeatureSeqSize - 2];
						//pStdFeatureSeq = standardFeatureSeqs[iFeatureSeqSize - 1];
						//int32_t iStrokeBreak2 = JudgeFirstCaseStrokeBreak(pStdFeatureSeq, standardFeatureSeqs, direction);
						//if (iStrokeBreak2 == 1) {
						//	int32_t iLineBreak2 = JudgeFirstCaseLineBreak(pStdFeatureSeq, strokeDatas, i + 1, direction);
						//	//确认了L
						//	if (iLineBreak2 == 1) {
						//		LineAssignmentAndClear(pLineSegment, nextLineStartIdx, strokeDatas, startIdx, i, direction, standardFeatureSeqs);
						//		return HAVE_LINE_SEGMENT;
						//	}else if (iLineBreak == 2) {
						//		ClearFeatureSeqs(standardFeatureSeqs);
						//		return UNCERTAIN_LINE_SEGMENT;
						//	}
						//}
					}
				}
			} else { //没有第一种情况的破坏
				relation = merge.ContainRelation(pLastStdFeatureSeq, pStdFeatureSeq);
				if (relation == FRONT_CONTAIN_BACK || relation == BACK_CONTAIN_FRONT) {
					merge.GenerateMergedKline(pLastStdFeatureSeq, pStdFeatureSeq, relation);
					standardFeatureSeqs.pop_back();
					ns->PutFeatureSeq(pStdFeatureSeq);
					pStdFeatureSeq = standardFeatureSeqs.back();

					//iFeatureSeqSize = standardFeatureSeqs.size();
					//pLastStdFeatureSeq = standardFeatureSeqs[iFeatureSeqSize - 2];
					//pStdFeatureSeq = standardFeatureSeqs[iFeatureSeqSize - 1];
					//int32_t iStrokeBreak2 = JudgeFirstCaseStrokeBreak(pStdFeatureSeq, standardFeatureSeqs, direction);
					//if (iStrokeBreak2 == 1) {
					//	int32_t iLineBreak2 = JudgeFirstCaseLineBreak(pStdFeatureSeq, strokeDatas, i + 1, direction);
					//	//确认了L
					//	if (iLineBreak2 == 1) {
					//		LineAssignmentAndClear(pLineSegment, nextLineStartIdx, strokeDatas, startIdx, i, direction, standardFeatureSeqs);
					//		return HAVE_LINE_SEGMENT;
					//	}
					//	else if (iLineBreak2 == 2) {
					//		ClearFeatureSeqs(standardFeatureSeqs);
					//		return UNCERTAIN_LINE_SEGMENT;
					//	}
					//}
				}

			}

			//对分型进行判断
			iFeatureSeqSize = standardFeatureSeqs.size();
			if ((iFeatureSeqSize >= 3) && (standardFeatureSeqs[iFeatureSeqSize - 2]->is_merge==NOT_MERGE)) {
				iTyping = typing.JudgeTyping(standardFeatureSeqs, iFeatureSeqSize - 2);
				//有方向一致的分型
				if (iTyping == direction) {
					iHaveGap = typing.JudgeGap(standardFeatureSeqs, iFeatureSeqSize - 2, iTyping);
					if (iHaveGap < 0) {
						SPDLOG_WARN("error JudgeGap, iHaveGap:{}", iHaveGap);
						ClearFeatureSeqs(standardFeatureSeqs);
						return -1;
					}

					endIdx = size_t(standardFeatureSeqs[iFeatureSeqSize - 2]->start_idx - 1);
					if (endIdx < 0) {
						SPDLOG_WARN("typing not find endIdx, endIdx:{}", endIdx);
						ClearFeatureSeqs(standardFeatureSeqs);
						return -1;
					}

					//L破坏的第二种情况处理
					if (iHaveGap == HAVE_GAP) { // 有缺口处理
						int32_t iFindTyping = ((iTyping == TOP_TYPING) ? BOTTOM_TYPING : TOP_TYPING);
						iRet = FindOppositeTyping(strokeDatas, standardFeatureSeqs, endIdx + 1, iFindTyping);
						if (iRet == 1) { //找到了合适的分型
							//合并赋值
							LineAssignmentAndClear(pLineSegment, nextLineStartIdx, strokeDatas, startIdx, endIdx + 1, direction, standardFeatureSeqs);
							return HAVE_LINE_SEGMENT;
						}
						else if (iRet == 2) {
							ClearFeatureSeqs(standardFeatureSeqs);
							return UNCERTAIN_LINE_SEGMENT;
						}
					}
				}
			}

		}
	}

	ClearFeatureSeqs(standardFeatureSeqs);
	return NO_LINE_SEGMENT;
}


//L赋值和清理，输出参数：pLineSegment，nextLineStartIdx, 返回结果 -1:出错 0:成功
int32_t LineSegment::LineAssignmentAndClear(LineSegmentData* pLineSegment, int32_t& nextLineStartIdx, vector<StrokeData*>& strokeDatas, size_t startIdx, size_t endIdx, int32_t direction, vector<FeatureSequenceData*>& standardFeatureSeqs) {
	if (!pLineSegment) {
		SPDLOG_WARN("LineAssignmentAndClear, pLineSegment:0x{:x}", uint64_t(pLineSegment));
		return -1;
	}

	for (size_t k = startIdx; k < endIdx; k++) {
		//合并赋值L
		if (k == startIdx) {
			pLineSegment->start_stroke_idx = k;
			pLineSegment->starttime = strokeDatas[k]->starttime;
			pLineSegment->direction = strokeDatas[k]->direction;
			if (direction == DIRECTION_UP) {
				pLineSegment->low = strokeDatas[k]->low;
			} else if (direction == DIRECTION_DOWN) {
				pLineSegment->high = strokeDatas[k]->high;
			}
		}

		if (k == (endIdx - 1)) {
			pLineSegment->end_stroke_idx = k;
			pLineSegment->endtime = strokeDatas[k]->endtime;
			if (direction == DIRECTION_UP) {
				pLineSegment->high = strokeDatas[k]->high;
			} else if (direction == DIRECTION_DOWN) {
				pLineSegment->low = strokeDatas[k]->low;
			}
		}

		pLineSegment->vol += strokeDatas[k]->vol;
		pLineSegment->count += strokeDatas[k]->count;
		pLineSegment->amount += strokeDatas[k]->amount;
	}

	nextLineStartIdx = endIdx;
	ClearFeatureSeqs(standardFeatureSeqs);
	return 0;
}


//判断是否有第一种类型的B破坏，返回结果 -1:出错 0:没有第一种类型的B破坏 1:有第一种类型的B破坏
int32_t LineSegment::JudgeFirstCaseStrokeBreak(FeatureSequenceData* pStdFeatureSeq, vector<FeatureSequenceData*>& standardFeatureSeqs, int32_t direction) {
	int32_t stdFeatureSeqsSize = standardFeatureSeqs.size();
	if (!pStdFeatureSeq || stdFeatureSeqsSize < 2) {
		//SPDLOG_WARN("JudgeFirstCaseStrokeBreak, pFeatureSeq:0x{:x}, stdFeatureSeqsSize:{}", uint64_t(pStdFeatureSeq), stdFeatureSeqsSize);
		return -1;
	}

	//增加条件
	FeatureSequenceData* pLastStdFeatureSeq = standardFeatureSeqs[stdFeatureSeqsSize - 2];
	if (direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pStdFeatureSeq->high, pLastStdFeatureSeq->high) <= 0) {
			return 0;
		}
	} else if (direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pStdFeatureSeq->low, pLastStdFeatureSeq->low) >= 0 ) {
			return 0;
		}
	}

	for (int32_t i=stdFeatureSeqsSize-2; i>=0; i--) {
		if (direction == DIRECTION_UP) {
			if (Utils::DoubleCmp(pStdFeatureSeq->low, standardFeatureSeqs[i]->high) <= 0 && Utils::DoubleCmp(pStdFeatureSeq->high, standardFeatureSeqs[i]->high) > 0) {
				return 1;
			}
		}
		else if (direction == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(pStdFeatureSeq->high, standardFeatureSeqs[i]->low) >= 0 && Utils::DoubleCmp(pStdFeatureSeq->low, standardFeatureSeqs[i]->low) < 0) {
				return 1;
			}
		}
	}

	return 0;
}


//判断第一种类型的B破坏是否最终是L破坏，返回结果 -1:出错 0:不是L破坏 1:是L破坏 2:不确定
int32_t LineSegment::JudgeFirstCaseLineBreak(FeatureSequenceData* pFeatureSeq, vector<StrokeData*>& strokeDatas, int32_t startIdx, int32_t direction) {
	if (!pFeatureSeq) {
		SPDLOG_WARN("JudgeFirstCaseLineBreak pFeatureSeq:0x{:x}", uint64_t(pFeatureSeq));
		return -1;
	}

	size_t strokeDataSize = strokeDatas.size(); //未来函数
	int32_t iRet = 2;
	for (size_t j = startIdx; j < strokeDataSize; j++) {
		if (strokeDatas[j]->direction == direction) {
			continue;
		} else if (direction == DIRECTION_UP) {
			if (Utils::DoubleCmp(strokeDatas[j]->high, pFeatureSeq->high) > 0) {
				iRet = 0;
				break;
			}

			if (Utils::DoubleCmp(strokeDatas[j]->low, pFeatureSeq->low) < 0) {
				iRet = 1;
				break;
			}
		}
		else if (direction == DIRECTION_DOWN) {
			if (Utils::DoubleCmp(strokeDatas[j]->low, pFeatureSeq->low) < 0) {
				iRet = 0;
				break;
			}

			if (Utils::DoubleCmp(strokeDatas[j]->high, pFeatureSeq->high) > 0) {
				iRet = 1;
				break;
			}
		}
	}

	return iRet;
}


//判断特征序列和下一个特征序列B之间是否有缺口，返回结果 -1:出错 0:没有缺口 1:有缺口
int32_t LineSegment::JudgeGap(FeatureSequenceData* pFeatureSeq, StrokeData* pStroke, int32_t direction) {
	if (!pFeatureSeq || !pStroke) {
		SPDLOG_WARN("JudgeGap error direction:{}, pFeatureSeq:0x{:x}, pStroke:0x{:x}", direction, uint64_t(pFeatureSeq), uint64_t(pStroke));
		return -1;
	}

	if (direction == DIRECTION_UP) {
		if (Utils::DoubleCmp(pStroke->low, pFeatureSeq->high)>0) {
			return HAVE_GAP;
		}
	}
	else if (direction == DIRECTION_DOWN) {
		if (Utils::DoubleCmp(pStroke->high, pStroke->low)<0) {
			return HAVE_GAP;
		}
	}

	return NO_GAP;
}

//根据B数据判断时候有第一种情况的B破坏，返回结果 -1:出错 0:没有分型 1:顶分型 2:底分型
int32_t LineSegment::JudgeLineInFirstCaseOfStrokeBreak(vector<StrokeData*>& vecStrokeData, size_t idx) {
	StrokeData* leftKline	= vecStrokeData[idx - 1];
	StrokeData* rightKline	= vecStrokeData[idx + 1];
	StrokeData* selfKline	= vecStrokeData[idx];
	if (!leftKline || !rightKline || !selfKline) {
		SPDLOG_WARN("JudgeLineInFirstCaseOfStrokeBreak error idx:{}, leftKline:{}, rightKline:{}, selfKline:{}", idx, uint64_t(leftKline), uint64_t(rightKline), uint64_t(selfKline));
		return -1;
	}

	if (Utils::DoubleCmp(selfKline->high, leftKline->high) > 0  && Utils::DoubleCmp(selfKline->low, leftKline->high) <= 0 &&
		Utils::DoubleCmp(selfKline->high, rightKline->high) > 0 && Utils::DoubleCmp(selfKline->low, rightKline->low) > 0) {
		return TOP_TYPING;
	}

	if (Utils::DoubleCmp(selfKline->high, leftKline->low) >= 0 && Utils::DoubleCmp(selfKline->low, leftKline->low) < 0 &&
		Utils::DoubleCmp(selfKline->high, rightKline->high) < 0 && Utils::DoubleCmp(selfKline->low, rightKline->low) < 0) {
		return BOTTOM_TYPING;
	}

	return NO_TYPING;
}

//判断出现相反方向的分型，输入参数：startIdx:B开始序号，iFindTyping:寻找的分型类型；返回值：-1:错误, 0:没有找到合适分型，1：找到了相应的分型 2:不确定
int32_t LineSegment::FindOppositeTyping(vector<StrokeData*>& strokeDatas, vector<FeatureSequenceData*>& prevMergeFeatureSeqs, size_t startIdx, int32_t iFindTyping) {
	ZenTheory* ns = ZenTheory::get_instance();
	if ((iFindTyping != TOP_TYPING) && (iFindTyping != BOTTOM_TYPING)) {
		SPDLOG_WARN("FindOppositeTyping error iFindTyping:{}", iFindTyping);
		return -1;
	}

	size_t iPrevFeatureSeqSize = prevMergeFeatureSeqs.size();
	double frontTypingHigh = 0.0;
	double frontTypingLow  = 0.0; 
	Typing<FeatureSequenceData> typing;
	int32_t iRet = typing.FindTypingHighAndLow(prevMergeFeatureSeqs, iPrevFeatureSeqSize-2, frontTypingHigh, frontTypingLow);
	if (iRet < 0) {
		SPDLOG_WARN("error FindTypingHighAndLow, iFeatureSeqSize:{}", iPrevFeatureSeqSize);
		return -1;
	}

	int32_t direction = ((iFindTyping== TOP_TYPING) ? DIRECTION_UP : DIRECTION_DOWN);
	int32_t relation = 0;
	int32_t index = 0;
	FeatureSequenceData* pStdFeatureSeq = NULL;
	
	Merge<FeatureSequenceData, StrokeData> merge;
	size_t iFeatureSeqSize = 0;
	vector<FeatureSequenceData*> standardFeatureSeqs;
	int32_t iHaveGap = 0;
	int32_t iTyping = 0;
	size_t endIdx = 0;

	StrokeData* pStroke = NULL;
	size_t iStrokeDataSize = strokeDatas.size();
	for (size_t i = startIdx; i < iStrokeDataSize; i++) {
		pStroke = strokeDatas[i];
		//B的方向和寻找的分型方向一致则不属于特征序列
		if (pStroke->direction == direction) {
			continue;
		} else if (pStdFeatureSeq == NULL) {
			pStdFeatureSeq = ns->GetFeatureSeq();
			index++;
			pStdFeatureSeq->index = index;
			StrokeToFeatureSequence(pStdFeatureSeq, strokeDatas[i], direction);
			standardFeatureSeqs.push_back(pStdFeatureSeq);
		} else {
			relation = merge.ContainRelation(pStdFeatureSeq, strokeDatas[i]);
			if ((relation == DIRECTION_UP || relation == DIRECTION_DOWN)) {
				pStdFeatureSeq = ns->GetFeatureSeq();
				index++;
				pStdFeatureSeq->index = index;
				StrokeToFeatureSequence(pStdFeatureSeq, strokeDatas[i], direction);
				standardFeatureSeqs.push_back(pStdFeatureSeq);

				// 新的特征序列需要和原有分型比较高低点
				iRet = JudgeHighLow(pStdFeatureSeq, frontTypingHigh, frontTypingLow, direction);
				if (iRet == 1) {
					//SPDLOG_WARN("error pStdFeatureSeq->low:{}, frontTypingLow:{}, pStdFeatureSeq->high:{}, frontTypingHigh:{}", pStdFeatureSeq->low, frontTypingLow, pStdFeatureSeq->high, frontTypingHigh);
					ClearFeatureSeqs(standardFeatureSeqs);
					return 0;
				}

				iFeatureSeqSize= standardFeatureSeqs.size();
				if (iFeatureSeqSize >= 3) {
					iTyping = typing.JudgeTyping(standardFeatureSeqs, iFeatureSeqSize - 2);
					//有方向一致的分型
					if (iTyping == direction) {
						SPDLOG_DEBUG("find iTyping:{}, stroke idx:{}", iTyping, i);
						ClearFeatureSeqs(standardFeatureSeqs);
						return 1;
					}
				}
			} else {
				
				// 新的特征序列需要和原有分型比较高低点
				iRet = JudgeHighLow(strokeDatas[i]->high, strokeDatas[i]->low, frontTypingHigh, frontTypingLow, direction);
				if (iRet == 1) {
					//SPDLOG_WARN("error low:{}, frontTypingLow:{},high:{}, frontTypingHigh:{}", strokeDatas[i]->low, frontTypingLow, strokeDatas[i]->high, frontTypingHigh);
					ClearFeatureSeqs(standardFeatureSeqs);
					return 0;
				}

				merge.GenerateMergedKline(pStdFeatureSeq, strokeDatas[i], relation);
			}
		}
	}

	ClearFeatureSeqs(standardFeatureSeqs);
	return 2;
}

//新的特征序列节点和原有分型的高低点比较，返回值：-1:错误，0:没有超出原有的高/低点范围，1:超出原有的高/低点范围
int32_t LineSegment::JudgeHighLow(const FeatureSequenceData* pStdFeatureSeq, double frontTypingHigh, double frontTypingLow, int32_t direction) {
	if (!pStdFeatureSeq) {
		SPDLOG_WARN("error pStdFeatureSeq:0x{:x}", uint64_t(pStdFeatureSeq));
		return -1;
	}

	// 新的特征序列需要和原有分型比较高低点
	if (direction == DIRECTION_UP) {
		if (pStdFeatureSeq->low < frontTypingLow) {
			//SPDLOG_WARN("error pStdFeatureSeq->low:{}, frontTypingLow:{}", pStdFeatureSeq->low, frontTypingLow);
			return 1;
		}
	}
	else if (direction == DIRECTION_DOWN) {
		if (pStdFeatureSeq->high > frontTypingHigh) {
			//SPDLOG_WARN("error pStdFeatureSeq->high:{}, frontTypingHigh:{}", pStdFeatureSeq->high, frontTypingHigh);
			return 1;
		}
	} else {
		SPDLOG_WARN("error direction:{}", direction);
		return -1;
	}

	return 0;
}

//新的特征序列节点和原有分型的高低点比较，返回值：-1:错误，0:没有超出原有的高/低点范围，1:超出原有的高/低点范围
int32_t LineSegment::JudgeHighLow(double high, double low, double frontTypingHigh, double frontTypingLow, int32_t direction) {

	// 新的特征序列需要和原有分型比较高低点
	if (direction == DIRECTION_UP) {
		if (low < frontTypingLow) {
			//SPDLOG_WARN("error low:{}, frontTypingLow:{}", low, frontTypingLow);
			return 1;
		}
	}
	else if (direction == DIRECTION_DOWN) {
		if (high > frontTypingHigh) {
			//SPDLOG_WARN("error high:{}, frontTypingHigh:{}", high, frontTypingHigh);
			return 1;
		}
	}
	else {
		SPDLOG_WARN("error direction:{}", direction);
		return -1;
	}

	return 0;
}



//清理特征序列，返回值：0:正确，-1:错误
int32_t LineSegment::ClearFeatureSeqs(vector<FeatureSequenceData*>& standardFeatureSeqs) {
	ZenTheory* ns = ZenTheory::get_instance();

	size_t iFeatureSeqSize = standardFeatureSeqs.size();
	for (size_t i = 0; i < iFeatureSeqSize; i++) 
	{
		if (standardFeatureSeqs[i]) 
		{
			//delete standardFeatureSeqs[i];
			ns->PutFeatureSeq(standardFeatureSeqs[i]);
		}
	}

	standardFeatureSeqs.clear();
	return 0;
}

// 传入FeatureSequenceData、StrokeData、方向， 修改新分配的pFeatureSequence的值。
int32_t LineSegment::StrokeToFeatureSequence(FeatureSequenceData* pFeatureSequence, const StrokeData* pStroke, int32_t direction) {
	if (!pFeatureSequence || !pStroke) {
		SPDLOG_WARN("StrokeToFeatureSequence error param, pFeatureSequence:{}, pStroke:{}", uint64_t(pFeatureSequence), uint64_t(pStroke));
		return -1;
	}

	pFeatureSequence->start_idx = pStroke->index;
	pFeatureSequence->end_idx = pStroke->index;
	pFeatureSequence->starttime = pStroke->starttime;
	pFeatureSequence->endtime = pStroke->endtime;
	pFeatureSequence->vol = pStroke->vol;
	pFeatureSequence->direction = direction;
	pFeatureSequence->typing = 0;
	pFeatureSequence->count = pStroke->count;
	pFeatureSequence->high = pStroke->high;
	pFeatureSequence->low = pStroke->low;
	pFeatureSequence->amount = pStroke->amount;

	return 0;
}

// 
int32_t LineSegment::LineSegmentCmp(LineSegmentData* pLine1, LineSegmentData* pLine2) {
	if (!pLine1 || !pLine2) {
		SPDLOG_WARN("LineCmp error param, pLine1:{}, pLine2:{}", uint64_t(pLine1), uint64_t(pLine2));
		return -1;
	}

	if (pLine1->index != pLine2->index) {
		return 1;
	}

	if (pLine1->start_stroke_idx != pLine2->start_stroke_idx) {
		return 1;
	}

	if (pLine1->end_stroke_idx != pLine2->end_stroke_idx) {
		return 1;
	}

	if (pLine1->starttime != pLine2->starttime) {
		return 1;
	}

	if (pLine1->endtime != pLine2->endtime) {
		return 1;
	}

	if (pLine1->vol != pLine2->vol) {
		return 1;
	}

	if (pLine1->direction != pLine2->direction) {
		return 1;
	}

	if (Utils::DoubleCmp(pLine1->high, pLine2->high) != 0) {
		return 1;
	}

	if (Utils::DoubleCmp(pLine1->low, pLine2->low) != 0) {
		return 1;
	}

	if (Utils::DoubleCmp(pLine1->amount, pLine2->amount) != 0) {
		return 1;
	}

	return 0;
}

