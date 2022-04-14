#ifndef __STROKE_H__
#define __STROKE_H__

//B
class Stroke
{
public:
	Stroke();
	~Stroke();

public:
	//根据合并且分型好的数据，生成B数据；返回值：0:成功, -1:错误
	static int32_t GenerateStroke(vector<KlineMergeData*>& mergeKlineDatas, vector<StrokeData*>& strokeDatas);
	//根据B数据和原始Kline数据，找出每一B的开始原始Kline索引和结束Kline索引，返回值：0:成功, -1:错误
	static int32_t FindStrokeKlineIdx(vector<StrokeData*>& strokeDatas, vector<KlineData*>& oriKlines);

};

#endif	// __STROKE_H__

