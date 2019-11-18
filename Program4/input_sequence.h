#include <iostream>
#include <fstream>
#include <opencv2/opencv.hpp>
#include "tbb/blocked_range.h"
#include "tbb/parallel_for.h"
#include "tbb/task_scheduler_init.h"
#include "tbb/tbb.h"
#include "video_frame.h"

using namespace std;
using namespace cv;
using namespace tbb;

video_frame* next_frame = NULL;

class input_sequence{
public:
	input_sequence();
	input_sequence(int** st,int p,int r,int c,Size ss);
	~input_sequence();
	video_frame* operator()(flow_control& fc) const;
	
	
private:
	int** states;
	int pixel;
	int row;
	int col;
	Size s;
};

//initialzie the states randomly
input_sequence::input_sequence(){
	states = new int*[100];
	for (int i=0;i<50;i++)
	{
		states[i] = new int[100];
		for (int j=0;j<51;j++)
			states[i][j] =  rand()%2;//make random 0-1
	}
	
	
	for (int i=51;i<100;i++)
		states[row][i] = 0;//initial the new row
}

input_sequence::input_sequence(int** st,int p,int r,int c,Size ss)
{
	states = st; pixel = p; row = r; col = c; s = ss;
}

video_frame* input_sequence::operator()(flow_control& fc) const{
	//allocate new frame
	if(!next_frame)
		nextث_frame = video_frame::allocate(size_t(row*col));
	
}