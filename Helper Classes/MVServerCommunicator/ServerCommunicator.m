//
//  ServerCommunicator.m
//   
//
//  Created by Manish on 20/06/13.
//  Copyright (c) 2013 Manish. All rights reserved.
//

#import "ServerCommunicator.h"

//after server changed
#define oClientBaseURLString @"https://api.github.com"


@implementation ServerCommunicator
    
static ServerCommunicator *shared;

////////////////////////////////////////////////////////////////////////
+ (instancetype)sharedClient
{
    static ServerCommunicator *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ServerCommunicator alloc] initWithBaseURL:[NSURL URLWithString:oClientBaseURLString]];
    });
    
    return _sharedClient;
}

////////////////////////////////////////////////////////////////////////
- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self)
    {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}


+ (instancetype)sharedClientWithURL:(NSString*)baseURL
{
    static ServerCommunicator *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ServerCommunicator alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    
    return _sharedClient;
}

+ (instancetype)sharedClientWithURL:(NSString*)baseURL andResponseType:(RESPONSE_TYPE)responseType
{
    static ServerCommunicator *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ServerCommunicator alloc] initWithBaseURL:[NSURL URLWithString:baseURL] andResponseType:responseType];
    });
    
    return _sharedClient;
}

////////////////////////////////////////////////////////////////////////
- (id)initWithBaseURL:(NSURL *)url andResponseType:(RESPONSE_TYPE)responseType
{
    self = [super initWithBaseURL:url];
    
    if (self)
    {
        
        
        //to use when request is in JSON format
        self.requestSerializer  = [AFJSONRequestSerializer serializer];
        
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        if (responseType == RESPONSE_TYPE_JSON)
            //to use when response is in JSON format
            self.responseSerializer = [AFJSONResponseSerializer serializer];
        
    }
    
    
    return self;
}


-(void)GetDataForMethod:(NSString *)strMethodName parameters:(NSDictionary *)dicOfParameters withCompletion:(void (^)(id data))completion WithFailure:(void (^)(NSString *error))failure
{
//    [DejalActivityView activityViewForView:APPDELEGATE.window];
    
//    [SVProgressHUD showInfoWithStatus:@"Loading..."];
    
    [DejalBezelActivityView activityViewForView:APPDELEGATE.window];
    
    [self POST:strMethodName parameters:dicOfParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion)
        {
            if ([responseObject isKindOfClass:[NSDictionary class]])
            {
                if([[responseObject objectForKey:@"status"] isKindOfClass:[NSString class]])
                {
                    if ([[responseObject objectForKey:@"responsecode"] intValue] == 0 )
                    {
                        
                        completion(responseObject);
                    }
                    else
                    {
                        failure([responseObject objectForKey:@"status"]);
                    }
                }
                else
                    completion(responseObject);
            }
            else
                completion(responseObject);
            
            [DejalBezelActivityView removeView];
        };
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        if (failure)
        {
             [DejalBezelActivityView removeView];
            failure(error.localizedDescription);
        }
    }];
}

@end