/**
 * CSE 411
 * Fall 2018
 * Programming Assignment #4
 *
 * There are two goals to this assignment.  The first is to implement an
 * iterative simulation.  The second is to practice visualization of a
 * simulation.  To that end, we will write a program that generates videos that
 * depict the execution of Conway's Game of Life.
 *
 * Conway's Game of Life is a simulation, which takes as its initial state a
 * two-dimensional grid of zeroes and ones.  The state of a cell in step k+1 is
 * determined exclusively by the state of that cell and its neighbors in step k.
 *
 * The rules are as follows:
 * - If a "1" cell has fewer than two live neighbors, then it becomes "0" in
 *   the next round.  This is "underpopulation"
 * - If a "1" cell has two or three live neighbors, then it remains "1" in the
 *   next round.  This is "healthy population"
 * - If a "1" cell has more than three live neighbors, then it becomes "0" in
 *   the next round.  This is "overpopulation".
 * - If a "0" cell has exactly three live neighbors, then it becomes "1" in the
 *   next round.  This is "reproduction".
 *
 * More details, and some examples, can be found at
 * https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life.
 *
 * The input to your program will be a text file of N lines, each of which
 * contains M columns.  The values in this file will be 1s and 0s, and they will
 * represent the initial state of the game.  This input should be given by the
 * "-i" parameter.
 *
 * The output of your program will be a video file, generated with OpenCV.  The
 * file name will be determined by the "-o" parameter.  The frame rate of the
 * video will be determined by the "-f" parameter.  The number of pixels per
 * cell of the game will be determined by the "-p" parameter.  Your program
 * should run the simulation for a number of rounds determined by the "-r"
 * parameter.  Your output video should include a text watermark,
 * determined by the "-w" parameter.  Lastly, the "-s" parameter should
 * determine which frames of the game should be output to image files.  For
 * example, "-s1,4,16,256" would result in frames 1, 4, 16, and 256 being output
 * as images named frame1.png, frame4.png, frame16.png, and frame256.png
 *
 * You should consider using tbb or custom threads to both (a) parallelize the
 * creation of frames, and (b) pass frames to the video output generator.  Be
 * sure to use appropriate smart pointers to avoid memory leaks.
 *
 * Your program should use advanced features of C++ whenever appropriate.  It
 * should compile with g++ version 7.  You should organize your code into files
 * in a way that is appropriate.  You should comment your code.  You should only
 * use libraries that are easily installed into an Ubuntu Docker container.
 *
 * Turn-in will be via bitbucket.
 */
#include <iostream>
#include <fstream>
#include <opencv2/opencv.hpp>
#include <functional>
#include <string>
#include <unistd.h>
#include <vector>
#include <boost/algorithm/string.hpp>
#include <math.h>
#include "tbb/blocked_range.h"
#include "tbb/parallel_for.h"
#include "tbb/task_scheduler_init.h"
#include "tbb/tbb.h"
#include "video_frame.h"
//#include "input_sequence.h"

using namespace std;
using namespace cv;
using namespace tbb;

/*
* shows how to run the program
*@param name of the program(usually argv[0])
*/
 void usage(const char *progname) {
  using std::cout;
  cout << "Conway Game of Life\n";
  cout << "  Usage: " << progname << " [options]\n";
  cout << "    -i		: input states with equal columns and variable size of rows\n";
  cout << "    -o		: output video file name\n";
  cout << "    -f		: Desired frame rate\n";
  cout << "    -p		: number of pixels per cell\n";
  cout << "    -r		: Number of Conway game of life rounds(seconds)\n";
  cout << "    -w		: A text to watermark\n";
  cout << "    -s		: Selected frames to output as images\n";
  cout << "    -@		: random production of first state\n";
}

