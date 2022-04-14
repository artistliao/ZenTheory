
#ifndef __DATA_STRUCT_H__
#define __DATA_STRUCT_H__

#pragma once

#include <stdint.h>
#include <time.h>
#include <string>
#include <vector>
#include <set>
#include <mutex>
using namespace std;

#define DIRECTION_UP (1)
#define DIRECTION_DOWN (2)
#define FRONT_CONTAIN_BACK (3)
#define BACK_CONTAIN_FRONT (4)

#define NO_TYPING (0)
#define TOP_TYPING (1)
#define BOTTOM_TYPING (2)

//没有缺口
#define NO_GAP (0)
//有缺口
#define HAVE_GAP (1)

//没有L
#define NO_LINE_SEGMENT (0)
//有L
#define HAVE_LINE_SEGMENT (1)
//不确定
#define UNCERTAIN_LINE_SEGMENT (2)

//没有L划分
#define NO_LINE_DIVIDE (0)
//L划分的第一种情况
#define LINE_DIVIDE_FIRST_CASE (1)
//L划分的第二种情况
#define LINE_DIVIDE_SECOND_CASE (2)

// 上升
#define TREND_UP (1)
// 下降
#define TREND_DOWN (2)
// 盘整
#define CONSOLIDATION (3)

//后TT和前TT的比较关系
#define TC_UP (1)	//上升
#define TC_DOWN (2)	//下降
#define TC_EXTERNAL_CONTAIN (3)	//外包含
#define TC_INTERNAL_CONTAIN (4)	//内包含
#define TC_OVERLAP (5)	//有重叠部分

#define NO_DIVERGENCE		(0)		//没有背驰
#define TOP_DIVERGENCE		(1)		//顶背驰
#define BOTTOM_DIVERGENCE	(2)		//底背弛

//#define TT_NOT_START		(-1)	//TT还没有开始
#define TT_NOT_CONFIRM		(0)		//TT没有确认
#define TT_CONFIRM			(1)		//TT已经确认
#define TC_INVALID			(2)		//TC无效

#define NOT_MERGE	(0)		//没有合并
#define MERGED		(1)		//已经合并

//open type
#define FIRSTCLASS_OPEN	(1)		//第一类买卖点
#define THIRDCLASS_OPEN	(3)		//第三类买卖点
#define TREND_OPEN	(5)			// 

//cover type
#define FIRSTCLASS_COVER	(1)		// 第一类买卖点
#define THIRDCLASS_COVER	(3)		// 第三类买卖点
#define ZHISHUN_COVER		(5)		// 

#define WRITE_DATA_INTERVAL		(180)	//写文件间隔

#define TRADE_INTERVAL (7)	 


typedef struct _KlineData
{
	int32_t index;		//索引号
	char	divergence;	// 是否处于背驰点 0:没有 1:顶背驰 2:底背驰
	//char	is_finish;	// 是否已经结束 0:没有 1:已经结束
	int64_t starttime;	//20201210195500
	int64_t endtime;	//20201210195600
	int64_t vol;
	double	open;
	double	high;
	double	low;
	double	close;
	double	amount;	
	double	dif;
	double	dea;
	double	macd;
	double	ema12;
	double	ema26;
} KlineData;

typedef struct _KlineMergeData
{
	int32_t index;		//索引号
	int32_t start_idx;	//开始原始Kline索引号
	int32_t end_idx;	//结束原始Kline索引号
	int64_t starttime;	//20201210195500
	int64_t endtime;	//20201210195600
	int64_t vol;
	char	direction;	// 方向 1:向上 2:向下
	char	typing;		// 是否处于分型的转折点 0:没有 1:顶分型顶点 2:底分型底点
	char	is_merge;	// 是否有合并 0:没有合并 1:有合并
	short	count;		// 原始Kline个数
	double	high;
	double	low;
	double	amount;
} KlineMergeData;

//B
typedef struct _StrokeData
{
	int32_t index;		//索引号
	int32_t start_kline_idx;	//开始原始Kline索引号
	int32_t end_kline_idx;		//结束原始Kline索引号
	int64_t starttime;	//20201210195500
	int64_t endtime;	//20201210195600
	int64_t vol;
	char	direction;	// 方向 1:向上 2:向下
	char	divergence;	// 是否处于背驰点 0:没有 1:顶背驰 2:底背驰
	short	count;		// 原始Kline个数
	double	high;
	double	low;
	double	amount;
} StrokeData;

// 特征序列
typedef struct _FeatureSequenceData
{
	int32_t index;		//索引号
	int32_t start_idx;	//开始B索引号
	int32_t end_idx;	//结束B索引号
	int64_t starttime;	//20201210195500
	int64_t endtime;	//20201210195600
	int64_t vol;
	char	direction;	// 方向 1:向上 2:向下
	char	typing;		// 是否处于分型的转折点 0:没有 1:顶分型顶点 2:底分型底点
	short	count;		// 原始Kline个数
	char	is_merge;	// 是否有合并 0:没有合并 1:有合并
	double	high;
	double	low;
	double	amount;
} FeatureSequenceData;

