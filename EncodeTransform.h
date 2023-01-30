#ifndef __ENCODE_TRANSFORM_H__
#define __ENCODE_TRANSFORM_H__

//文件编码转换
class EncodeTransform
{
public:
	EncodeTransform();
	~EncodeTransform();

public:
	// 将srcDir下的GBK文件转码成UTF8文件，存储在dstDir下
	int EncodeOriginFilesFromGBKToUTF8(const string& srcDir, const string& dstDir);

};

#endif	// 

