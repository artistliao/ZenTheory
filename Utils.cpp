#include "stdafx.h"
#include "Utils.h"


Utils::Utils()
{

}

Utils::~Utils()
{
}

// 字符串拼接
string Utils::StringSplicing(vector<string>& vec_str) {
	string strResult;
	for (auto iter = vec_str.begin(); iter != vec_str.end(); iter++) {
		strResult += *iter;
	}

	return strResult;
}

void Utils::StringSplit(const string& srcStr, vector<string>& vec_str, const string& delim, bool trim_null) {
	size_t iPos = 0;
	string localStr = srcStr;
	while (true) {
		iPos = localStr.find(delim);
		if (iPos == string::npos) {
			if (trim_null && localStr.size() == 0) {
				return;
			}
			else {
				vec_str.push_back(localStr);
				return;
			}
		}
		else {
			string subStr = localStr.substr(0, iPos);
			if (!(trim_null && (subStr.size() == 0))) {
				vec_str.push_back(subStr);
			}

			localStr.erase(0, iPos+ delim.size());
		}
	}
}

//只保留字母数字
bool Utils::NumbersLettersLeft(char *src) {
	if (!src) {
		return false;
	}

	int32_t srcLen = strlen(src);
	char *dst = new char[srcLen + 10];
	if (!dst) {
		return false;
	}
	int j = 0;
	for (int i = 0; i < srcLen; i++) {
		if (((src[i] >= 'a') && (src[i] <= 'z')) || ((src[i] >= 'A') && (src[i] <= 'Z')) || ((src[i] >= '0') && (src[i] <= '9'))) {
			dst[j] = src[i];
			j++;
		}
	}

	memcpy(src, dst, j);
	src[j] = '\0';
	delete []dst;
	return true;
}

//整数转字符串
string Utils::IntToString(int32_t a) {
	char buffer[16] = { 0 };
	snprintf(buffer, sizeof(buffer), "%d", a);
	string str(buffer);
	return str;
}

//字符串小写
string Utils::StringToLower(const string &a) {
	size_t srcLen = a.length();
	if (srcLen == 0) {
		return a;
	}
	char *dst = new char[srcLen + 10];
	if (!dst) {
		return a;
	}

	int j = 0;
	for (int i = 0; i < srcLen; i++, j++) {
		if ((a[i] >= 'A') && (a[i] <= 'Z')) {
			dst[j] = a[i] + 'a' - 'A';
		}
		else {
			dst[j] = a[i];
		}
	}
	dst[j] = '\0';
	string str_ret(dst);
	delete []dst;
	return str_ret;
}

//字符串大写
string Utils::StringToUpper(const string &a) {
	size_t srcLen = a.length();
	if (srcLen == 0) {
		return a;
	}

	char *dst = new char[srcLen + 10];
	if (!dst) {
		return a;
	}

	int j = 0;
	for (int i = 0; i < srcLen; i++, j++) {
		if ((a[i] >= 'a') && (a[i] <= 'z')) {
			dst[j] = a[i] + 'A' - 'a';
		}
		else {
			dst[j] = a[i];
		}
	}

	dst[j] = '\0';
	string str_ret(dst);
	delete []dst;
	return str_ret;
}


//返回右侧N个字符
string Utils::StringRight(const string &str, int32_t n) {
	if (n <= 0 || str == "") {
		return "";
	}

	if (str.length() <= size_t(n)) {
		return str;
	}
	
	return str.substr(str.length() - n);
}


//遍历当前目录下的文件夹和文件,默认是按字母顺序遍历
int Utils::TraverseCurrentDir(const string& path, vector<string>& files, vector<string>& dirs)
{
	_finddata_t file_info;
	string current_path = path + "/*.*"; //可以定义后面的后缀为*.exe，*.txt等来查找特定后缀的文件，*.*是通配符，匹配所有类型,路径连接符最好是左斜杠/，可跨平台
	//打开文件查找句柄
	long long findResult = _findfirst(current_path.c_str(), &file_info);
	//返回值为-1则查找失败
	if (-1 == findResult) {
		_findclose(findResult);
		return -1;
	}

	do
	{
		//判断是否子目录
		string attribute;
		if (file_info.attrib == _A_SUBDIR) { //是目录
			attribute = "dir";
			dirs.push_back(file_info.name);
		}
		else {
			attribute = "file";
			files.push_back(file_info.name);
		}

		//输出文件信息并计数,文件名(带后缀)、文件最后修改时间、文件字节数(文件夹显示0)、文件是否目录
		//cout << file_info.name << ' ' << file_info.time_write << ' ' << file_info.size << ' ' << attribute << endl; //获得的最后修改时间是time_t格式的长整型，需要用其他方法转成正常时间显示
	} while (!_findnext(findResult, &file_info));  //返回0则遍历完
	
	//关闭文件句柄
	_findclose(findResult);
	return 0;
}


