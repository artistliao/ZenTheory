#ifndef __KLINE_GENERATE_H__
#define __KLINE_GENERATE_H__

//生成新的Kline
class KlineGenerate
{
public:
	KlineGenerate();
	~KlineGenerate();

public:
	//根据1min kline数据，生成指定周期的kline数据并存储到数据库中；参数：securitiesType:证券类型，securitiesCode:stock code，newPeriod:生成新kline的周期；返回值：0:成功, <0:错误
	static int32_t GenerateNewKlineAndSaveToDB(const string& securitiesType, const string& securitiesCode, const string& newPeriod);

	static int32_t GenerateNewKline(const string& securitiesType, const string& securitiesCode, const string& newPeriod);

	//判断数据库表是否存在 返回值：0:存在, <0:不存在
	static int32_t CheckTableExist(const string& DbName, const string& tableName);

	//建表 返回值：0:成功, <0:错误
	static int32_t CreateTable(const string& DbName, const string& tableName);

	//获取数据库表最大的ts值 返回值：>=0:正常值, <0:错误
	static int32_t GetMaxTs(const string& DbName, const string& tableName, int32_t gp_id);

	static int32_t KLineCmp(KlineData* pKline1, KlineData* pKline2);


};

#endif	// __KLINE_GENERATE_H__

