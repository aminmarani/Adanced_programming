/**
 * CSE 411
 * Fall 2018
 * Programming Assignment #5 Part 2
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
#include <iostream>
#include <fstream>
#include <bsoncxx/builder/stream/document.hpp>
#include <bsoncxx/json.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include "proto3.pb.h"
#include "twitterClient.h"
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include <cpprest/http_listener.h>
#include <cpprest/json.h>                       // JSON library
#include <cpprest/uri.h>  
#include <string>
#include <iomanip>
#include <sstream>
#include <thread>
#include <chrono>
#include <ctime>
#include <boost/format.hpp>

using namespace utility;                    // Common utilities like string conversions
using namespace web;                        // Common features like URIs.
using namespace web::http;                  // Common HTTP functionality
using namespace web::http::client;          // HTTP client features
using namespace concurrency::streams;       // Asynchronous streams
using namespace web::http::experimental::listener;
using namespace std;
using namespace ::pplx;


std::string read_file(std::string filename) {
	ifstream inFile;
	inFile.open(filename);

	std::stringstream strStream;
	strStream << inFile.rdbuf();
	string str = strStream.str();
	return str;
}

boost::format get_template(std::string filename) {
	std::string content = read_file(filename);
	boost::format con = boost::format(content);
	return con;
}


int main(int argc, char *argv[]) {
  // By now, you should be able to write your own argument parsing code :)

  //http_listener listener("http://localhost:12345");
	http_listener listener("http://172.17.0.3:12345/");
	

	int count = 0;
	

	listener.support(methods::GET, [count] (http_request request) mutable {
		std::cout << "GET "<< request.request_uri().to_string() << std::endl;

		//get https request variables
		auto http_get_vars = uri::split_query(request.request_uri().query());
		
		//std::cout<<http_get_vars[0]<<std::endl;

		// takto sa parsuju parametre	
		auto param_end = http_get_vars.find("index.html");
		if (param_end != end(http_get_vars)) {
			auto request_name = param_end->second;
			std::cout << "Received \"index.html\": " << request_name << endl;
		}

		auto param_start = http_get_vars.find(U("start"));
		if (param_start != end(http_get_vars)) {
			auto request_name = param_start->second;
			std::cout << "Received \"start\": " << request_name << endl;
		}


		boost::format tpl = get_template("index.html");
		tpl % "Page rendered: " % count;
		count++;

		//request.reply(status_codes::OK, U(boost::str(tpl)),U("text/html"));
		request.reply(status_codes::OK, U(boost::str(tpl)),U("text/html"));
	});	

	listener.open().wait();
	std::cout << "Web server started on: " << listener.uri().to_string() << std::endl;
	
	while(true) {
		this_thread::sleep_for(chrono::milliseconds(2000));
	}

	std::cout << "Terminating JSON listener." << endl;
	listener.close().wait();
  
  
  return 0;
}