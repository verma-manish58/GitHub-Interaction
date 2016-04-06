//
//  Repository.h
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Owner, Permissions;

@interface Repository : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *keysUrl;
@property (nonatomic, strong) NSString *statusesUrl;
@property (nonatomic, strong) NSString *issuesUrl;
@property (nonatomic, strong) NSString *defaultBranch;
@property (nonatomic, strong) NSString *issueEventsUrl;
@property (nonatomic, assign) double repositoryIdentifier;
@property (nonatomic, strong) Owner *owner;
@property (nonatomic, strong) NSString *eventsUrl;
@property (nonatomic, strong) NSString *subscriptionUrl;
@property (nonatomic, assign) double watchers;
@property (nonatomic, strong) NSString *gitCommitsUrl;
@property (nonatomic, strong) NSString *subscribersUrl;
@property (nonatomic, strong) NSString *cloneUrl;
@property (nonatomic, assign) BOOL hasWiki;
@property (nonatomic, strong) NSString *pullsUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) BOOL fork;
@property (nonatomic, strong) NSString *notificationsUrl;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic, strong) NSString *collaboratorsUrl;
@property (nonatomic, strong) NSString *deploymentsUrl;
@property (nonatomic, strong) NSString *languagesUrl;
@property (nonatomic, assign) BOOL hasIssues;
@property (nonatomic, strong) NSString *commentsUrl;
@property (nonatomic, assign) BOOL privateProperty;
@property (nonatomic, assign) double size;
@property (nonatomic, strong) NSString *gitTagsUrl;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *sshUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *archiveUrl;
@property (nonatomic, strong) Permissions *permissions;
@property (nonatomic, assign) double openIssuesCount;
@property (nonatomic, strong) NSString *blobsUrl;
@property (nonatomic, strong) NSString *contributorsUrl;
@property (nonatomic, strong) NSString *milestonesUrl;
@property (nonatomic, strong) NSString *contentsUrl;
@property (nonatomic, assign) double forksCount;
@property (nonatomic, strong) NSString *treesUrl;
@property (nonatomic, assign) id mirrorUrl;
@property (nonatomic, assign) BOOL hasDownloads;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *forksUrl;
@property (nonatomic, strong) NSString *svnUrl;
@property (nonatomic, strong) NSString *commitsUrl;
@property (nonatomic, strong) NSString *homepage;
@property (nonatomic, strong) NSString *teamsUrl;
@property (nonatomic, strong) NSString *branchesUrl;
@property (nonatomic, strong) NSString *issueCommentUrl;
@property (nonatomic, strong) NSString *mergesUrl;
@property (nonatomic, strong) NSString *gitRefsUrl;
@property (nonatomic, strong) NSString *gitUrl;
@property (nonatomic, assign) double forks;
@property (nonatomic, assign) double openIssues;
@property (nonatomic, strong) NSString *hooksUrl;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, strong) NSString *releasesUrl;
@property (nonatomic, strong) NSString *assigneesUrl;
@property (nonatomic, strong) NSString *stargazersUrl;
@property (nonatomic, assign) double stargazersCount;
@property (nonatomic, assign) BOOL hasPages;
@property (nonatomic, strong) NSString *compareUrl;
@property (nonatomic, strong) NSString *tagsUrl;
@property (nonatomic, assign) double watchersCount;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *pushedAt;
@property (nonatomic, strong) NSString *labelsUrl;
@property (nonatomic, strong) NSString *downloadsUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
