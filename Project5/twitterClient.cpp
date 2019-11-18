#include "twitterClient.h"
#include <iostream>
#include <fstream>

using namespace std;

/*
* search_tags, search through latest trends of tweets
*@param username of API
*@param password for API
*@param string for tags to search
*@param number of queries to return
*/
string twitterClient::search_tags( string userName, string passWord,string queryStr, string limitStr )
{
    

    twitCurl twitterObj;
    std::string tmpStr, tmpStr2;
    std::string replyMsg;
    char tmpBuf[1024];

    /* Set twitter username and password */
    twitterObj.setTwitterUsername( userName );
    twitterObj.setTwitterPassword( passWord );

    /* Set proxy server usename, password, IP and port (if present) */
    /*memset( tmpBuf, 0, 1024 );
    printf( "\nDo you have a proxy server configured (0 for no; 1 for yes): " );
    fgets( tmpBuf, sizeof( tmpBuf ), stdin );
    tmpStr = tmpBuf;
    if( std::string::npos != tmpStr.find( "1" ) )
    {
        memset( tmpBuf, 0, 1024 );
        printf( "\nEnter proxy server IP: " );
        fgets( tmpBuf, sizeof( tmpBuf ), stdin );
        tmpStr = tmpBuf;
        twitterObj.setProxyServerIp( tmpStr );

        memset( tmpBuf, 0, 1024 );
        printf( "\nEnter proxy server port: " );
        fgets( tmpBuf, sizeof( tmpBuf ), stdin );
        tmpStr = tmpBuf;
        twitterObj.setProxyServerPort( tmpStr );

        memset( tmpBuf, 0, 1024 );
        printf( "\nEnter proxy server username: " );
        fgets( tmpBuf, sizeof( tmpBuf ), stdin );
        tmpStr = tmpBuf;
        twitterObj.setProxyUserName( tmpStr );

        memset( tmpBuf, 0, 1024 );
        printf( "\nEnter proxy server password: " );
        fgets( tmpBuf, sizeof( tmpBuf ), stdin );
        tmpStr = tmpBuf;
        twitterObj.setProxyPassword( tmpStr );
    }*/

    /* OAuth flow begins */
    /* Step 0: Set OAuth related params. These are got by registering your app at twitter.com */
    //twitterObj.getOAuth().setConsumerKey( std::string( "2Kdg60HDmZEu2NXIp7MRMBQIm" ) );
    //twitterObj.getOAuth().setConsumerSecret( std::string( "IQcdiWnJd1bsWHytbLmSZa4aNxlPJ5Jr9ZjwOPjiDp31Tyactn" ) );
	twitterObj.getOAuth().setConsumerKey( std::string( "7xJMWERz7O0Jo8rB36Nb66RPG" ) );
    twitterObj.getOAuth().setConsumerSecret( std::string( "pMdK5InSTafJD57MAvNcLg12St9lTLjuBE1sfOxsWsEZtZcIl2" ) );

    /* Step 1: Check if we alredy have OAuth access token from a previous run */
    std::string myOAuthAccessTokenKey("");
    std::string myOAuthAccessTokenSecret("");
    std::ifstream oAuthTokenKeyIn;
    std::ifstream oAuthTokenSecretIn;

    oAuthTokenKeyIn.open( "twitterClient_token_key.txt" );
    oAuthTokenSecretIn.open( "twitterClient_token_secret.txt" );

    memset( tmpBuf, 0, 1024 );
    oAuthTokenKeyIn >> tmpBuf;
	//std::cout<<tmpBuf<<"---"<<std::endl;
    myOAuthAccessTokenKey = tmpBuf;

    memset( tmpBuf, 0, 1024 );
    oAuthTokenSecretIn >> tmpBuf;
    myOAuthAccessTokenSecret = tmpBuf;

    oAuthTokenKeyIn.close();
    oAuthTokenSecretIn.close();

    if( myOAuthAccessTokenKey.size() && myOAuthAccessTokenSecret.size() )
    {
        /* If we already have these keys, then no need to go through auth again */
        printf( "\nUsing:\nKey: %s\nSecret: %s\n\n", myOAuthAccessTokenKey.c_str(), myOAuthAccessTokenSecret.c_str() );

        twitterObj.getOAuth().setOAuthTokenKey( myOAuthAccessTokenKey );
        twitterObj.getOAuth().setOAuthTokenSecret( myOAuthAccessTokenSecret );
    }
    else
    {
        /* Step 2: Get request token key and secret */
        std::string authUrl;
        twitterObj.oAuthRequestToken( authUrl );

        /* Step 3: Get PIN  */
        /*memset( tmpBuf, 0, 1024 );
        printf( "\nDo you want to visit twitter.com for PIN (0 for no; 1 for yes): " );
        fgets( tmpBuf, sizeof( tmpBuf ), stdin );
        tmpStr = tmpBuf;
        if( std::string::npos != tmpStr.find( "1" ) )
        {
            // Ask user to visit twitter.com auth page and get PIN 
            memset( tmpBuf, 0, 1024 );
            printf( "\nPlease visit this link in web browser and authorize this application:\n%s", authUrl.c_str() );
            printf( "\nEnter the PIN provided by twitter: " );
            fgets( tmpBuf, sizeof( tmpBuf ), stdin );
            tmpStr = tmpBuf;
            twitterObj.getOAuth().setOAuthPin( tmpStr );
        }
        else
        {
            // Else, pass auth url to twitCurl and get it via twitCurl PIN handling 
            twitterObj.oAuthHandlePIN( authUrl );
        } */

        /* Step 4: Exchange request token with access token */
        twitterObj.oAuthAccessToken();

        /* Step 5: Now, save this access token key and secret for future use without PIN */
        twitterObj.getOAuth().getOAuthTokenKey( myOAuthAccessTokenKey );
        twitterObj.getOAuth().getOAuthTokenSecret( myOAuthAccessTokenSecret );

        /* Step 6: Save these keys in a file or wherever */
        std::ofstream oAuthTokenKeyOut;
        std::ofstream oAuthTokenSecretOut;

        oAuthTokenKeyOut.open( "twitterClient_token_key.txt" );
        oAuthTokenSecretOut.open( "twitterClient_token_secret.txt" );

        oAuthTokenKeyOut.clear();
        oAuthTokenSecretOut.clear();

        oAuthTokenKeyOut << myOAuthAccessTokenKey.c_str();
        oAuthTokenSecretOut << myOAuthAccessTokenSecret.c_str();

        oAuthTokenKeyOut.close();
        oAuthTokenSecretOut.close();
    }
    /* OAuth flow ends */

    /* Account credentials verification */
    if( twitterObj.accountVerifyCredGet() )
    {
        twitterObj.getLastWebResponse( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::accountVerifyCredGet web response:\n%s\n", replyMsg.c_str() );
    }
    else
    {
        twitterObj.getLastCurlError( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::accountVerifyCredGet error:\n%s\n", replyMsg.c_str() );
    }

    /* Get followers' ids */
    std::string nextCursor("");
    std::string searchUser("nextbigwhat");
    do
    {
        if( twitterObj.followersIdsGet( nextCursor, searchUser ) )
        {
            twitterObj.getLastWebResponse( replyMsg );
            //printf( "\ntwitterClient:: twitCurl::followersIdsGet for user [%s] web response:\n%s\n",searchUser.c_str(), replyMsg.c_str() );

            // JSON: "next_cursor":1422208797779779359,
            nextCursor = "";
            size_t nNextCursorStart = replyMsg.find("next_cursor");
            if( std::string::npos == nNextCursorStart )
            {
                nNextCursorStart += strlen("next_cursor:\"");
                size_t nNextCursorEnd = replyMsg.substr(nNextCursorStart).find(",");
                if( std::string::npos != nNextCursorEnd )
                {
                    nextCursor = replyMsg.substr(nNextCursorStart, (nNextCursorEnd - nNextCursorStart));
                    //printf("\nNEXT CURSOR: %s\n\n\n\n\n", nextCursor.c_str());
                }
            }
        }
        else {
            twitterObj.getLastCurlError( replyMsg );
            printf( "\ntwitterClient:: twitCurl::followersIdsGet error:\n%s\n", replyMsg.c_str() );
            break;
        }
    } while( !nextCursor.empty() && nextCursor.compare("0") );

    /* Get block list */
    nextCursor = "";
    if( twitterObj.blockListGet( nextCursor, false, false ) )
    {
        twitterObj.getLastWebResponse( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::blockListGet web response:\n%s\n", replyMsg.c_str() );
    }
    else
    {
        twitterObj.getLastCurlError( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::blockListGet error:\n%s\n", replyMsg.c_str() );
    }

    /* Get blocked ids */
    nextCursor = "";
    if( twitterObj.blockIdsGet( nextCursor, true ) )
    {
        twitterObj.getLastWebResponse( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::blockIdsGet web response:\n%s\n", replyMsg.c_str() );
    }
    else
    {
        twitterObj.getLastCurlError( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::blockIdsGet error:\n%s\n", replyMsg.c_str() );
    }

    /* Post a new status message */
    /*memset( tmpBuf, 0, 1024 );
    printf( "\nEnter a new status message: " );
    fgets( tmpBuf, sizeof( tmpBuf ), stdin );
    tmpStr = tmpBuf;
    replyMsg = "";
    if( twitterObj.statusUpdate( tmpStr ) )
    {
        twitterObj.getLastWebResponse( replyMsg );
        printf( "\ntwitterClient:: twitCurl::statusUpdate web response:\n%s\n", replyMsg.c_str() );
    }
    else
    {
        twitterObj.getLastCurlError( replyMsg );
        printf( "\ntwitterClient:: twitCurl::statusUpdate error:\n%s\n", replyMsg.c_str() );
    }
	*/
    /* Post a new reply */
	/*
    memset( tmpBuf, 0, 1024 );
    printf( "\nEnter message id to reply to : " );
    fgets( tmpBuf, sizeof( tmpBuf ), stdin );
    tmpStr2 = tmpBuf;
    memset( tmpBuf, 0, 1024 );
    printf( "\nEnter a reply message: " );
    fgets( tmpBuf, sizeof( tmpBuf ), stdin );
    tmpStr = tmpBuf;
    replyMsg = "";
    if( twitterObj.statusUpdate( tmpStr, tmpStr2 ) )
    {
        twitterObj.getLastWebResponse( replyMsg );
        printf( "\ntwitterClient:: twitCurl::statusUpdate web response:\n%s\n", replyMsg.c_str() );
    }
    else
    {
        twitterObj.getLastCurlError( replyMsg );
        printf( "\ntwitterClient:: twitCurl::statusUpdate error:\n%s\n", replyMsg.c_str() );
    }
	*/
	
    /* Search a string */
    /*printf( "\nEnter string to search: " );
    memset( tmpBuf, 0, 1024 );
    fgets( tmpBuf, sizeof( tmpBuf ), stdin );
	tmpBuf[strcspn(tmpBuf, "\r\n")] = 0; // remove newline
    tmpStr = tmpBuf;
    printf( "\nLimit search results to: " );
    memset( tmpBuf, 0, 1024 );
    fgets( tmpBuf, sizeof( tmpBuf ), stdin );
	tmpBuf[strcspn(tmpBuf, "\r\n")] = 0; // remove newline
    tmpStr2 = tmpBuf;*/
    replyMsg = "";
	
	
    if( twitterObj.search( queryStr, limitStr ) )
    {
        twitterObj.getLastWebResponse( replyMsg );
        //printf( "\ntwitterClient:: twitCurl::search web response:\n%s\n", replyMsg.c_str() );
    }
    else
    {
        twitterObj.getLastCurlError( replyMsg );
        printf( "\ntwitterClient:: twitCurl::search error:\n%s\n", replyMsg.c_str() );
    }
	
	
	
	//remove beginning and ending part of json file to make it like an array
	std::size_t found = replyMsg.find("[");
	std::size_t found2 = replyMsg.find_last_of("]");
	std::string replyMsg2 = replyMsg.substr(found,found2-found+1);
	
	
	std::ofstream myfile;
	myfile.open ("output.json");
	myfile << replyMsg2;
	myfile.close();


    return replyMsg2;
}
