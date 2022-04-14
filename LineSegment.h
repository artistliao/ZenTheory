#ifndef __LINE_SEGMENT_H__
#define __LINE_SEGMENT_H__

// L
class LineSegment
{
public:
	LineSegment();
	~LineSegment();

public:
	//根据B数据生成L 返回值：0:成功, -1:错误
	static int32_t GenerateLineSegment(const string& code, const string& period, vector<StrokeData*>& strokeDatas, vector<LineSegmentData*>& lineSegmentDatas);

	// 传入FeatureSequenceData、StrokeData、方向， 修改新分配的pFeatureSequence的值。
	static int32_t StrokeToFeatureSequence(FeatureSequenceData* pFeatureSequence, const StrokeData* pStroke, int32_t direction);

	//判断时候出现相反方向的分型，输入参数：startIdx:B开始序号，iFindTyping:寻找的分型类型；返回值：-1:错误, 0:没有找到合适分型，1：找到了相应的分型
	static int32_t FindOppositeTyping(vector<StrokeData*>& strokeDatas, vector<FeatureSequenceData*>& prevMergeFeatureSeqs, size_t startIdx, int32_t iFindTyping);

	//清理特征序列，返回值：0:正确，-1:错误
	static int32_t ClearFeatureSeqs(vector<FeatureSequenceData*>& standardFeatureSeqs);

	//新的特征序列节点和原有分型的高低点比较，返回值：-1:错误，0:没有超出原有的高/低点范围，1:超出原有的高/低点范围
	static int32_t JudgeHighLow(const FeatureSequenceData* pStdFeatureSeq, double frontTypingHigh, double frontTypingLow, int32_t direction);

	static int32_t JudgeHighLow(double high, double low, double frontTypingHigh, double frontTypingLow, int32_t direction);

	//根据B数据和方向找到第一条L，返回参数：L值，下一L开始B索引，返回值：-1:错误，0:没有L，1:有L，
	static int32_t FindFirstLineSegment(vector<StrokeData*>& strokeDatas, int32_t direction, int32_t& nextLineStartIdx);

	//根据B数据判断时候有第一种情况的B破坏，返回结果 -1:出错 0:没有分型 1:顶分型 2:底分型
	static int32_t JudgeLineInFirstCaseOfStrokeBreak(vector<StrokeData*>& forTypingData, size_t idx);

	//根据B数据，起始索引，L方向，找到L，返回参数：L值，下一L开始B索引，返回值：-1:错误，0:没有L，1:有L，
	static int32_t FindLineSegmentInDesignatedDirection(vector<StrokeData*>& strokeDatas, size_t startIdx, int32_t direction, LineSegmentData* pLineSegment, int32_t& nextLineStartIdx);

	//判断特征序列和下一个特征序列B之间是否有缺口，返回结果 -1:出错 0:没有缺口 1:有缺口
	static int32_t JudgeGap(FeatureSequenceData* pFeatureSeq, StrokeData* pStroke, int32_t direction);

	//判断是否有第一种类型的B破坏，返回结果 -1:出错 0:没有第一种类型的B破坏 1:有第一种类型的B破坏
	static int32_t JudgeFirstCaseStrokeBreak(FeatureSequenceData* pStdFeatureSeq, vector<FeatureSequenceData*> & standardFeatureSeqs, int32_t direction);

	//判断第一种类型的B破坏是否最终是L破坏，返回结果 -1:出错 0:不是L破坏 1:是L破坏
	static int32_t JudgeFirstCaseLineBreak(FeatureSequenceData* pFeatureSeq, vector<StrokeData*>& strokeDatas, int32_t startIdx, int32_t direction);

	//L赋值和清理，输出参数：pLineSegment，nextLineStartIdx, 返回结果 -1:出错 0:成功
	static int32_t LineAssignmentAndClear(LineSegmentData* pLineSegment, int32_t& nextLineStartIdx, vector<StrokeData*>& strokeDatas, size_t startIdx, size_t endIdx, int32_t direction, vector<FeatureSequenceData*>& standardFeatureSeqs);

	// 
	static int32_t LineSegmentCmp(LineSegmentData* pLine1, LineSegmentData* pLine2);
};

#endif	// __LINE_SEGMENT_H__