//gbk文件转utf8文件
int32_t Utils::GbkToUtf8(const string& srcFileName, const string& dstFileName)
{
	try
	{
		SPDLOG_INFO("GbkToUtf8 srcFileName:{}, dstFileName:{} start", srcFileName, dstFileName);
		ifstream srcFile(srcFileName.c_str(), ios::in | ios::binary);
		if (!srcFile) {
			SPDLOG_WARN("open srcFileName error!");
			return -1;
		}

		ofstream dstFile(dstFileName.c_str(), ios::binary | ios::out | ios::_Nocreate | ios::trunc);
		if (!srcFile) {
			SPDLOG_WARN("open dstFileName error!");
			return -1;
		}

		// 获取filestr对应buffer对象的指针 
		filebuf* pbuf = srcFile.rdbuf();

		// 调用buffer对象方法获取文件大小
		long size = pbuf->pubseekoff(0, ios::end, ios::in);
		pbuf->pubseekpos(0, ios::in);

		char* srcFileBuf = new char[size + long(100)];

		// 获取文件内容
		pbuf->sgetn(srcFileBuf, size);
		srcFileBuf[size] = '\0'; //0这是关键

		int len = MultiByteToWideChar(CP_ACP, 0, srcFileBuf, -1, NULL, 0);
		wchar_t* wstr = new wchar_t[len + +long(100)];
		memset(wstr, 0, len + +long(100));
		MultiByteToWideChar(CP_ACP, 0, srcFileBuf, -1, wstr, len);
		len = WideCharToMultiByte(CP_UTF8, 0, wstr, -1, NULL, 0, NULL, NULL);
		char* dstFileBuf = new char[len + +long(100)];
		memset(dstFileBuf, 0, len + +long(100));
		WideCharToMultiByte(CP_UTF8, 0, wstr, -1, dstFileBuf, len, NULL, NULL);

		dstFile.write(dstFileBuf, strlen(dstFileBuf));
		dstFile.close();

		if (wstr) {
			delete[] wstr;
		}
		if (dstFileBuf) {
			delete[] dstFileBuf;
		}

		delete[]srcFileBuf;
		srcFile.close();
		SPDLOG_INFO("GbkToUtf8 end");
	}
	catch (std::exception& e)
	{
		cerr << "GbkToUtf8 exception: " << e.what() << endl;
		SPDLOG_ERROR("GbkToUtf8 exception:{}", e.what());
		return -1;
	}

	return 0;
}

//浮点数四舍五入
double Utils::Round(double number, int decimal)
{
	switch (decimal)
	{
	case 1:
		if (number > 0)
			return round((number + 0.05) * 10) / 10;
		else
			return round((number - 0.05) * 10) / 10;
	case 2:
		if (number > 0) {
			double ret = round((number + 0.005) * 100);
			return  ret / 100.0;
		}
		else
			return round((number - 0.005) * 100) / 100;
	case 3:
		if (number > 0)
			return round((number + 0.0005) * 1000) / 1000;
		else
			return round((number - 0.0005) * 1000) / 1000;
	case 4:
		if (number > 0)
			return round((number + 0.00005) * 10000) / 10000;
		else
			return round((number - 0.00005) * 10000) / 10000;
	case 5:
		if (number > 0)
			return round((number + 0.000005) * 100000) / 100000;
		else
			return round((number - 0.000005) * 100000) / 100000;
	case 6:
		if (number > 0)
			return round((number + 0.0000005) * 1000000) / 1000000;
		else
			return round((number - 0.0000005) * 1000000) / 1000000;
	default:
		return -1.0;
		break;
	}

	return -1.0;
}

//The important rule to remember is that powers of two and integer multiples thereof can be perfectly represented. everything else is an approximation.
//浮点数比较 返回值：1:number1>number2； 0:number1=number2；-1:number1<number2
int32_t Utils::DoubleCmp(double number1, double number2) {
	if (number1 == number2) {
		return 0;
	}

	double diff = number1 - number2;
	if (diff > 0.000001) {
		return 1;
	}

	if (diff < -0.000001) {
		return -1;
	}

	return 0;
}

