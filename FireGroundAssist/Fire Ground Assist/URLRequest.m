//  URLRequest.m
//  Copyright 2011 __MyCompanyName__. All rights reserved.

#import "URLRequest.h"


@implementation URLRequest
@synthesize address;
@synthesize delegate;

- (id)initWithAddress:(NSString *)a parameters:(NSDictionary *)p
{
    self = [super init];
    if (self){
        address = [a retain];
        
        responseData = nil; urlConnection = nil;
        urlRequest = [[NSMutableURLRequest alloc] init];
        [urlRequest setHTTPMethod:@"POST"];
        if (p != nil) {
            NSString *postParameters = @"";
            NSArray *keys = [p allKeys];
            for (NSString *k in keys){
                postParameters = [postParameters stringByAppendingString:k];
                postParameters = [postParameters stringByAppendingString:@"="];
                postParameters = [postParameters stringByAppendingString:[p objectForKey:k]];
                postParameters = [postParameters stringByAppendingString:@"&"];
            }
            postParameters = [postParameters stringByAppendingString:@"none=none"]; //trailing parameter, serves no purpose but to end the string properly (key=value&key=value&none=none)
            [urlRequest setHTTPBody:[postParameters dataUsingEncoding:NSUTF8StringEncoding]];
        }
        [urlRequest setURL:[NSURL URLWithString:address]];
    }
    return self;
}

- (void)dealloc
{
    [urlRequest release];
    if (urlConnection != nil){ [urlConnection release]; }
    [address release];
    [super dealloc];
}

- (void)sendRequest
{
    if (urlConnection==nil){
        urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        if (urlConnection){
            
        }
        else{ [delegate requestData:nil]; }
    }
}

- (void)setHttpMethod:(NSString *)m
{
    [urlRequest setHTTPMethod:m];
}

- (void)cancel
{
    [urlConnection cancel];
    [urlConnection release]; urlConnection = nil;
    
}

- (void)clear
{
    if (address != nil){
        [address release]; address = nil;
    }
    if (responseData!=nil){
        [responseData release]; responseData = nil;
    }
    if (urlConnection != nil){
        [urlConnection release]; urlConnection = nil;
    }
    if (urlRequest != nil){
        [urlRequest release]; urlRequest = nil;
        urlRequest = [[NSMutableURLRequest alloc] init];
        [urlRequest setHTTPMethod:@"POST"];
    }
}

#pragma mark -
#pragma mark URLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"URL REQEUST - connection didReceiveResponse:");
    if (responseData==nil){
        responseData = [[NSMutableData alloc] init];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSLog(@"URL REQEUST - connection didReceiveData: %d", responseData.length);
	[responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"URL REQEUST - connectionDidFinishLoading");
    NSData *data = [responseData copy];
//    [delegate requestData:[data autorelease]]; 
    [delegate requestData:[NSArray arrayWithObjects:address, [data autorelease], nil]];
	[responseData release]; responseData = nil;
    [urlConnection release]; urlConnection = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"URL REQEUST - connection didFailWithError: %@", [error localizedDescription]);
    [delegate requestData:nil];
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

@end
