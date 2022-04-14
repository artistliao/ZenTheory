#include "stdafx.h"
#include "EncodeTransform.h"
#include "Utils.h"
#include <fcntl.h>
//#include "apue.h"
#include <windows.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <io.h>


EncodeTransform::EncodeTransform()
{
}

EncodeTransform::~EncodeTransform()
{
}

// 将srcDir下的GBK文件转码成UTF8文件，存储在dstDir下
int EncodeTransform::EncodeOriginFilesFromGBKToUTF8(const string& srcDir, const string& dstDir) {
	SPDLOG_INFO("EncodeOriginFilesFromGBKToUTF8 srcDir:{}, dstDir:{}", srcDir, dstDir);

	vector<string> oriFiles;
	vector<string> oriDirs;
	int iRet = Utils::TraverseCurrentDir(srcDir, oriFiles, oriDirs);
	if (iRet < 0) {
		SPDLOG_WARN("TraverseCurrentDir failed! iRet:{}", iRet);
		return iRet;
	}

	//SPDLOG_INFO("oriFiles:{}, oriDirs:{}", oriFiles, oriDirs);
	SPDLOG_DEBUG("oriFiles.size():{}, oriDirs.size():{}", oriFiles.size(), oriDirs.size());
	for (auto& filename : oriFiles) {
		SPDLOG_DEBUG("oriFiles filename:{}", filename);
	}

	int success =  0;
	int failed = 0;
	for (auto& filename : oriFiles) {
		string srcFilePath = srcDir + filename;
		string dstFilePath = dstDir + filename;
		SPDLOG_DEBUG("srcFilePath:{}, dstFilePath:{}", srcFilePath, dstFilePath);
		iRet = Utils::GbkToUtf8(srcFilePath, dstFilePath);
		if (iRet < 0) {
			SPDLOG_WARN("TraverseCurrentDir failed! srcFilePath:{}, dstFilePath:{}, iRet:{}", srcFilePath, dstFilePath, iRet);
			failed++;
			continue;
		}

		success++;
	}

	SPDLOG_INFO("EncodeOriginFilesFromGBKToUTF8 success count:{}, failed count:{}", success, failed);
	return 0;
}


