# ZenTheory
此缠论核心逻辑工程耗时了一年半，其中接近一半的时间用来苦学缠论，另一半的时间用来开发和测试，主要是缠论(缠中说禅)实现代码，包含了K线合并、分型、笔、线段、走势中枢、走势类型，第1/2/3类买卖点。工程是在VS2019中开发(这个主要是考虑到开发方便)，采用C++14的标准，有需要的同学可以很容易的将工程转换到其他的IDE，或者转为linux C++工程。

1、工程需要集成grpc，大家可自行百度怎样在VS中集成grpc，值得注意的是如果用不同版本(我这里用的是1.25.0)的grpc和protobuf的话需要重新调用protoc命令生成grpc.pb.h/cpp和pb.h/cpp文件(每一个proto文件都需要重新生成，不然有可能会报错)，参考命令如下：
	
	E:\othercode\grpc\build_VS2019_x64\third_party\protobuf\Release\protoc.exe -I="./" --grpc_out="./"  --plugin=protoc-gen-grpc=“E:\othercode\grpc\build_VS2019_x64\Release\grpc_cpp_plugin.exe"  "./secdata_transfer.proto"
	
	E:\othercode\grpc\build_VS2019_x64\third_party\protobuf\Release\protoc.exe -I="./" --cpp_out="./"  "./secdata_transfer.proto"

2、其他依赖的第三方库和CTP库的代码比较多，分享到了百度网盘，地址：链接：https://pan.baidu.com/s/1rgulk-qmbaefCFuHKSegKQ 提取码：1502，大家可以自行下载。


3、后续在readme里面详细说明一下每个文件的作用
4、每个文件的作用：


大家在使用过程中有问题请联系邮箱：liaoshuilv@163.com
