#include <iostream>
#include <fstream>
#include <opencv2/opencv.hpp>
#include "tbb/blocked_range.h"
#include "tbb/parallel_for.h"
#include "tbb/task_scheduler_init.h"
#include "tbb/tbb.h"
#include "tbb/pipeline.h"
#include "tbb/tick_count.h"
#include "tbb/tbb_allocator.h"
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cctype>

using namespace std;
using namespace cv;
using namespace tbb;


/*
* viedo frame class holds the Mat data of an image and used to be allocated, freed in pipeline
*/
class video_frame{
	//pointer to the end of 
	//Mat* logical_end;
	//Mat* physical_end;
	Mat img;
	
public:
	//allocate a matrix image up to max size
	/*static video_frame* allocate(size_t max_size){
		video_frame* t = (video_frame*)tbb_allocator<Mat>().allocate(sizeof(video_frame)+max_size+1);
		t->logical_end = t->begin();
		t->physical_end = t->begin()+max_size;
		return t;
	}
	void free(){
		tbb_allocator<Mat>().deallocate((Mat*)this,sizeof(video_frame)+(physical_end-begin())+1);
	}
	
	//pointer to the begining of the image
	Mat* begin(){return (Mat*)(this+1);}
	//pointer to the end of the image
	Mat* end(){return logical_end;}
	//size of the image
	size_t size() const{return logical_end-(Mat*)(this+1);}
	//maximum available Mat
	size_t avail() const {return physical_end-logical_end;}
	//void append(Mat)
	void set_end(Mat* p){logical_end = p;}*/
	static video_frame* allocate(size_t max_size){
		video_frame* t = (video_frame*)tbb_allocator<Mat>().allocate(sizeof(video_frame)+max_size+1);
		
		return t;
	}
};