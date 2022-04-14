#ifndef __TREND_CENTRAL_AND_TYPE_H__
#define __TREND_CENTRAL_AND_TYPE_H__

#include "stdafx.h"
#include "ZenTheory.h"


class TrendCentral
{
public:
	TrendCentral();
	~TrendCentral();

public:
	//根据L划分TT，入参：lineSegmentDatas:L集合 出参：trendCentralDatas:TT集合 返回值：0:成功, <0:错误
	//static int32_t DivideTrendCentral(vector<LineSegmentData*>& lineSegmentDatas, vector<TrendCentralData*>& trendCentralDatas, vector<TrendTypeData*>& trendTypeDatas);

	static int32_t DivideTrendCentral(vector<StrokeData*>& StrokeDatas, vector<TrendCentralData*>& trendCentralDatas, vector<TrendTypeData*>& trendTypeDatas);


	//根据L寻找TC，入参：startIdx:开始L索引 出参:pTrendCentral 返回值：0:成功, <0:错误
	//static int32_t FindTrendCentral(vector<LineSegmentData*>& lineSegmentDatas, int32_t startIdx, TrendCentralData* pTrendCentral, TrendCentralData* pLastTC);
	
	static int32_t FindTrendCentral(vector<StrokeData*>& StrokeDatas, int32_t startIdx, TrendCentralData* pTrendCentral, TrendCentralData* pLastTC);

	//寻找TT，入参：startIdx:开始L索引 出参:pTrendCentral, isUpgrade:是否有高级别的TT产生(0:没有, 1:有)  返回值：0:成功, <0:错误
	//static int32_t FindTrendCentralFromLine(const string& code, size_t startIdx, TrendCentralData* pTrendCentral, int32_t& isUpgrade);

	//寻找TT
	//static int32_t FindTrendCentral(const string& code, int32_t level, size_t startIdx, TrendCentralData* pTrendCentral, int32_t& isUpgrade);

	//TC扩张 入参：level:级别, smallTrendCentrals:小级别TC集合, lineSegmentDatas:L集合, smallTrendTypes:小级别TT集合 出参：bigTrendCentrals:大级别TT集合 返回值：0:成功, <0:错误
	//static int32_t ExpandTrendCentral(int32_t level, vector<TrendCentralData*> &smallTrendCentrals, vector<LineSegmentData*>& lineSegmentDatas, vector<TrendTypeData*>& smallTrendTypes, vector<TrendCentralData*> &bigTrendCentrals);

};

class TrendType
{
public:
	TrendType();
	~TrendType();

public:
	//根据L划分TT 返回值：0:成功, -1:错误
	//static int32_t DivideTrendType(vector<LineSegmentData*>& lineSegmentDatas, vector<TrendCentralData*>& trendCentralDatas, vector<TrendTypeData*>& trendTypeDatas);

	static int32_t DivideTrendType(vector<StrokeData*>& strokeDatas, vector<TrendCentralData*>& trendCentralDatas, vector<TrendTypeData*>& trendTypeDatas);

	//判断两个TC的关系 返回值：1:上升, 2:下降, 3:外包含, 4:内包含, -1:错误
	static int32_t JudgeTrendCentralRelation(TrendCentralData* frontTrendCentral, TrendCentralData* nextTrendCentral);

	//
	static int32_t MarkTrendCentralInvalid(vector<TrendCentralData*>& tcDatas, int32_t startIdx);

	//
	static int32_t GenerateTTFromTC(vector<TrendCentralData*>& tcDatas, vector<TrendTypeData*>& ttDatas);

	//
	static int32_t DivideNewTrendType(const string& code, int32_t level);

	//
	static int32_t RoutineExpand(const string& code, int32_t level, int32_t tcIndex, int32_t& bigIndex);

	//
	static int32_t NineSectionExpand(const string& code, int32_t level, int32_t tcIndex, int32_t &bigIndex);

	//
	static int32_t ThreeSectionExpand(const string& code, int32_t level, int32_t& bigIndex);


};

#endif	// __TREND_CENTRAL_AND_TYPE_H__

