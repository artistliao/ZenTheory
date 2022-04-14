#ifndef __DIVERGENCE_H__
#define __DIVERGENCE_H__

// L
class Divergence
{
public:
	Divergence();
	~Divergence();

public:
	//
	static int32_t DivergenceHandle(const string& code, const string& period);
	static int32_t JudgeDivergence(const string& code, const string& period, char type, SectionIndex &klineSection1, SectionIndex &klineSection2);
};

#endif	// __DIVERGENCE_H__

