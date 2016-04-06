//
//  IssuesComments.h
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface IssuesComments : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double issuesCommentsIdentifier;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *issueUrl;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) User *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
