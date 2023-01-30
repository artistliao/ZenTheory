#ifndef __TYPING_H__
#define __TYPING_H__

#include "stdafx.h"
#include "ZenTheory.h"

//分型类
template<class T_FOR_TYPING_DATA>
class Typing
{
public:
	Typing();
	~Typing();

public:
	// 找出并标记分型，返回值：分型的个数
	static int32_t FindoutAndMarkTyping(vector<T_FOR_TYPING_DATA*>& mergeKlineData);
	//判断某个位置的kline的分型情况，返回结果 -1:出错 0:没有分型 1:顶分型 2:底分型
	static int32_t JudgeTyping(vector<T_FOR_TYPING_DATA*>& mergeKlineData, size_t idx);
	//判断分型是否有缺口，返回结果 -1:出错 0:没有缺口 1:顶分型 2:底分型
	static int32_t JudgeGap(vector<T_FOR_TYPING_DATA*>& forTypingData, size_t idx, int32_t iTyping);
	//找出分型的高低点，输出参数：high:分型高点，low:分型低点；返回结果 -1:出错 0:成功 
	static int32_t FindTypingHighAndLow(vector<T_FOR_TYPING_DATA*>& forTypingData, size_t idx, double& high, double& low);
};


template<class T_FOR_TYPING_DATA>
Typing<T_FOR_TYPING_DATA>::Typing()
{

}

template<class T_FOR_TYPING_DATA>
Typing<T_FOR_TYPING_DATA>::~Typing()
{
}

// 找出并标记分型，返回值：分型的个数
template<class T_FOR_TYPING_DATA>
int32_t Typing<T_FOR_TYPING_DATA>::FindoutAndMarkTyping(vector<T_FOR_TYPING_DATA*>& forTypingData) {
	int32_t forTypingDataSize = forTypingData.size();
	SPDLOG_INFO("FindoutAndMarkTyping forTypingDataSize:{}", forTypingDataSize);
	if (forTypingDataSize < 3) {
		SPDLOG_WARN("not enough data! forTypingDataSize:{}", forTypingDataSize);
		return -1;
	}

	T_FOR_TYPING_DATA* pKline = NULL;
	T_FOR_TYPING_DATA* lastKline = NULL;
	int32_t iCount = 0;
	int32_t start_idx = 0;
	int32_t lastTyping = 0;
	size_t lastTypingIdx = 0;
	for (int32_t i = (forTypingDataSize - 1); i >= 0; i--) {
		pKline = forTypingData[i];
		if (pKline->typing == TOP_TYPING || pKline->typing == BOTTOM_TYPING) {
			iCount++;
		}

		if ((iCount == 1) || (iCount == 2)) {
			pKline->typing = char(NO_TYPING);
		} else if (iCount == 3) {
			lastTyping = pKline->typing;
			lastTypingIdx = i;
			start_idx = i+1;
			break;
		}
	}

	if (iCount<3) {
		start_idx = 1;
		lastTyping = 0;
		lastTypingIdx = 0;
	}
 
	int32_t iTyping = 0;
	iCount = 0;
	for (size_t i = start_idx; i < forTypingDataSize - 1; i++) {
		//for test 
		//if (i == 2545) {
		//	cout << i << endl;
		//}

		iTyping = JudgeTyping(forTypingData, i);
		if (iTyping != TOP_TYPING && iTyping != BOTTOM_TYPING) {
			continue;
		}

		pKline = forTypingData[i];
		lastKline = forTypingData[lastTypingIdx];
		if (iTyping != lastTyping) {
			//距离上一个分型差距为4以上，或者刚开始
			if (lastTyping == 0) {
				pKline->typing = char(iTyping);
				lastTyping = char(iTyping);
				lastTypingIdx = i;
				iCount++;
			}
			else if ((i - lastTypingIdx) >= 4) {
				// 距离上一个分型差距为4以上,并且
				// 当前是顶分型的话，那他的高点需要高于前一个底分型的高点
				// 当前是底分型的话，那他的低点需要低于前一个顶分型的低点
				double lastTypingHigh = 0.0;
				double lastTypingLow = 0.0;
				double thisTypingHigh = 0.0;
				double thisTypingLow = 0.0;
				FindTypingHighAndLow(forTypingData, lastTypingIdx, lastTypingHigh, lastTypingLow);
				FindTypingHighAndLow(forTypingData, i, thisTypingHigh, thisTypingLow);
				if ((((iTyping == TOP_TYPING) && (thisTypingHigh > lastTypingHigh)) || ((iTyping == BOTTOM_TYPING) && (thisTypingLow < lastTypingLow))) 
					|| ((i - lastTypingIdx) >= 21)) {
					pKline->typing = char(iTyping);
					lastTyping = char(iTyping);
					lastTypingIdx = i;
					iCount++;
				}
			}
		}
		else if (iTyping == TOP_TYPING) {
			//顶分型后接一个更高的顶分型
			if (Utils::DoubleCmp(pKline->high, lastKline->high)>0) {
				lastKline->typing = char(NO_TYPING);
				pKline->typing = char(TOP_TYPING);
				lastTyping = char(iTyping);
				lastTypingIdx = i;
			}
		}
		else if (iTyping == BOTTOM_TYPING) {
			//底分型后接一个更低的底分型
			if (Utils::DoubleCmp(pKline->low, lastKline->low) < 0) {
				lastKline->typing = char(NO_TYPING);
				pKline->typing = char(BOTTOM_TYPING);
				lastTyping = char(iTyping);
				lastTypingIdx = i;
			}
		}
	}

	return iCount;
}

