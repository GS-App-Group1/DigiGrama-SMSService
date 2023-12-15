import ballerina/http;
import ballerina/log;
import ballerinax/twilio;

configurable string fromMobile = ?;
configurable string accountSId = ?;
configurable string authToken = ?;

service /sms on new http:Listener(9090) {

    resource function post notify(string toMobile,string text) returns twilio:SmsResponse|error{
         //Twilio Client configuration
        twilio:ConnectionConfig twilioConfig = {
            twilioAuth: {
                accountSId: accountSId,
                authToken: authToken
            }
        };

        //Twilio Client
        twilio:Client twilioClient = check new (twilioConfig);

        //Send SMS remote function is called by the twilio client

        twilio:SmsResponse response = check twilioClient->sendSms(fromMobile, toMobile, text);
        log:printInfo("SMS_SID: " + response.sid.toString() + ", Body: " + response.body.toString());
        return  response;
    }

    resource function get liveness() returns http:Ok {
        return http:OK;
    }
}