//整数时间格式转ts 输入：starttime(20201210195500) 输出：时间戳，-1:错误
int32_t Utils::IntTimeToTs(int64_t starttime) {
	if (starttime < 19700000000000) {
		return -1;
	}

	struct tm timeinfo;
	
	timeinfo.tm_year = starttime/10000000000 - 1900;
	timeinfo.tm_mon  = (starttime % 10000000000)/100000000 - 1;
	timeinfo.tm_mday = (starttime % 100000000) / 1000000;
	timeinfo.tm_hour = (starttime % 1000000) / 10000;
	timeinfo.tm_min  = (starttime % 10000) / 100;
	timeinfo.tm_sec  = (starttime % 100);
	timeinfo.tm_isdst = 0;

	time_t ts = mktime(&timeinfo);
	return int32_t(ts);
}

//ts转整数时间格式 输入：时间戳；输出：starttime(20201210195500)，-1:错误
int64_t Utils::TsToIntTime(int32_t ts) {
	if (ts < 0) {
		return -1;
	}

	time_t rawtime = time_t(ts);
	struct tm* pTm=NULL;
	pTm = localtime(&rawtime);

	int64_t iTime = (int64_t(pTm->tm_year) + 1900) * 10000000000;
	iTime += (int64_t(pTm->tm_mon) + 1) * 100000000;
	iTime += int64_t(pTm->tm_mday) * 1000000;
	iTime += int64_t(pTm->tm_hour) * 10000;
	iTime += int64_t(pTm->tm_min) * 100;
	iTime += int64_t(pTm->tm_sec);

	return iTime;
}

//ts转字符串时间格式  
string Utils::TsToStrTime(int32_t ts) {
	if (ts < 0) {
		return "";
	}

	char buffer[64] = { 0 };
	time_t rawtime = time_t(ts);
	struct tm* pTm = localtime(&rawtime);
	strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", pTm);
	string strTime(buffer);
	return strTime;
}

int32_t Utils::StrTimeToDiffTs(const string& strtime) {
	size_t iPos = strtime.find(":");
	if (iPos == string::npos) {
		return -1;
	}
	string hour = strtime.substr(0, iPos);
	string min = strtime.substr(iPos+1);
	if (hour.size() == 0 || min.size() == 0) {
		return -1;
	}

	int32_t iRet = atoi(hour.c_str()) * 3600 + atoi(min.c_str()) * 60;
	return iRet;
}

int32_t Utils::DayZeroTs(int32_t ts1) {
	return ts1 - (ts1 + 28800) % 86400;
}

bool Utils::IsSameDay(int32_t ts1, int32_t ts2) {
	return (ts1 - (ts1 + 28800) % 86400)== (ts2 - (ts2 + 28800) % 86400);
}

int32_t Utils::Load1MinStartTs() {
	time_t now_time = time(NULL);
	now_time -= 60 * 86400;
	struct tm* pTm =  localtime(&now_time);
	if (pTm->tm_mday <= 15) {
		pTm->tm_mday = 1;
	}
	else {
		pTm->tm_mday = 16;
	}
	pTm->tm_hour = 0;
	pTm->tm_min = 0;
	pTm->tm_sec = 0;
	
	int32_t start_ts = int32_t(mktime(pTm));
	start_ts -= ((start_ts - 316800) % 604800);
	return start_ts;
}

int32_t Utils::Load5MinStartTs() {
	struct tm timeinfo;

	timeinfo.tm_year = 2021 - 1900;
	timeinfo.tm_mon = 1 - 1;
	timeinfo.tm_mday = 1;
	timeinfo.tm_hour = 0;
	timeinfo.tm_min = 0;
	timeinfo.tm_sec = 0;
	timeinfo.tm_isdst = 0;

	time_t ts = mktime(&timeinfo);
	return int32_t(ts);
}

int32_t Utils::Load15MinStartTs() {
	struct tm timeinfo;

	timeinfo.tm_year = 2020 - 1900;
	timeinfo.tm_mon = 1 - 1;
	timeinfo.tm_mday = 1;
	timeinfo.tm_hour = 0;
	timeinfo.tm_min = 0;
	timeinfo.tm_sec = 0;
	timeinfo.tm_isdst = 0;

	time_t ts = mktime(&timeinfo);
	return int32_t(ts);
}

int32_t Utils::Load30MinStartTs() {
	struct tm timeinfo;

	timeinfo.tm_year = 2018 - 1900;
	timeinfo.tm_mon = 1 - 1;
	timeinfo.tm_mday = 1;
	timeinfo.tm_hour = 0;
	timeinfo.tm_min = 0;
	timeinfo.tm_sec = 0;
	timeinfo.tm_isdst = 0;

	time_t ts = mktime(&timeinfo);
	return int32_t(ts);
}

