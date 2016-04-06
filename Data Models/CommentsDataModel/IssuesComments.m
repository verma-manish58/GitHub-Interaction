//
//  IssuesComments.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "IssuesComments.h"
#import "User.h"


NSString *const kIssuesCommentsUrl = @"url";
NSString *const kIssuesCommentsId = @"id";
NSString *const kIssuesCommentsHtmlUrl = @"html_url";
NSString *const kIssuesCommentsCreatedAt = @"created_at";
NSString *const kIssuesCommentsIssueUrl = @"issue_url";
NSString *const kIssuesCommentsUpdatedAt = @"updated_at";
NSString *const kIssuesCommentsBody = @"body";
NSString *const kIssuesCommentsUser = @"user";


@interface IssuesComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IssuesComments

@synthesize url = _url;
@synthesize issuesCommentsIdentifier = _issuesCommentsIdentifier;
@synthesize htmlUrl = _htmlUrl;
@synthesize createdAt = _createdAt;
@synthesize issueUrl = _issueUrl;
@synthesize updatedAt = _updatedAt;
@synthesize body = _body;
@synthesize user = _user;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kIssuesCommentsUrl fromDictionary:dict];
            self.issuesCommentsIdentifier = [[self objectOrNilForKey:kIssuesCommentsId fromDictionary:dict] doubleValue];
            self.htmlUrl = [self objectOrNilForKey:kIssuesCommentsHtmlUrl fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kIssuesCommentsCreatedAt fromDictionary:dict];
            self.issueUrl = [self objectOrNilForKey:kIssuesCommentsIssueUrl fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kIssuesCommentsUpdatedAt fromDictionary:dict];
            self.body = [self objectOrNilForKey:kIssuesCommentsBody fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kIssuesCommentsUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kIssuesCommentsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.issuesCommentsIdentifier] forKey:kIssuesCommentsId];
    [mutableDict setValue:self.htmlUrl forKey:kIssuesCommentsHtmlUrl];
    [mutableDict setValue:self.createdAt forKey:kIssuesCommentsCreatedAt];
    [mutableDict setValue:self.issueUrl forKey:kIssuesCommentsIssueUrl];
    [mutableDict setValue:self.updatedAt forKey:kIssuesCommentsUpdatedAt];
    [mutableDict setValue:self.body forKey:kIssuesCommentsBody];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kIssuesCommentsUser];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.url = [aDecoder decodeObjectForKey:kIssuesCommentsUrl];
    self.issuesCommentsIdentifier = [aDecoder decodeDoubleForKey:kIssuesCommentsId];
    self.htmlUrl = [aDecoder decodeObjectForKey:kIssuesCommentsHtmlUrl];
    self.createdAt = [aDecoder decodeObjectForKey:kIssuesCommentsCreatedAt];
    self.issueUrl = [aDecoder decodeObjectForKey:kIssuesCommentsIssueUrl];
    self.updatedAt = [aDecoder decodeObjectForKey:kIssuesCommentsUpdatedAt];
    self.body = [aDecoder decodeObjectForKey:kIssuesCommentsBody];
    self.user = [aDecoder decodeObjectForKey:kIssuesCommentsUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kIssuesCommentsUrl];
    [aCoder encodeDouble:_issuesCommentsIdentifier forKey:kIssuesCommentsId];
    [aCoder encodeObject:_htmlUrl forKey:kIssuesCommentsHtmlUrl];
    [aCoder encodeObject:_createdAt forKey:kIssuesCommentsCreatedAt];
    [aCoder encodeObject:_issueUrl forKey:kIssuesCommentsIssueUrl];
    [aCoder encodeObject:_updatedAt forKey:kIssuesCommentsUpdatedAt];
    [aCoder encodeObject:_body forKey:kIssuesCommentsBody];
    [aCoder encodeObject:_user forKey:kIssuesCommentsUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    IssuesComments *copy = [[IssuesComments alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.issuesCommentsIdentifier = self.issuesCommentsIdentifier;
        copy.htmlUrl = [self.htmlUrl copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.issueUrl = [self.issueUrl copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