//判断某个位置的kline的分型情况，返回结果 -1:出错 0:没有分型 1:顶分型 2:底分型
template<class T_FOR_TYPING_DATA>
int32_t Typing<T_FOR_TYPING_DATA>::JudgeTyping(vector<T_FOR_TYPING_DATA*>& forTypingData, size_t idx) {
	T_FOR_TYPING_DATA* leftKline	= forTypingData[idx - 1];
	T_FOR_TYPING_DATA* rightKline	= forTypingData[idx + 1];
	T_FOR_TYPING_DATA* selfKline	= forTypingData[idx];
	if (!leftKline || !rightKline || !selfKline) {
		SPDLOG_WARN("FindoutAndMarkTyping error idx:{}, leftKline:0x{:x}, rightKline:0x{:x}, selfKline:0x{:x}", idx, uint64_t(leftKline), uint64_t(rightKline), uint64_t(selfKline));
		return -1;
	}

	if (Utils::DoubleCmp(selfKline->high, leftKline->high) > 0 && Utils::DoubleCmp(selfKline->low, leftKline->low) > 0 &&
		Utils::DoubleCmp(selfKline->high, rightKline->high) > 0 && Utils::DoubleCmp(selfKline->low, rightKline->low) > 0) {
		return TOP_TYPING;
	}

	if (Utils::DoubleCmp(selfKline->high, leftKline->high) < 0 && Utils::DoubleCmp(selfKline->low, leftKline->low) < 0 &&
		Utils::DoubleCmp(selfKline->high, rightKline->high) < 0 && Utils::DoubleCmp(selfKline->low, rightKline->low) < 0) {
		return BOTTOM_TYPING;
	}

	return NO_TYPING;
}

//判断分型是否有缺口，返回结果 -1:出错 0:没有缺口 1:有缺口
template<class T_FOR_TYPING_DATA>
int32_t Typing<T_FOR_TYPING_DATA>::JudgeGap(vector<T_FOR_TYPING_DATA*>& forTypingData, size_t idx, int32_t iTyping) {
	T_FOR_TYPING_DATA* leftKline = forTypingData[idx - 1];
	T_FOR_TYPING_DATA* selfKline = forTypingData[idx];
	if (!leftKline || !selfKline) {
		SPDLOG_WARN("FindoutAndMarkTyping error iTyping:{}, leftKline:{}, selfKline:{}", iTyping, uint64_t(leftKline), uint64_t(selfKline));
		return -1;
	}

	if (iTyping == TOP_TYPING) {
		if (Utils::DoubleCmp(leftKline->high ,selfKline->low)<0) {
			return HAVE_GAP;
		}
	}
	else if (iTyping == BOTTOM_TYPING) {
		if (Utils::DoubleCmp(leftKline->low ,selfKline->high)>0) {
			return HAVE_GAP;
		}
	}

	return NO_GAP;
}

//找出分型的高低点，输出参数：high:分型高点，low:分型低点；返回结果 -1:出错 0:成功
template<class T_FOR_TYPING_DATA>
int32_t Typing<T_FOR_TYPING_DATA>::FindTypingHighAndLow(vector<T_FOR_TYPING_DATA*>& forTypingData, size_t idx, double& high, double& low) {
	high = 0.0;
	low = 100000000.0;
	T_FOR_TYPING_DATA* pKline = NULL;
	for (size_t i = (idx - 1); i <= (idx + 1); i++) {
		T_FOR_TYPING_DATA* pKline = forTypingData[i];
		if (!pKline) {
			SPDLOG_WARN("FindTypingHighAndLow error idx:{}, pKline:{}", idx, uint64_t(pKline));
			return -1;
		}

		high = (Utils::DoubleCmp(high, pKline->high) > 0) ? high : pKline->high;
		low  = (Utils::DoubleCmp(low, pKline->low) < 0) ? low : pKline->low;
	}

	return 0;
}



#endif	// __TYPING_H__

