/**
 * CSE 411
 * Fall 2018
 * Programming Assignment #5 Part 1
 *
 * It is exceedingly rare for any real-world software to be written in a single
 * language, or to be completely self contained.  Modern software relies on
 * services provided by other software packages, and not just by way of linking
 * in libraries... modern software also tends to request services from on-line
 * servers, who expose Application Programming Interfaces (APIs) that govern how
 * they can be used.
 *
 * In this assignment, we will build a multi-language, multi-component program
 * that consumes a remote service.  There will be two C++ components, and an
 * HTML5 component.  These components will work together as a Twitter analytics
 * package.
 *
 * In more detail: at any time, the client program can be run.  It will take a
 * command line parameter, which is a search term, and it will issue a query
 * against the Twitter API.  It will process the result set as follows:
 *     Produce a histogram from the top 100 results, matching number of tweets
 *     to dates.  Save this in a MongoDB collection called "hist".  The query
 *     term should be the document name.
 * - Note: query terms that are user handles (@name) or hashtags (#tag) will
 *   naturally show user activity or topic trends
 * - Note: authentication for the Twitter API uses OAuth.  It will take some
 *   time for you to figure it out.  Plan accordingly.
 *
 * The server program should do three things.
 *   - It should serve an index.html file in response to GET /
 *   - It should serve other files in response to GET /files/<filename>
 *   - It should serve JSON, pulled from MongoDB, in response to GET /data/term
 * With regard to the third of these tasks, "term" should be a search term, and
 * the response should be a JSON representation of the histogram for that term,
 * as determined by the client.  If no histogram exists, then the JSON response
 * should be empty.
 *
 * The HTML5 component should be a single-page web app that allows the user to
 * enter a search term.  In response to that term, the page will issue an AJAX
 * request to the server to get some JSON data, and then it should use that JSON
 * data to initialize a chart.  You can use an existing JavaScript charting
 * library, such as Dygraphs, Chart.js, D3.js, etc.  You may also use other
 * JavaScript libraries (jQuery, Bootstrap, etc.), as you see fit.
 *
 * Your program should use Microsoft's cpprestsdk.  It should use advanced
 * features of C++ whenever appropriate.  It should compile with g++ version 7.
 * You should organize your code into files in a way that is appropriate.  You
 * should comment your code.  You should only use C++ libraries that are easily
 * installed into an Ubuntu Docker container.
 *
 * Turn-in will be via bitbucket.
 */

#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <cstring>
#include <stdlib.h>
#include <cstdlib>
#include <cstdio>
#include <unistd.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <bsoncxx/builder/stream/document.hpp>
#include <bsoncxx/json.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include "proto3.pb.h"
#include "twitterClient.h"
//#include <cpprest/json.h>
#include "cpprest/containerstream.h"
#include "cpprest/filestream.h"
#include "cpprest/http_client.h"
#include "cpprest/json.h"
#include "cpprest/producerconsumerstream.h"
#include <jsoncpp/json/json.h>
#include <boost/algorithm/string.hpp>


using namespace std;
using namespace web;
using namespace web::http;
using namespace web::http::client;
using namespace web::json;

using namespace utility;                    // Common utilities like string conversions

/*
* shows how to run the program
*@param name of the program(usually argv[0])
*/
 void usage(const char *progname) {
  using std::cout;
  cout << "Client program --- search tags\n";
  cout << "  Usage: " << progname << " [options]\n";
  cout << "    -i		: input tag\n";
}

//add month,year and value
core::v1::optional<mongocxx::v_noabi::result::insert_one>
insert_complex_document(mongocxx::v_noabi::collection &collection,std::string month, std::string year, std::string day, std::string valstr)
{
	bsoncxx::document::value val = bsoncxx::builder::stream::document{}
		<< "value" << valstr
		<< "month" << month
		<< "year" << year
		<< "day"  << day
		<<bsoncxx::builder::stream::finalize;
	return collection.insert_one(val.view());
}

int main(int argc, char *argv[]) {
	
	string tag_string;
	bool show_help = false;
	string months = "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec";
	
	int o;
	while ((o = getopt(argc, argv, "i:")) != -1) {
		switch (o) {
		case 'i':
		  tag_string = optarg;
		default:
		  show_help = true;
		  break;
		}
	}

	if(show_help)
		usage(argv[0]);
	
	//connect to mangoDB 
	string username = "admin";
	string password = "admin1";
	mongocxx::instance inst{};
    mongocxx::client conn{mongocxx::uri{
		"mongodb://"+username+":"+password+"@ds129484.mlab.com:29484/cse411"
	}};
    auto db = conn["cse411"];
	mongocxx::collection coll = db["something_something"];


	//creating twitterClient object to retrieve the result
	twitterClient twitterObj = twitterClient();
	//call the search function and get the result
	if(!tag_string.empty())
	{
		std::cout<<"1"<<std::endl;
		string result = twitterObj.search_tags( "amincse411", "tmamrm00",tag_string,"100" );
		std::cout<<"2"<<std::endl;
		
		
		ifstream ifs("output.json");
		Json::Reader reader;
		Json::Value obj;
		reader.parse(ifs, obj);
		std::cout<<obj.size()<<std::endl;
		
		
		//Json::Value obj2 = obj[0];
		
		for (int i=0;i<obj.size();++i)
		{
			Json::Value v2 = obj[i];//get current object
			string datestr = v2["created_at"].asString();
			//split the date
			std::vector<std::string> splitstr;
			boost::split(splitstr, datestr, [](char c){return c == ' ';});
			string year = splitstr[5];//get the month at last index(5th)
			//get the month by number
			std::size_t found = months.find(splitstr[1]);//search for month occurence in month list
			string month = to_string((int)((found+4)/4));
			string day = splitstr[2];
			
			//extract info from descriptin
			string temp = v2["text"].asString();//get description
			boost::split(splitstr, temp, [](char c){return c == ' ';});//get all words
			//check if there is @ ro #
			for (int j=0;j<splitstr.size();++j)
			{
				found = splitstr[j].find_first_of("@#");//search for hashtags(#) or names(@)
				if(found!=std::string::npos)//there is a match
				{
					insert_complex_document(coll,month,year,day,splitstr[j].substr(1));//write it to database
				}
			}
			Json::Value ent = v2["entities"]["hashtags"]; //retrieve hashtags
			if(!ent.isNull()) //if it is not null we can store them
			{
				for(int j=0;j<ent.size();++j)
				{
					Json::Value enttemp = ent[j];
					insert_complex_document(coll,month,year,day,enttemp["text"].asString());//write it to database
				}
			}
			//std::cout<<ent.asString()<<std::endl;
			
		}
		
		
	}
	else
	{
		cout<<"You should provide a string to search"<<endl;
		usage(argv[0]);
		return 1;
	}
	std::cout<<"END!"<<std::endl;
	return 0;
}