//检测文件夹，不存在则创建 返回值：0:成功； <0:失败
int32_t Utils::CheckAndMakeDir(const string& dirPath) {
	if (_access(dirPath.c_str(), 0) == 0) {	//如果文件夹不存在
		return 0;				//则创建
	}

	int len = dirPath.length();
	char tmpDirPath[512] = { 0 };
	memset(tmpDirPath, 0, sizeof(tmpDirPath));
	for (int i = 0; i < len; i++)
	{
		tmpDirPath[i] = dirPath[i];
		if (tmpDirPath[i] == '\\' || tmpDirPath[i] == '/')
		{
			if (_access(tmpDirPath, 0) == -1)
			{
				int ret = _mkdir(tmpDirPath);
				if (ret == -1) {
					return ret;
				}
			}
		}
	}

	return 0;
}


int32_t testRunTime() {
	////int64_t iTime = Utils::TsToIntTime(12312313);
	////return 0;
	//chrono::steady_clock::time_point t1 = chrono::steady_clock::now();

	//int64_t sum = 0;
	//int64_t i = 0;
	//for (i = 1; i <= 1000000000; i++) {
	//	sum += i;
	//}
	//chrono::steady_clock::time_point t2 = chrono::steady_clock::now();

	////毫秒
	//std::chrono::duration<double, std::milli> dTimeSpan = std::chrono::duration<double, std::milli>(t2 - t1);
	//std::cout << "dTimeSpan: " << dTimeSpan.count() << "ms\n";

	//cout << sum << endl;
	//system("pause");
	return 0;
}


int64_t Utils::OrderId() {
	// 取得随机数种子
	//auto time_now = std::chrono::system_clock::now();
	//auto duration_in_nano = std::chrono::duration_cast<std::chrono::nanoseconds>(time_now.time_since_epoch());
	////int tick=(int)(std::clock()*1000/ CLOCKS_PER_SEC);
	//long tick = (long)(duration_in_nano.count());
	////tick %= 10000;

	//std::default_random_engine gen(tick);
	//std::uniform_int_distribution<int32_t> dist(0, 999);
	//int32_t const r = int32_t(dist(gen));
	//cout << r << endl;

	time_t nowtime = time(NULL);
	struct tm* pTm = NULL;
	pTm = localtime(&nowtime);

	int64_t orderId = (int64_t(pTm->tm_year) + 1900) * 10000000000;
	orderId += (int64_t(pTm->tm_mon) + 1) * 100000000;
	orderId += int64_t(pTm->tm_mday) * 1000000;
	orderId += int64_t(pTm->tm_hour) * 10000;
	orderId += int64_t(pTm->tm_min) * 100;
	orderId += int64_t(pTm->tm_sec);
	orderId *= 1000;
	orderId += 1;
	return orderId;
}

void Utils::InitLogger(const string& log_path, const string& log_level)
{
	printf("log_path:%s, log_level:%s\n", log_path.c_str(), log_level.c_str());
	std::vector<spdlog::sink_ptr> sinks;
	sinks.push_back(std::make_shared<spdlog::sinks::stdout_color_sink_mt>());
	sinks.push_back(std::make_shared<spdlog::sinks::daily_file_sink_mt>(log_path, 3, 0, false, 7));
	auto combined_logger = std::make_shared<spdlog::logger>("combined_logger", begin(sinks), end(sinks));
	spdlog::set_default_logger(combined_logger);

	spdlog::level::level_enum iLogLevel = spdlog::level::level_enum::trace;
	string strLevel = log_level;
	transform(strLevel.begin(), strLevel.end(), strLevel.begin(), ::tolower);
	if (strLevel == "trace") {
		iLogLevel = spdlog::level::level_enum::trace;
	}
	else if (strLevel == "debug") {
		iLogLevel = spdlog::level::level_enum::debug;
	}
	else if (strLevel == "info") {
		iLogLevel = spdlog::level::level_enum::info;
	}
	else if (strLevel == "warn") {
		iLogLevel = spdlog::level::level_enum::warn;
	}
	else if (strLevel == "error") {
		iLogLevel = spdlog::level::level_enum::err;
	}
	else if (strLevel == "critical") {
		iLogLevel = spdlog::level::level_enum::critical;
	}
	else if (strLevel == "off") {
		iLogLevel = spdlog::level::level_enum::off;
	}

	spdlog::flush_on(iLogLevel);
	spdlog::set_level(iLogLevel);
	spdlog::set_pattern("%Y-%m-%d %H:%M:%S.%e [%t][%s:%#][%!]%^[%l]%$ %v");
}


