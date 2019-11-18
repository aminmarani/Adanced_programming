#include <iostream>
#include <opencv2/opencv.hpp>
#include <functional>
#include <string>
#include <unistd.h>


void usage(const char *progname) {
  using std::cout;
  cout << "Blurring an image\n";
  cout << "  Usage: " << progname << " [options]\n";
  cout << "    -i 		: input image file name\n";
  cout << "    -j       : output image file name\n";
  cout << "    -v       : output video file name\n";
}

cv::Point nearest(cv::Mat &mat)
{
	int x=0,y=0;
	double best=12497385;
	
	for (int i=0;i<mat.rows;i++)
		for (int j=0;j<mat.cols;j++)
			if (best>mat.at<cv::Vec3b>(i, j)[0]-255 + mat.at<cv::Vec3b>(i, j)[1]-255 + mat.at<cv::Vec3b>(i, j)[2]-255)
			{
				best = mat.at<cv::Vec3b>(i, j)[0]-255 + mat.at<cv::Vec3b>(i, j)[1]-255 + mat.at<cv::Vec3b>(i, j)[2]-255;
				x = i;
				y = j;
			}
	return cv::Point(x,y);
}

int main(int argc, char *argv[]) {
	using namespace cv;
	/*if(argc<3)
	{
		std::cout<<"You must provide 3 parameters"<<std::endl;
		return 1;
	}*/
	
	int o;
	std::string input_img;
	std::string output_img;
	std::string output_vid;
	bool show_help = false;
	
	while ((o = getopt(argc, argv, "i:j:v:")) != -1) {
		switch (o) {
		case 'i':
		  input_img = optarg;
		  break;
		case 'j':
		  output_img = optarg;
		  break;
		case 'v':
		  output_vid = optarg;
		default:
		  show_help = true;
		  break;
		}
  }
  
  
	//reading the image
	cv::Mat img;
	img = cv::imread(input_img,CV_LOAD_IMAGE_COLOR);
	//blurr the image
	cv::Mat output;
	double fps = 16;//frame per second
	cv::blur(img,output,cv::Size(5,5));
	//write the result
	cv::imwrite(output_img,output);
	
	cv::Mat img2;//new image to resize in 50% size
	//cv::resize(img, img2, cv::Size(), 0.5, 0.5);
	cv::resize(img, img2, Size(img.rows/2, img.cols/2), 0, 0, INTER_LANCZOS4);
	
	
	cv::Size videoSize = cv::Size(img.rows/2,img.cols/2);
	cv::VideoWriter vv;
	vv.open(output_vid,cv::VideoWriter::fourcc('a', 'v', 'c', '1'),fps,videoSize,true);
	
	//first second-->clear image
	for (int i=0;i<fps;i++) 
	{
		//cv::putText(output,"Amin Hosseiny Marani",Point(100,100),FONT_HERSHEY_SIMPLEX,1.0,Scalar(0,0,0),2,FILLED ,false);
		vv<<img2;
	}
	//2nd-5th seconds-->clear image to blur
	for (int i=1;i<=fps*4;i++) 
	{
		cv::blur(img2,output,cv::Size(i,i));
		Point nn = nearest(output);
		std::cout<<nn<<std::endl;
		circle(output, nn, 50,Scalar(255,0,0),FILLED,8);
		cv::putText(output,"Amin Hosseiny Marani",Point(100,100),FONT_HERSHEY_SIMPLEX,1.0,Scalar(0,0,0),2,FILLED ,false);
		vv<<output;
	}
	//6nd-9th seconds-->blur image to clear
	for (int i=fps*4;i>0;i--) 
	{
		cv::blur(img2,output,cv::Size(i,i));
		Point nn = nearest(output);
		std::cout<<nn<<std::endl;
		circle(output, nn, 50,Scalar(255,0,0), FILLED,8);
		cv::putText(output,"Amin Hosseiny Marani",Point(100,100),FONT_HERSHEY_SIMPLEX,1.0,Scalar(0,0,0),2,FILLED ,false);
		vv<<output;
	}
	//10th second-->clear image
	for (int i=0;i<fps;i++) 
	{
		//cv::putText(output,"Amin Hosseiny Marani",Point(100,10),FONT_HERSHEY_SIMPLEX,1.0,Scalar(0,0,0),2,FILLED ,false);
		vv<<img2;
	}
	
	
	//release the video writer
	vv.release();
	
	
	
	
	
	
	return 0;
	
}