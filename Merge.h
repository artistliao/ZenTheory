#ifndef __MERGE_H__
#define __MERGE_H__

#include "stdafx.h"
#include "ZenTheory.h"

template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
class Merge
{
public:
	Merge();
	~Merge();

public:
	//Kline合并
	static int32_t MergeKline(vector<T_FOR_MERGE_DATA*> & oriKlineData, vector<T_MERGED_DATA*>& mergeKlineData);

	//MergeKline和Kline的包含关系 返回值：1:向上，2:向下，3:K1包含K2, 4:K2包含K1, -1:错误
	static int32_t ContainRelation(const T_MERGED_DATA* pKline1, const T_FOR_MERGE_DATA* pKline2);

	//MergeKline和Kline的包含关系 返回值：1:向上，2:向下，3:K1包含K2, 4:K2包含K1, -1:错误
	static int32_t ContainRelationForKline(const T_FOR_MERGE_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline);

	static int32_t ContainRelationForMergedKline(const T_MERGED_DATA* pMergeKline1, const T_MERGED_DATA* pMergeKline2);

	// 传入MergeKline、Kline、方向， 修改新的pMergeKline的值。
	static int32_t NewMergedKline(T_MERGED_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline, int32_t direction);

	// 传入MergeKline、Kline、前置方向、包含关系，修改pMergeKline的值。 relation:pKline1和pKline2的包含关系
	static int32_t GenerateMergedKline(T_MERGED_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline, int32_t relation);

};

template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::Merge()
{

}

template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::~Merge()
{

}

template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
int32_t Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::MergeKline(vector<T_FOR_MERGE_DATA*>& oriKlineData, vector<T_MERGED_DATA*>& mergeKlineData) {
	int currDirection = 0; // 初始方向
	int32_t oriKlineSize = oriKlineData.size();
	if (oriKlineSize <= 2) {
		SPDLOG_WARN("error oriKlineSize:{}", oriKlineSize);
		return -1;
	}

	T_MERGED_DATA* pMergeKline = NULL;
	int32_t iRet1 = 0;
	int64_t start_ori_idx = -1;
	int32_t mergeKlineSize = mergeKlineData.size();
	int32_t index = -1;
	if (mergeKlineSize >= 2) {
		pMergeKline = mergeKlineData[mergeKlineSize - 2];
		iRet1 = ContainRelationForMergedKline(mergeKlineData[mergeKlineSize-2], mergeKlineData[mergeKlineSize-1]);
		if ((iRet1 == DIRECTION_UP || iRet1 == DIRECTION_DOWN)) {
			currDirection = iRet1;
		}
		else {
			SPDLOG_WARN("error ContainRelation:{}", iRet1);
			return -2;
		}

		pMergeKline = mergeKlineData[mergeKlineSize - 1];
		index = (pMergeKline->index - 1);
		mergeKlineData.pop_back();

		int64_t starttime = pMergeKline->starttime;
		for (int32_t i =(oriKlineSize - 2); i >=0; i--) { //最后1根K线先不参与合并
			if (oriKlineData[i]->starttime == starttime) {
				start_ori_idx = i;
				break;
			}
		}
	}
	else {
		for (size_t i = 0; i < oriKlineSize - 2; i++) { //最后1根K线先不参与合并
			iRet1 = ContainRelationForKline(oriKlineData[i], oriKlineData[i + 1]);
			if ((iRet1 == DIRECTION_UP || iRet1 == DIRECTION_DOWN)) {
				currDirection = iRet1;
				break;
			}
			else {
				continue;
			}
		}

		if (currDirection != DIRECTION_UP && currDirection != DIRECTION_DOWN) {
			SPDLOG_WARN("error currDirection:{}", currDirection);
			return -3;
		}

		start_ori_idx = 0;
		if (mergeKlineSize == 1) {
			pMergeKline = mergeKlineData[0];
			index = (pMergeKline->index - 1);
			mergeKlineData.pop_back();
		}
	}

	if (start_ori_idx == -1) {
		SPDLOG_WARN("error start_ori_idx:{}", start_ori_idx);
		return -4;
	}

	if (!pMergeKline) {
		pMergeKline = new T_MERGED_DATA;
		memset(pMergeKline,0 , sizeof(T_MERGED_DATA));
	}

	index++;
	pMergeKline->index = index;
	NewMergedKline(pMergeKline, oriKlineData[start_ori_idx], currDirection);

	int32_t relation = 0;
	for (int32_t i = (start_ori_idx+1); i < oriKlineSize-1; i++) { //最后1根K线先不参与合并
		relation = ContainRelation(pMergeKline, oriKlineData[i]);
		if (relation == DIRECTION_UP || relation == DIRECTION_DOWN) {
			mergeKlineData.push_back(pMergeKline);
			pMergeKline = new T_MERGED_DATA;
			memset(pMergeKline, 0, sizeof(T_MERGED_DATA));
			index++;
			pMergeKline->index = index;
			NewMergedKline(pMergeKline, oriKlineData[i], relation);
		}
		else {
			GenerateMergedKline(pMergeKline, oriKlineData[i], relation);
		}
	}

	mergeKlineData.push_back(pMergeKline);
	return 0;
}

