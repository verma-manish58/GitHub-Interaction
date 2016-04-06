//
//  OpenIssues.h
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface OpenIssues : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, assign) id milestone;
@property (nonatomic, assign) BOOL locked;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *eventsUrl;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *commentsUrl;
@property (nonatomic, assign) id assignee;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) double openIssuesIdentifier;
@property (nonatomic, assign) double number;
@property (nonatomic, strong) NSString *repositoryUrl;
@property (nonatomic, strong) User *user;
@property (nonatomic, assign) id closedAt;
@property (nonatomic, strong) NSString *labelsUrl;
@property (nonatomic, assign) double comments;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *htmlUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
