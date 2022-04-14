#ifndef __UTILS_H__
#define __UTILS_H__


class Utils
{

public:
	Utils();
	~Utils();

	// 字符串拼接
	static string StringSplicing(vector<string>& vec_str);
	// 字符串分割
	static void StringSplit(const string& srcStr, vector<string>& vec_str, const string& delim, bool trim_null = false);
	//只保留字母数字
	static bool NumbersLettersLeft(char *src);
	//整数转字符串
	static string IntToString(int32_t a);
	//字符串小写
	static string StringToLower(const string &a);
	//字符串大写
	static string StringToUpper(const string &a);
	//返回右侧N个字符
	static string StringRight(const string &str, int32_t n);

	//遍历当前目录下的文件夹和文件,默认是按字母顺序遍历
	static int TraverseCurrentDir(const string& path, vector<string>& files, vector<string>& dirs);
	//gbk文件转utf8文件
	static int GbkToUtf8(const string& srcFileName, const string& dstFileName);
	//utf8文件转gbk文件
	static int Utf8ToGbk(const string& srcFileName, const string& dstFileName);
	//浮点数针对某一位四舍五入
	static double Round(double number, int decimal);

	//浮点数比较 返回值：1:number1>number2； 0:number1=number2；-1:number1<number2
	static int32_t DoubleCmp(double number1, double number2);

	//整数时间格式转ts 输入：starttime(20201210195500) 输出：时间戳，-1:错误
	static int32_t IntTimeToTs(int64_t starttime);

	//ts转整数时间格式 输入：时间戳；输出：starttime(20201210195500)，-1:错误
	static int64_t TsToIntTime(int32_t ts);

	//ts转字符串时间格式  
	static string TsToStrTime(int32_t ts);

	//字符串时间转时间差ts 输入：strtime(08:00) 输出：28800，-1:错误
	static int32_t StrTimeToDiffTs(const string& strtime);

	//每日零点时间戳
	static int32_t DayZeroTs(int32_t ts1);

	//是否是同一天
	static bool IsSameDay(int32_t ts1, int32_t ts2);

	// 
	static int32_t Load1MinStartTs();

	static int32_t Load5MinStartTs();

	static int32_t Load15MinStartTs();

	static int32_t Load30MinStartTs();

	//检测文件夹，不存在则创建 返回值：0:成功； <0:失败
	static int32_t CheckAndMakeDir(const string& dirPath);

	static int64_t OrderId();

	static void InitLogger(const string& log_path, const string& log_level);
};

#endif	

