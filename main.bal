import ballerina/http;
import ballerina/io;

listener http:Listener ep0 = new (9090);

service /subscriptions on ep0 {

    resource function post register\-aws\-subscription(http:Request request) returns http:PermanentRedirect|http:ClientError? {
        io:println("Received");
        map<string> formParams = check request.getFormParams();
        io:println(formParams);
        string? marketplaceToken = formParams["x-amzn-marketplace-token"];
        if marketplaceToken is string {
            io:println("Marketplace token ", marketplaceToken);
        } else {
            io:println("Marketplace token found");
        }
        return {
            headers: {
                "Location": "https://google.com"
            }
        };
    }

    resource function post create\-component(http:Request request) returns json|http:ClientError? {
        json m = {"componentId": 1234, "componentName": "test-component", "type": "service"};
        return m;
    }

}