// L
typedef struct _LineSegmentData
{
	int32_t index;		//索引号
	int32_t start_stroke_idx;	//开始B索引号
	int32_t end_stroke_idx;		//结束B索引号
	int64_t starttime;	//20201210195500
	int64_t endtime;	//20201210195600
	int64_t vol;
	char	direction;	// 方向 1:向上 2:向下
	char	divergence;	// 是否处于背驰点 0:没有 1:顶背驰 2:底背驰
	short	count;		// 原始Kline个数
	double	high;
	double	low;
	double	amount;
} LineSegmentData;

// TT
typedef struct _TrendCentralData
{
	int32_t index;			//索引号
	//int32_t start_line_idx;	//起始L索引
	//int32_t end_line_idx;	//结束L索引
	int32_t start_stroke_idx;  
	int32_t end_stroke_idx; 
	//char	level;			//级别(1表示最低级别，然后依次递增)
	//char	is_upgrade;		//是否存在TT9段扩张可能(0:不确定, 1:存在)
	char	trend_type;		//所属TT(1:上升, 2:下降, 3:盘整)
	char	trend_type_confirm; //TC所属TT是否已经确定(0:未确定, 1:已经确定, 2:TC无效)
	double	high;			//TT边界高点
	double	low;			//TT边界地点
	double	highest;		//TT区段最高点
	double	lowest;			//TT区段最低点
} TrendCentralData;

// TT
typedef struct _TrendTypeData
{
	int32_t index;			// 索引号
	int32_t start_stroke_idx;	// 
	int32_t end_stroke_idx;	// 
	int32_t start_central_idx;	// 起始次级别TT索引
	int32_t end_central_idx;	// 结束次级别TT索引
	//char	level;				// 级别(1表示最低级别，然后依次递增)
	char	type;				// TT
	char	confirm;			// TT是否已经完全确定(-1:还未开始，0:未完全确定, 1:已经完全确定)
	double	high;
	double	low;
} TrendTypeData;

// securities
typedef struct _Securities
{
	int32_t gp_id;			// id
	char gp_code[64];		// 代码
	char display_name[64];	// 中文名称
	char name[64];			// 缩写简称
	char start_date[16];	// 上市日期
	char end_date[16];		// 退市日期
	vector<int32_t> trade_times; // 交易时间段
} Securities;

//
typedef struct _GPKlineData
{
	int32_t ts;
	double	open;
	double	high;
	double	low;
	double	close;
	double	volume;
	double	money;
	double	factor;
} GPKlineData;

//区间
typedef struct _SectionIndex
{
	int32_t start_idx;
	int32_t end_idx;	
} SectionIndex;


typedef struct _Order
{
	int64_t order_id;
	Securities* pSecurity;
	int64_t open_ask_time;
	double  open_ask_price;
	int64_t open_trans_time;
	double  open_trans_price;
	int64_t cover_ask_time;
	double  cover_ask_price;
	int64_t cover_trans_time;
	double  cover_trans_price;
	double  stop_loss_price;
	double  profit;
	double  limit_price;			//最大或最小价格
	int32_t limit_price_stroke_idx; //最大或最小价格所在笔索引
	int32_t open_kline_idx;
	int32_t cover_kline_idx;
	int32_t last_tc_idx;
	int32_t open_stroke_idx;
	int32_t open_stroke_end_kline_idx;
	int32_t amount;
	char	direction;
	char	is_open;
	char	is_cover;
	char	open_type; 
	char	cover_type;
} Order;

typedef struct _TickPrice
{
	int64_t tick_time;
	int32_t  price;
} TickPrice;

typedef struct _DiffTickPrice
{
	int64_t tick_time;
	int32_t  diff_price;
	int32_t  hc_price;
	int32_t  rb_price;
} DiffTickPrice;

// 
typedef struct _TaskManage
{
	int64_t thread_id;
	mutex* th_mutex;
	bool update;
	int32_t last_checked_ts;
} TaskManage;

//时间区间
typedef struct _TradeTimeSection
{
	int32_t id;
	int32_t start_time;
	int32_t end_time;
} TradeTimeSection;

typedef struct _MissingKline
{
	char code[64];
	char period[16];
	char sec_type[64];
	int32_t  from_ts;
	int32_t  to_ts;
} MissingKline;

typedef struct _NoticeLine {
	char code[64];
	char sec_type[64];
	char name[64];
	char period[16];
	int32_t trigger_ts;
	int32_t direction;
	int32_t line_start_ts;
	int32_t line_end_ts;
	double high;
	double low;
	int32_t kline_start_ts;
} NoticeLine;

typedef struct _NoticeDraw {
	char code[64];
	char name[64];
	char period[16];
} NoticeDraw;

typedef struct _NoticeTrade {
	char code[64];
	char sec_type[64];
	char name[64];
	char period[16];
	int32_t trade_type; //1:open 2:close
	int32_t open_cover_type;
	int32_t direction;
	int32_t trigger_ts;
	int32_t kline_start_ts;
	double  price;
	double  stop_loss_price;
	char ext_info[128];
} NoticeTrade;


#endif // __DATA_STRUCT_H__