//MergeKline和Kline的包含关系 返回值：1:向上，2:向下，3:K1包含K2, 4:K2包含K1, -1:错误
template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
int32_t Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::ContainRelation(const T_MERGED_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline) {
	if (!pMergeKline || !pKline) {
		SPDLOG_WARN("error param, pMergeKline:0x{:x}, pKline:0x{:x}", uint64_t(pMergeKline), uint64_t(pKline));
		return -1;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low)<0 && Utils::DoubleCmp(pMergeKline->high, pKline->high)<0) {
		return DIRECTION_UP;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low)>0 && Utils::DoubleCmp(pMergeKline->high, pKline->high)>0) {
		return DIRECTION_DOWN;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low)<=0 && Utils::DoubleCmp(pMergeKline->high, pKline->high)>=0) {
		return FRONT_CONTAIN_BACK;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low)>=0 && Utils::DoubleCmp(pMergeKline->high, pKline->high)<=0) {
		return BACK_CONTAIN_FRONT;
	}

	return -1;
}

template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
int32_t Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::ContainRelationForKline(const T_FOR_MERGE_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline) {
	if (!pMergeKline || !pKline) {
		SPDLOG_WARN("error param, pMergeKline:{}, pKline:{}", uint64_t(pMergeKline), uint64_t(pKline));
		return -1;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low) < 0 && Utils::DoubleCmp(pMergeKline->high, pKline->high) < 0) {
		return DIRECTION_UP;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low) > 0 && Utils::DoubleCmp(pMergeKline->high, pKline->high) > 0) {
		return DIRECTION_DOWN;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low) <= 0 && Utils::DoubleCmp(pMergeKline->high, pKline->high) >= 0) {
		return FRONT_CONTAIN_BACK;
	}

	if (Utils::DoubleCmp(pMergeKline->low, pKline->low) >= 0 && Utils::DoubleCmp(pMergeKline->high, pKline->high) <= 0) {
		return BACK_CONTAIN_FRONT;
	}

	return -1;
}

template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
int32_t Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::ContainRelationForMergedKline(const T_MERGED_DATA* pMergeKline1, const T_MERGED_DATA* pMergeKline2) {
	if (!pMergeKline1 || !pMergeKline2) {
		SPDLOG_WARN("error param, pMergeKline1:{}, pMergeKline2:{}", uint64_t(pMergeKline1), uint64_t(pMergeKline2));
		return -1;
	}

	if (Utils::DoubleCmp(pMergeKline1->low, pMergeKline2->low) < 0 && Utils::DoubleCmp(pMergeKline1->high, pMergeKline2->high) < 0) {
		return DIRECTION_UP;
	}

	if (Utils::DoubleCmp(pMergeKline1->low, pMergeKline2->low) > 0 && Utils::DoubleCmp(pMergeKline1->high, pMergeKline2->high) > 0) {
		return DIRECTION_DOWN;
	}

	if (Utils::DoubleCmp(pMergeKline1->low, pMergeKline2->low) <= 0 && Utils::DoubleCmp(pMergeKline1->high, pMergeKline2->high) >= 0) {
		return FRONT_CONTAIN_BACK;
	}

	if (Utils::DoubleCmp(pMergeKline1->low, pMergeKline2->low) >= 0 && Utils::DoubleCmp(pMergeKline1->high, pMergeKline2->high) <= 0) {
		return BACK_CONTAIN_FRONT;
	}

	return -1;
}

