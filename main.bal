import ballerina/http;
import ballerina/io;

listener http:Listener ep0 = new (9090);

service /subscriptions on ep0 {

    resource function post register\-aws\-subscription(http:Request request) returns string|http:ClientError? {
        io:println("Received");
        map<string> formParams = check request.getFormParams();
        io:println(formParams);
        string? abcVlaue = formParams["abc"];
        if abcVlaue is string {
            io:println("abc Value ", abcVlaue);
        } else {
            io:println("No abc value found");
        }
        return "suceess";
    }

    resource function post create\-component(http:Request request) returns json|http:ClientError? {
        json m = {"componentId": 1234, "componentName": "test-component", "type": "service"};
        return m;
    }

}
