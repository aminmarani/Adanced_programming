CC=g++

#MONGOLIB   =  /root/Project5/files/mongodb/build/libmongocxx-install/lib
MONGOLIB   =  /root/build/libmongocxx-install/lib
#MONGOINCL1  = /root/Project5/files/mongodb/build/libmongocxx-install/include/bsoncxx/v_noabi
MONGOINCL1  = /root/build/libmongocxx-install/include/bsoncxx/v_noabi
#MONGOINCL2  = /root/Project5/files/mongodb/build/libmongocxx-install/include/mongocxx/v_noabi
MONGOINCL2  = /root/build/libmongocxx-install/include/mongocxx/v_noabi
TWILIB = /usr/local/lib/
TWIINCL = ./include/
MONGOLIBFLAGS = -I$(MONGOINCL1) -I$(MONGOINCL2) -L$(MONGOLIB) -lmongocxx -lbsoncxx -lprotobuf
TWILIBFLAGS = -I$(TWIINCL) -L$(TWILIB) -ltwitcurl 
#-ljsoncpp
#CXXFLAGS = -std=c++17 $(LIBFLAGS) -mavx

all : mongo_test

libcurl : 
		cd ../libtwitcurl && make install 
		cd ../T_spider
	

mongo_test : mongo_test.cc 
	$(CC) mongo_test.cc proto3.pb.cc $(TWILIBFLAGS) $(MONGOLIBFLAGS) -o mongo_test
	#$(CC) mongo_test.cc $(TWILIBFLAGS) $(MONGOLIBFLAGS) -o mongo_test

clean : 
		rm twitterClient

