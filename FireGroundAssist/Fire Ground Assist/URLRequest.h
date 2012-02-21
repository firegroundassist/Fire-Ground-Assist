//  URLRequest.h
//  Copyright 2011 __MyCompanyName__. All rights reserved.

#import <Foundation/Foundation.h>

@protocol URLRequestDelegate <NSObject>
- (void)requestData:(NSArray *)pkg; //returns [address, data]
@end


@interface URLRequest : NSObject {
    NSString *address;
    
    NSMutableURLRequest *urlRequest;
    NSMutableData *responseData;
    NSURLConnection *urlConnection;
    
    id delegate;
}

- (id)initWithAddress:(NSString *)a parameters:(NSDictionary *)p;
- (void)sendRequest;
- (void)setHttpMethod:(NSString *)m;
- (void)clear;
- (void)cancel;
@property (retain, nonatomic) NSString *address;
@property (assign)id delegate;
@end