/*
* read a text file and make states of 0-1
*@param file name
*/
int** read_file(string file_name)
{
	int** states;//define all states in a 2D array names states
	states = new int*[100];
	std::ifstream input_file;//input_file pointer
	input_file.open (file_name,ios::in);//open file--read mode
	std::string line;//define a string to read from the file
	int row=0;
	if (input_file.is_open())
	{
		while ( getline (input_file,line) )//read line by line
		{
			states[row] = new int[100];
			for (int i=0;i<100;i++)
				states[row][i] = 0;//initial the new row
			//read each integer of each line
			for (int i=0;i<line.length();i++)
			{
				if(line.substr(i,1).compare("\r")==0) //if there is an end of a line then exit
					break;
				states[row][i] = stoi(line.substr(i,1));
			}
			row++;//add row by one for next line
		}
		//make the rest of states to 100
		for (;row<100;row++)
		{
			states[row] = new int[100];
			for (int i=0;i<100;i++)
				states[row][i] = 0;//initial the new row
		}
		
	input_file.close();//close the file
	}
	else //if the file is not existed
	{
	  cout << "Unable to open file"<<std::endl; //if we can't open the file!
	  exit(1);
	}
	
	return states;
}
 
 /*
* get current states and return next states
*@param a 2d array of current states
*return next states
*/
 int** next_state(int** states)
 {
	int** ret_states;//define all states in a 2D array names states
	ret_states = new int*[100];
	
	//check every pixel neigbours
	for (int i=0;i<100;i++)
	{
		ret_states[i] = new int[100];//make a new row
		for(int j=0;j<100;j++)
		{
			//count the neighbors
			int neighbors=0;
			for (int ii=-1;ii<2;ii++)
				for(int jj=-1;jj<2;jj++)
				{
					if(ii==0 && jj==0) continue; //same pixel doesn't count!
					if(i+ii<0 || i+ii>99) continue; //out of rows borders
					if(j+jj<0 || j+jj>99) continue; //out of columns borders
					//count neighbors
					neighbors += states[i+ii][j+jj];
				}
			ret_states[i][j] = states[i][j];//to make sure if no rules apply, the value remain the same
			//reproduction
			if(states[i][j]==0 && neighbors ==3 ) 
				ret_states[i][j] = 1;//change 0 to 1
			//overpopulation
			if(states[i][j]==1 && neighbors >3 ) 
				ret_states[i][j] = 0;//change 1 to 0
			//healthy population
			if(states[i][j]==1 && neighbors <4 && neighbors>1) 
				ret_states[i][j] = 1;//No change
			//underpopulation
			if(states[i][j]==1 && neighbors<2) 
				ret_states[i][j] = 0;//change 1 to 0
			
			
		}
	}
	return ret_states;
 }
 
 /*
* get current states and return next states ** does the action in parallel using TBB::parallel_for
*@param a 2d array of current states
*return next states
*/
 int** parallel_next_state(int** states)
 {
	int** ret_states;//define all states in a 2D array names states
	ret_states = new int*[100];
	
	
	/*tbb::parallel_for( size_t(0), size_t(11), [&]( size_t k ) {
		if (k>100) {
			cout<<k;
		}
    } );*/
	//check every pixel neigbours
	tbb::parallel_for( size_t(0), size_t(100), [&]( size_t i ){
	//for (int i=0;i<100;i++)
	//{
		ret_states[i] = new int[100];//make a new row
		for(int j=0;j<100;j++)
		{
			//count the neighbors
			int neighbors=0;
			for (int ii=-1;ii<2;ii++)
				for(int jj=-1;jj<2;jj++)
				{
					if(ii==0 && jj==0) continue; //same pixel doesn't count!
					if(i+ii<0 || i+ii>99) continue; //out of rows borders
					if(j+jj<0 || j+jj>99) continue; //out of columns borders
					//count neighbors
					neighbors += states[i+ii][j+jj];
				}
			ret_states[i][j] = states[i][j];//to make sure if no rules apply, the value remain the same
			//reproduction
			if(states[i][j]==0 && neighbors ==3 ) 
				ret_states[i][j] = 1;//change 0 to 1
			//overpopulation
			if(states[i][j]==1 && neighbors >3 ) 
				ret_states[i][j] = 0;//change 1 to 0
			//healthy population
			if(states[i][j]==1 && neighbors <4 && neighbors>1) 
				ret_states[i][j] = 1;//No change
			//underpopulation
			if(states[i][j]==1 && neighbors<2) 
				ret_states[i][j] = 0;//change 1 to 0
			
			
		}
	});
	return ret_states;
 }
 

