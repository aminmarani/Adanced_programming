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

using namespace std;
//using namespace mongocxx;
//using namespace bsoncxx;

core::v1::optional<mongocxx::v_noabi::result::insert_one> insert_simple_document(mongocxx::v_noabi::collection &collection)
{
	cout<<"Creating a simple Document"<<endl;
	bsoncxx::builder::stream::document document{};
	//make key-value document
	return collection.insert_one(document.view());
}

void delete_by_id(mongocxx::v_noabi::collection &c, const bsoncxx::v_noabi::types::value id)
{
	cout<<"Deleting the document with id : "<<id.get_oid().value.to_string()<<endl;
	c.delete_one(bsoncxx::builder::stream::document{}
		<< "_id" <<id<<bsoncxx::builder::stream::finalize);
}

void print_all(mongocxx::v_noabi::collection &c)
{
	cout<<"print all docuemtns"<<endl;
	auto cursor = c.find({});
	for(auto &&doc : cursor)
		cout<<bsoncxx::to_json(doc)<< endl;
}

core::v1::optional<mongocxx::v_noabi::result::insert_one>
insert_complex_document(mongocxx::v_noabi::collection &collection)
{
	cout<<"creating a complex doc"<<endl;
	bsoncxx::document::value val = bsoncxx::builder::stream::document{}
		<< "key" << "advanced"
		<< "key2" << "stuff"
		<< "arr" << bsoncxx::builder::stream::open_array <<1 << 2 << 3
				 << bsoncxx::builder::stream::close_array
		<< "arr2" << bsoncxx::builder::stream::open_array <<"a" << "b" << "c"
				 << bsoncxx::builder::stream::close_array
		<< "sub" << bsoncxx::builder::stream::open_document <<"k" << "v"
				 << bsoncxx::builder::stream::close_document
		<<bsoncxx::builder::stream::finalize;
	return collection.insert_one(val.view());
}

void print_details(mongocxx::v_noabi::collection &c, const bsoncxx::v_noabi::types::value id)
{
	bsoncxx::stdx::optional<bsoncxx::document::value> res = 
			bsoncxx::builder::stream::document{}
			<<"_id"<<id<<bsoncxx::builder::stream::finalize;
	if(!res) return;
	
	auto doc = res->view();
	bsoncxx::stdx::string_view v = doc["key"].get_utf8();
	cout<<"key == " << v <<endl;
	v = doc["key2"].get_utf8();
	cout<<"key2 == " << v <<endl;
	
	for(int i=0;i<3;++i)
		if(doc["arr"][i].type()==bsoncxx::type::k_int32)
			cout<< "arr["<<i<<"] = "<<doc["arr"][i].get_int32().value <<endl;
	
	v = doc["sub"]["k"].get_utf8();
	cout<<"sub.k == " << v <<endl;
	if(!doc["sub2"])
		cout<<"failed sub2 doesnt exist" <<endl;
	bsoncxx::array::view arr2{doc["arr2"].get_array().value};
	cout<<std::distance(arr2.begin(),arr2.end()) <<endl;
	for(bsoncxx::array::element ele : arr2){
		v = ele.get_utf8();
		cout<<"array ellement : "<<v<<endl;
	}
}

core::v1::optional<mongocxx::v_noabi::result::insert_many>
add_many(mongocxx::v_noabi::collection &collection)
{
	vector<bsoncxx::document::value> docs;
	for (int i=0;i<10;++i)
		docs.push_back(bsoncxx::builder::stream::document{}
						<<"type" << "ki"<<"k"<<i <<bsoncxx::builder::stream::finalize);
	return collection.insert_many(docs);
}

void update_one(mongocxx::v_noabi::collection &collection)
{
	cout<<"changing 4 to 110"<<endl;
	collection.update_one(bsoncxx::builder::stream::document{} << "k"<<4
		<<bsoncxx::builder::stream::finalize,
		bsoncxx::builder::stream::document{} <<"$set"
			<<bsoncxx::builder::stream::open_document <<"k"<<110
			<<bsoncxx::builder::stream::close_document
									<<bsoncxx::builder::stream::finalize);
}

void print_some(mongocxx::v_noabi::collection &collection)
{
	cout<<" here are docs >5 && <=9"<<endl;
	auto cursor = collection.find(bsoncxx::builder::stream::document{}
		<<"k"<<bsoncxx::builder::stream::open_document << "$gt"<<5<<"$lt"<<9
		<<bsoncxx::builder::stream::close_document << bsoncxx::builder::stream::finalize);
	for (auto doc : cursor)
		cout<<bsoncxx::to_json(doc)<<endl;
}

void delete_where_typeki(mongocxx::v_noabi::collection &collection)
{
	collection.delete_many(bsoncxx::builder::stream::document{}
		<<"type"
		<<"ki"
		<<bsoncxx::builder::stream::finalize);
}

void printAllItems(const cse411::Set &set)
{
	for (int i=0;i<set.item_size();++i)
	{
		const cse411::Item &item = set.item(i);
		cout<<"num: "<<item.num()<<endl;
	}
}

void readItemFromCin(cse411::Item *item)
{
	cout<<"make a random integer and add it"<<endl;
	int id = rand()%10;
	item->set_num(id);
}

int main( int argc, char* argv[])
{
	cout<<"12324546768890"<<endl;
	string username = "admin";
	string password = "admin1";
	
	mongocxx::instance inst{};
    mongocxx::client conn{mongocxx::uri{
		"mongodb://"+username+":"+password+"@ds129484.mlab.com:29484/cse411"
	}};

    auto db = conn["cse411"];
	mongocxx::collection coll = db["something_something"];
	
	//insert_simple_document(coll);
	//auto res = insert_complex_document(coll);
	
	//add_many(coll);
	
	//print_all(coll);
	//update_one(coll);
	//print_all(coll);
	//print_some(coll);
	//print_details(coll,res->inserted_id());
	
	//delete_where_typeki(coll);
    
	//insert_simple_document(coll);
	
	print_all(coll);
	
	
	
	/*
	*proto_buf part
	*/
	GOOGLE_PROTOBUF_VERIFY_VERSION;
	
	//make a set of item
	cse411::Set set;
	
	ifstream input("test_file",ios::in|ios::binary);
	if(!input) cout<<"failed to read the file"<<endl;
	else if(!set.ParseFromIstream(&input))
		cout<<"failed to parse the set file"<<endl;
	
	readItemFromCin(set.add_item());
	ofstream output("test_file",ios::out| ios::trunc | ios::binary);
	
	if(!set.SerializeToOstream(&output))
	{
		cout<<"failed to write"<<endl;
		return -1;
	}
	
	printAllItems(set);
	google::protobuf::ShutdownProtobufLibrary();
	
	return 0;
	
}
