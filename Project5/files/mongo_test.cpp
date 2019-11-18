#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <bsoncxx/builder/stream/document.hpp>
#include <bsoncxx/json.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/instance.hpp>

using namespace std;
using namespace mongocxx;

int main( int argc, char* argv[])
{
	cout<<"12324546768890"<<endl;
	
	mongocxx::instance inst{};
    mongocxx::client conn{mongocxx::uri{}};

    bsoncxx::builder::stream::document document{};

    auto collection = conn["testdb"]["testcollection"];
    document << "hello" << "world";

    collection.insert_one(document.view());
    auto cursor = collection.find({});

    for (auto&& doc : cursor) {
        std::cout << bsoncxx::to_json(doc) << std::endl;
    }
}