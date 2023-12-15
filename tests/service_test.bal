import ballerina/http;
import ballerina/test;
import ballerinax/twilio;

http:Client testClient = check new ("http://localhost:9090");


// Test function

@test:Config {}
function testService() returns error? {
    twilio:SmsResponse response = check testClient->/sms/notify.post(toMobile="%2B94783771983" ,text ="test%20message",message = "");
    test:assertEquals(response.status, "queued");
}

