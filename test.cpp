// main.cpp : Defines the entry point for the console application.
//

#include <iostream>
#include <chrono>
using namespace std;


int main(int argc, char* argv[])
{
	chrono::steady_clock::time_point t1 = chrono::steady_clock::now();

	int64_t sum = 0;
	int64_t i = 0;
	for (i = 1; i < 1000000000; i++) {
		sum += i;
	}
	chrono::steady_clock::time_point t2 = chrono::steady_clock::now();

	//毫秒
	std::chrono::duration<double, std::milli> dTimeSpan = std::chrono::duration<double, std::milli>(t2 - t1);
	std::cout << "dTimeSpan: " << dTimeSpan.count() << "ms\n";

	cout << sum << endl;

	return 0;
}

