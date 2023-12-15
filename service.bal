import ballerina/http;
import ballerina/log;
import ballerinax/twilio;
<<<<<<< HEAD
import ballerina/http;
import ballerina/io;
=======
>>>>>>> c5576e7df050d756916e3567b6c3e9919e52b5a1

configurable string fromMobile = ?;
configurable string accountSId = ?;
configurable string authToken = ?;

service /sms on new http:Listener(9090) {
<<<<<<< HEAD
    resource function post notify(string toMobile,string text) returns twilio:SmsResponse|error{
         //Twilio Client configuration
=======
    resource function post notify(string toMobile, string message) returns error? {
        //Twilio Client configuration
>>>>>>> c5576e7df050d756916e3567b6c3e9919e52b5a1
        twilio:ConnectionConfig twilioConfig = {
            twilioAuth: {
                accountSId: accountSId,
                authToken: authToken
            }
        };

        //Twilio Client
        twilio:Client twilioClient = check new (twilioConfig);

        //Send SMS remote function is called by the twilio client
<<<<<<< HEAD
        twilio:SmsResponse response = check twilioClient->sendSms(fromMobile, toMobile, text);
        log:printInfo("SMS_SID: " + response.sid.toString() + ", Body: " + response.body.toString());
        io:println(response.toString());
        return  response;
=======
        twilio:SmsResponse response = check twilioClient->sendSms(fromMobile, toMobile, message);
        log:printInfo("SMS_SID: " + response.sid.toString() + ", Body: " + response.body.toString());
    }

    resource function get liveness() returns http:Ok {
        return http:OK;
>>>>>>> c5576e7df050d756916e3567b6c3e9919e52b5a1
    }
}
