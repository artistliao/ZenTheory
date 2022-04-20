# ZenTheory
此缠论核心逻辑工程业余花费了我差不多一年半的时间，其中接近一半的时间用来苦学缠论，另一半的时间用来开发和测试，主要是缠论(缠中说禅)实现代码，包含了K线合并、分型、笔、线段、走势中枢、走势类型，第1/2/3类买卖点。工程是在VS2019中开发(这个主要是考虑到开发方便)，采用C++14的标准，有需要的同学可以很容易的将工程转换到其他的IDE，或者转为linux C++工程。

1、工程需要集成grpc，大家可自行百度怎样在VS中集成grpc，值得注意的是如果用不同版本(我这里用的是1.25.0)的grpc和protobuf的话需要重新调用protoc命令生成grpc.pb.h/cpp和pb.h/cpp文件(每一个proto文件都需要重新生成，不然有可能会报错)，参考命令如下：
	
	E:\othercode\grpc\build_VS2019_x64\third_party\protobuf\Release\protoc.exe -I="./" --grpc_out="./"  --plugin=protoc-gen-grpc=“E:\othercode\grpc\build_VS2019_x64\Release\grpc_cpp_plugin.exe"  "./secdata_transfer.proto"
	
	E:\othercode\grpc\build_VS2019_x64\third_party\protobuf\Release\protoc.exe -I="./" --cpp_out="./"  "./secdata_transfer.proto"

2、其他依赖的第三方库和CTP库的代码比较多，分享到了百度网盘，地址：链接：https://pan.baidu.com/s/1rgulk-qmbaefCFuHKSegKQ 提取码:`1502`，大家可以自行下载。

3、工程数据库用的是mysql，主要有三个库`gp\futures\trade`，每个库对应表结构sql文件已经上传

4、每个文件的作用：<br>
* `DataCard.h/cpp`:K线数据的读取，新K线的插入，各功能的入口函数，分型/笔/线段/走势中枢/走势类型以文本格式写入文件(主要用于历史数据的回测)<br>
* `DataStruct.h`:工程主要的数据结构<br>
* `Divergence.h/cpp`:背驰的处理和判断<br>
* `EMA.h/cpp`:指数移动平均数据的计算<br>
* `EncodeTransform.h/cpp`:GBK文件转码成UTF8文件<br>
* `LineSegment.h/cpp`:根据笔数据生成线段，特征序列的处理和判断<br>
* `MACD.h/cpp`:MACD的计算<br>
* `Merge.h/cpp`:K线合并的处理<br>
* `NoticeHandle.h/cpp`:将画图或者交易的通知转发给ZenNoticeSvr服务(在我GitHub主页的另外一个工程里，双方用grpc通信)<br>
* `QuotationHandle.h/cpp`:缺失K线的检测处理，处理ZenDataSvr服务(在我GitHub主页的另外一个工程里，双方用grpc通信)发送过来的K线数据<br>
* `stdafx.h/cpp`:公共库头文件集合<br>
* `Stroke.h/cpp`:根据合并且分型好的K线数据，生成笔数据<br>
* `ThostFtdcXXX.h`:CTP库头文件<br>
* `TrendCentralAndType.h/cpp`:走势中枢和走势类型的划分<br>
* `Utils.h/cpp`:基础功能函数<br>
* `zen_data_svr h/cpp`:由zen_data_svr.proto生成，和ZenDataSvr服务之间通信协议和接口<br>
* `zen_notice h/cpp`:由zen_notice.proto生成，和ZenNoticeSvr服务之间通信协议和接口<br>
* `ZenSchedule.h/cpp`:实时数据的用缠论逻辑来处理的继承类<br>
* `ZenTheory.h/cpp`:缠论主类，采用了单例模式，主要负责程序在运行过程中各种数据的存储<br>



大家在使用过程中有问题请联系邮箱：liaoshuilv@163.com
