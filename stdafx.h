// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#ifndef __STDAFX_H__
#define __STDAFX_H__

#ifndef __linux
#pragma once
#endif

#include "FileSnippet/FileSnippetLib.h"
using namespace dsa::snippets::filesnippet;

#include "TextSnippet/TextSnippetLib.h"
using namespace dsa::snippets::textsnippet;

#include "rapidxml/dsaxml.hpp"
using namespace rapidxml;

#include "STLHelper/const_char_map.hpp"
using namespace dsa::stlhelper;

#include "Pool/MemoryPoolTable.hpp"
using namespace dsa::pool;

#include "DataStruct.h"
#include "Utils.h"

#define OTL_ODBC
#ifdef __linux
#define OTL_ODBC_UNIX
#else
#define OTL_BIGINT int64_t
#define OTL_UBIGINT	uint64_t
#endif
#define OTL_ODBC_SELECT_STM_EXECUTE_BEFORE_DESCRIBE
#define OTL_DESTRUCTORS_DO_NOT_THROW
#define OTL_STL
#define OTL_STREAM_POOL_ON
#define OTL_DEFAULT_CHAR_NULL_TO_VAL '\0'
#define OTL_DEFAULT_STRING_NULL_TO_VAL ""
#define OTL_DEFAULT_NUMERIC_NULL_TO_VAL 0
#include "otl/otlv4.h"

//#include "rapidjson/document.h"
//#include "rapidjson/writer.h"
//#include "rapidjson/stringbuffer.h"
//using namespace rapidjson;

#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/sinks/daily_file_sink.h"
using namespace spdlog;


#include <random>
//#include <limits>
//#include <ctime>
//#include <cstdlib>
//#include <cstring>
#include <iostream>
#include <fstream>
#include <sstream>   
#include <string>
#include <map>
#include <set>
#include <vector>
#include <algorithm>
#include <ctime>
#include <chrono>
#include <thread>
#include <mutex>
using namespace std;

#include <io.h>
#include <direct.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

#ifdef __linux
#include <cstring>
#endif

#endif	// __STDAFX_H__

