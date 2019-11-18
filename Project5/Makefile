CC=g++

MONGOLIB   =  /root/build/libmongocxx-install/lib
MONGOINCL1  = /root/build/libmongocxx-install/include/bsoncxx/v_noabi
MONGOINCL2  = /root/build/libmongocxx-install/include/mongocxx/v_noabi
DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0
DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so
DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so
OPENSSLLIB = /usr/local/opt/openssl/lib
TWILIB = /usr/local/lib/
TWIINCL = ./include/
MONGOLIBFLAGS = -I$(MONGOINCL1) -I$(MONGOINCL2) -L$(MONGOLIB) -lmongocxx -lbsoncxx -lprotobuf
TWILIBFLAGS = -I$(TWIINCL) -L$(TWILIB) -ltwitcurl 
JSONLIBFLAGS = -ljsoncpp
#CPPRESRSDKFLAFS = -L$(DOPENSSL_SSL_LIBRARY) -L$(DOPENSSL_CRYPTO_LIBRARY) -I$(DOPENSSL_INCLUDE_DIR) -lboost_system -lcrypto -lssl -lcpprest
CPPRESRSDKFLAFS = -lboost_system -lcrypto -lssl -lcpprest
SERVERFLAGS = -lboost_system -lcrypto -lssl -lcpprest -lboost_system -lboost_chrono -lssl -lcrypto
#-ljsoncpp
#CXXFLAGS = -std=c++17 $(LIBFLAGS) -mavx

all : server cpprestsdk_test client

libcurl : 
		cd ../libtwitcurl && make install 
		cd ../T_spider
	

server : server.cc 
	$(CC) server.cc proto3.pb.cc -L$(OPENSSLLIB) $(MONGOLIBFLAGS) $(SERVERFLAGS) -o server
	#$(CC) server.cc $(TWILIBFLAGS) $(MONGOLIBFLAGS) -o server
	
client : client.cc
	$(CC) -std=c++17 client.cc proto3.pb.cc twitterClient.cpp $(TWILIBFLAGS) $(JSONLIBFLAGS) $(MONGOLIBFLAGS) $(CPPRESRSDKFLAFS) -o client
	
cpprestsdk_test: cpprestsdk_test.cc
	$(CC) -std=c++17 cpprestsdk_test.cc $(CPPRESRSDKFLAFS) -o cpprestsdk_test

clean : 
		rm server client