// 传入MergeKline、Kline、方向， 修改新分配的pMergeKline的值。
template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
int32_t Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::NewMergedKline(T_MERGED_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline, int32_t direction) {
	if (!pKline || !pMergeKline) {
		SPDLOG_WARN("error param, pKline:{}, pMergeKline:{}", uint64_t(pKline), uint64_t(pMergeKline));
		return -1;
	}

	pMergeKline->start_idx = pKline->index;
	pMergeKline->end_idx = pKline->index;
	pMergeKline->starttime = pKline->starttime;
	pMergeKline->endtime = pKline->endtime;
	pMergeKline->vol = pKline->vol;
	pMergeKline->direction = direction;
	pMergeKline->typing = 0;
	pMergeKline->count = 1;
	pMergeKline->high = pKline->high;
	pMergeKline->low = pKline->low;
	pMergeKline->amount = pKline->amount;

	return 0;
}

// 传入MergeKline、Kline、前置方向、包含关系，修改pMergeKline的值。preDirection:pKline1的前置方向; relation:pKline1和pKline2的包含关系
template<typename T_MERGED_DATA, typename T_FOR_MERGE_DATA>
int32_t Merge<T_MERGED_DATA, T_FOR_MERGE_DATA>::GenerateMergedKline(T_MERGED_DATA* pMergeKline, const T_FOR_MERGE_DATA* pKline, int32_t relation) {
	if (!pKline || !pMergeKline) {
		SPDLOG_WARN("GenerateMergedKline error param, pMergeKline:0x{:x}, pKline:0x{:x}", uint64_t(pMergeKline), uint64_t(pKline));
		return -1;
	}

	int32_t preDirection = pMergeKline->direction;
	if (preDirection != DIRECTION_UP && preDirection != DIRECTION_DOWN) {
		SPDLOG_WARN("GenerateMergedKline error preDirection:{}, pMergeKline->endtime:{}", preDirection, pMergeKline->endtime);
		return -1;
	}

	if (relation != FRONT_CONTAIN_BACK && relation != BACK_CONTAIN_FRONT) {
		SPDLOG_WARN("GenerateMergedKline error relation:{}, pKline->starttime:{}", relation, pKline->starttime);
		return -1;
	}

	switch (preDirection)
	{
		case DIRECTION_UP:
		{
			pMergeKline->end_idx = pKline->index;
			pMergeKline->endtime = pKline->endtime;
			pMergeKline->vol += pKline->vol;
			pMergeKline->count += 1;
			pMergeKline->high = Utils::DoubleCmp(pMergeKline->high, pKline->high)>0 ? pMergeKline->high : pKline->high;
			pMergeKline->low = Utils::DoubleCmp(pMergeKline->low, pKline->low)>0 ? pMergeKline->low : pKline->low;
			pMergeKline->amount += pKline->amount;
			pMergeKline->is_merge = 1;
		}
		break;

		case DIRECTION_DOWN:
		{
			pMergeKline->end_idx = pKline->index;
			pMergeKline->endtime = pKline->endtime;
			pMergeKline->vol += pKline->vol;
			pMergeKline->count += 1;
			pMergeKline->high = Utils::DoubleCmp(pMergeKline->high, pKline->high)<0 ? pMergeKline->high : pKline->high;
			pMergeKline->low = Utils::DoubleCmp(pMergeKline->low, pKline->low)<0 ? pMergeKline->low : pKline->low;
			pMergeKline->amount += pKline->amount;
			pMergeKline->is_merge = 1;
		}
		break;

		default:
			return -1;
	}

	return 0;
}


#endif	// __MERGE_H__


