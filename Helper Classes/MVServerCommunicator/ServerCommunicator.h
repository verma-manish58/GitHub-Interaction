//
//  ServerCommunicator.h
//   
//
//  Created by Manish on 20/06/13.
//  Copyright (c) 2013 Manish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"


typedef enum RESPONSE_TYPE
{
    RESPONSE_TYPE_JSON = 0,
    RESPONSE_TYPE_XML,
    
}RESPONSE_TYPE;


typedef enum REQUEST_TYPE
{
    REQUEST_TYPE_JSON = 0,
    REQUEST_TYPE_XML,
    
}REQUEST_TYPE;

@interface ServerCommunicator : AFHTTPRequestOperationManager
{
    
}
- (id)initWithBaseURL:(NSURL *)url andResponseType:(RESPONSE_TYPE)responseType;
+ (instancetype)sharedClient;

+ (instancetype)sharedClientWithURL:(NSString*)baseURL;

+ (instancetype)sharedClientWithURL:(NSString*)baseURL andResponseType:(RESPONSE_TYPE)responseType;

-(void)GetDataForMethod:(NSString *)strMethodName parameters:(NSDictionary *)dicOfParameters withCompletion:(void (^)(id data))completion WithFailure:(void (^)(NSString *error))failure;

@end