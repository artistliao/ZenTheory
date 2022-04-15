# ZenTheory
此缠论工程耗时了一年半，其中接近一半的时间用来苦学缠论，另一半的时间用来开发和测试，缠论(缠中说禅)实现代码，包含了K线合并、分型、笔、线段、走势中枢、走势类型，第1/2/3类买卖点

1、工程需要集成grpc，大家可自行百度怎样在VS中集成grpc，值得注意的是如果我们之间用不同版本的grpc和protobuf的话需要重新调用命令生成grpc.pb.h/cpp和pb.h/cpp文件，参考命令如下：
	
	E:\othercode\grpc\build_VS2019_x64\third_party\protobuf\Release\protoc.exe -I="./" --grpc_out="./"  --plugin=protoc-gen-grpc=“E:\othercode\grpc\build_VS2019_x64\Release\grpc_cpp_plugin.exe"  "./secdata_transfer.proto"
	
	E:\othercode\grpc\build_VS2019_x64\third_party\protobuf\Release\protoc.exe -I="./" --cpp_out="./"  "./secdata_transfer.proto"

2、其他的依赖库和CTP库的代码比较多，分享到了阿里云盘，地址：https://www.aliyundrive.com/s/2bJgrs5ukau 提取码：8d0u

3、后续在readme里面详细说明一下每个文件的作用

大家在使用过程中有问题请联系邮箱：liaoshuilv@163.com