/*
* get current states and pixel per cell and produce an image
*@param int** current states
*@param pixel per cell
*return image of current state
*/ 
 cv::Mat produce_image(int** states,int pixel, int row,int col,Size s)
 {
	//Size s(row*pixel,col*pixel);
	//Size s(row,col);
	Mat img(s,DataType<Vec3b>::type); //initialize an empty image
	//create the image based on states
	//for(int i=0;i<row;i++)
		tbb::parallel_for( size_t(0), size_t(row), [&]( size_t i ){
		for (int j=0;j<col;j++)
			for (int pi=0;pi<pixel;pi++)
				for (int pj=0;pj<pixel;pj++)
				{
					img.at<Vec3b>(i*pixel+pi,j*pixel+pj)[0] = states[i][j]*255;
					img.at<Vec3b>(i*pixel+pi,j*pixel+pj)[1] = states[i][j]*255;
					img.at<Vec3b>(i*pixel+pi,j*pixel+pj)[2] = states[i][j]*255;
				}
		});//tbb::for
	
	return img;
 }
 
 /*
*write the image to the video stream fps times
*@param video writer object
*@param image to write
*@param frames per seconds
*/ 
 void video_generator(VideoWriter vv,Mat img, int fps,string txt)
 {
	for (int ii=0;ii<fps/4;ii++) 
	{
		vv<<img;
	}
 }
 
int main(int argc, char *argv[]) {
	bool show_help = false;
	std::string input_filename,output_filename,watermark_text;
	int fps,pixels_per_cell,rounds;
	rounds = 10; fps = 16;
	vector<int> output_frames;//define output_frames to set the frame user want to make an jpg output for
	int** states;//[100][100];//define all states in a 2D array names states
	
	int o;
	while ((o = getopt(argc, argv, "i:o:f:p:r:w:s:h:")) != -1) {
		switch (o) {
		case 'i':
		  input_filename = optarg;
		  break;
		case 'o':
		  output_filename = optarg;
		  break;
		case 'f':
		  fps = stoi(optarg);
		  break;
	    case 'p':
		{
		  pixels_per_cell = stoi(optarg);
		  //round the pixels_per_cell to nearest 2^name
		  /*int min = 1000,candid = 0;
		  for (int i=0;i<7;i++)//at most 64 pixels
			if(min>=abs(pow(2,i)-pixels_per_cell))
			{
				min = abs(pow(2,i)-pixels_per_cell);
				candid = i;
			}
		pixels_per_cell = candid;//in each dimension*/
		pixels_per_cell = int(log2(pixels_per_cell));
		}
		  break;
		case 'r':
		  rounds = stoi(optarg);
		  break;
		case 'w':
		  watermark_text = optarg;
		  break;
		case 's':
		  {
		  std::vector<std::string> results;
		  boost::split(results, optarg, [](char c){return c == ',';});//split the inputs
		  for (int i=0; i<results.size();i++)
			  output_frames.push_back(stoi(results[i]));
		  }
			break;
		case 'h':
		  show_help = true;
		  break;
		default:
		  show_help = true;
		  break;
		}
	}
	
	if(show_help)
		usage(argv[0]);
	
	int img_per_frame = fps/2;//number of image per each frame
	
	/*
	*read states from the input file
	*/
	states = read_file(input_filename);
	//make a video Writer named vv
	cv::VideoWriter vv;
	//Size vid_size(100*pixels_per_cell,100*pixels_per_cell);
	Size vid_size(800,600);
	//open the writer
	vv.open(output_filename,cv::VideoWriter::fourcc('a', 'v', 'c', '1'),fps,vid_size,true);
	
	int frames = 0;//number of frames
	int output_frames_counter = 0;
	//loop for rounds repeat
	for (int i=0;i<rounds;i++)
	{
		//produce relevant image for this state (consider the image 100,100)
		Mat img = produce_image(states,pixels_per_cell,100,100,vid_size);
		//write text above each image
		cv::putText(img,watermark_text,Point(10,img.rows-50),FONT_HERSHEY_SIMPLEX,1.0,Scalar(255,255,255),2,FILLED ,false);
		//write current frame fps time
		//video_generator(vv,img,fps,watermark_text,img_per_frame);
		for (int ii=0;ii<fps/img_per_frame;ii++) {
			vv<<img;
			frames++;//add frames by one
			//if there is an existing element and this is the exact image to write
			if(output_frames_counter<output_frames.size() && frames==output_frames[output_frames_counter])
			{
				//make a name for the frame
				string output_frames_name = "frame";
				output_frames_name += to_string(output_frames[output_frames_counter]);
				output_frames_name +=".jpg";
				//write the image
				cv::imwrite(output_frames_name,img);
				output_frames_counter++;//add one to the counter
			}
		}
		//print the round
		cout<<i<<endl;
		
		 
		//produce next states based on current states each time
		//sequential call
		//states = next_state(states); 
		//parallel call
		states = parallel_next_state(states); 
	}
	
	vv.release();//release the video writer
	
	
	return 0;
}