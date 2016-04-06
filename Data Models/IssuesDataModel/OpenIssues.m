//
//  OpenIssues.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "OpenIssues.h"
#import "User.h"


NSString *const kOpenIssuesLabels = @"labels";
NSString *const kOpenIssuesMilestone = @"milestone";
NSString *const kOpenIssuesLocked = @"locked";
NSString *const kOpenIssuesTitle = @"title";
NSString *const kOpenIssuesUrl = @"url";
NSString *const kOpenIssuesEventsUrl = @"events_url";
NSString *const kOpenIssuesUpdatedAt = @"updated_at";
NSString *const kOpenIssuesCommentsUrl = @"comments_url";
NSString *const kOpenIssuesAssignee = @"assignee";
NSString *const kOpenIssuesState = @"state";
NSString *const kOpenIssuesBody = @"body";
NSString *const kOpenIssuesId = @"id";
NSString *const kOpenIssuesNumber = @"number";
NSString *const kOpenIssuesRepositoryUrl = @"repository_url";
NSString *const kOpenIssuesUser = @"user";
NSString *const kOpenIssuesClosedAt = @"closed_at";
NSString *const kOpenIssuesLabelsUrl = @"labels_url";
NSString *const kOpenIssuesComments = @"comments";
NSString *const kOpenIssuesCreatedAt = @"created_at";
NSString *const kOpenIssuesHtmlUrl = @"html_url";


@interface OpenIssues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OpenIssues

@synthesize labels = _labels;
@synthesize milestone = _milestone;
@synthesize locked = _locked;
@synthesize title = _title;
@synthesize url = _url;
@synthesize eventsUrl = _eventsUrl;
@synthesize updatedAt = _updatedAt;
@synthesize commentsUrl = _commentsUrl;
@synthesize assignee = _assignee;
@synthesize state = _state;
@synthesize body = _body;
@synthesize openIssuesIdentifier = _openIssuesIdentifier;
@synthesize number = _number;
@synthesize repositoryUrl = _repositoryUrl;
@synthesize user = _user;
@synthesize closedAt = _closedAt;
@synthesize labelsUrl = _labelsUrl;
@synthesize comments = _comments;
@synthesize createdAt = _createdAt;
@synthesize htmlUrl = _htmlUrl;


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
            self.labels = [self objectOrNilForKey:kOpenIssuesLabels fromDictionary:dict];
            self.milestone = [self objectOrNilForKey:kOpenIssuesMilestone fromDictionary:dict];
            self.locked = [[self objectOrNilForKey:kOpenIssuesLocked fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kOpenIssuesTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kOpenIssuesUrl fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:kOpenIssuesEventsUrl fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kOpenIssuesUpdatedAt fromDictionary:dict];
            self.commentsUrl = [self objectOrNilForKey:kOpenIssuesCommentsUrl fromDictionary:dict];
            self.assignee = [self objectOrNilForKey:kOpenIssuesAssignee fromDictionary:dict];
            self.state = [self objectOrNilForKey:kOpenIssuesState fromDictionary:dict];
            self.body = [self objectOrNilForKey:kOpenIssuesBody fromDictionary:dict];
            self.openIssuesIdentifier = [[self objectOrNilForKey:kOpenIssuesId fromDictionary:dict] doubleValue];
            self.number = [[self objectOrNilForKey:kOpenIssuesNumber fromDictionary:dict] doubleValue];
            self.repositoryUrl = [self objectOrNilForKey:kOpenIssuesRepositoryUrl fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kOpenIssuesUser]];
            self.closedAt = [self objectOrNilForKey:kOpenIssuesClosedAt fromDictionary:dict];
            self.labelsUrl = [self objectOrNilForKey:kOpenIssuesLabelsUrl fromDictionary:dict];
            self.comments = [[self objectOrNilForKey:kOpenIssuesComments fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kOpenIssuesCreatedAt fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kOpenIssuesHtmlUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLabels = [NSMutableArray array];
    for (NSObject *subArrayObject in self.labels) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLabels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLabels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabels] forKey:kOpenIssuesLabels];
    [mutableDict setValue:self.milestone forKey:kOpenIssuesMilestone];
    [mutableDict setValue:[NSNumber numberWithBool:self.locked] forKey:kOpenIssuesLocked];
    [mutableDict setValue:self.title forKey:kOpenIssuesTitle];
    [mutableDict setValue:self.url forKey:kOpenIssuesUrl];
    [mutableDict setValue:self.eventsUrl forKey:kOpenIssuesEventsUrl];
    [mutableDict setValue:self.updatedAt forKey:kOpenIssuesUpdatedAt];
    [mutableDict setValue:self.commentsUrl forKey:kOpenIssuesCommentsUrl];
    [mutableDict setValue:self.assignee forKey:kOpenIssuesAssignee];
    [mutableDict setValue:self.state forKey:kOpenIssuesState];
    [mutableDict setValue:self.body forKey:kOpenIssuesBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.openIssuesIdentifier] forKey:kOpenIssuesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kOpenIssuesNumber];
    [mutableDict setValue:self.repositoryUrl forKey:kOpenIssuesRepositoryUrl];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kOpenIssuesUser];
    [mutableDict setValue:self.closedAt forKey:kOpenIssuesClosedAt];
    [mutableDict setValue:self.labelsUrl forKey:kOpenIssuesLabelsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kOpenIssuesComments];
    [mutableDict setValue:self.createdAt forKey:kOpenIssuesCreatedAt];
    [mutableDict setValue:self.htmlUrl forKey:kOpenIssuesHtmlUrl];

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

    self.labels = [aDecoder decodeObjectForKey:kOpenIssuesLabels];
    self.milestone = [aDecoder decodeObjectForKey:kOpenIssuesMilestone];
    self.locked = [aDecoder decodeBoolForKey:kOpenIssuesLocked];
    self.title = [aDecoder decodeObjectForKey:kOpenIssuesTitle];
    self.url = [aDecoder decodeObjectForKey:kOpenIssuesUrl];
    self.eventsUrl = [aDecoder decodeObjectForKey:kOpenIssuesEventsUrl];
    self.updatedAt = [aDecoder decodeObjectForKey:kOpenIssuesUpdatedAt];
    self.commentsUrl = [aDecoder decodeObjectForKey:kOpenIssuesCommentsUrl];
    self.assignee = [aDecoder decodeObjectForKey:kOpenIssuesAssignee];
    self.state = [aDecoder decodeObjectForKey:kOpenIssuesState];
    self.body = [aDecoder decodeObjectForKey:kOpenIssuesBody];
    self.openIssuesIdentifier = [aDecoder decodeDoubleForKey:kOpenIssuesId];
    self.number = [aDecoder decodeDoubleForKey:kOpenIssuesNumber];
    self.repositoryUrl = [aDecoder decodeObjectForKey:kOpenIssuesRepositoryUrl];
    self.user = [aDecoder decodeObjectForKey:kOpenIssuesUser];
    self.closedAt = [aDecoder decodeObjectForKey:kOpenIssuesClosedAt];
    self.labelsUrl = [aDecoder decodeObjectForKey:kOpenIssuesLabelsUrl];
    self.comments = [aDecoder decodeDoubleForKey:kOpenIssuesComments];
    self.createdAt = [aDecoder decodeObjectForKey:kOpenIssuesCreatedAt];
    self.htmlUrl = [aDecoder decodeObjectForKey:kOpenIssuesHtmlUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_labels forKey:kOpenIssuesLabels];
    [aCoder encodeObject:_milestone forKey:kOpenIssuesMilestone];
    [aCoder encodeBool:_locked forKey:kOpenIssuesLocked];
    [aCoder encodeObject:_title forKey:kOpenIssuesTitle];
    [aCoder encodeObject:_url forKey:kOpenIssuesUrl];
    [aCoder encodeObject:_eventsUrl forKey:kOpenIssuesEventsUrl];
    [aCoder encodeObject:_updatedAt forKey:kOpenIssuesUpdatedAt];
    [aCoder encodeObject:_commentsUrl forKey:kOpenIssuesCommentsUrl];
    [aCoder encodeObject:_assignee forKey:kOpenIssuesAssignee];
    [aCoder encodeObject:_state forKey:kOpenIssuesState];
    [aCoder encodeObject:_body forKey:kOpenIssuesBody];
    [aCoder encodeDouble:_openIssuesIdentifier forKey:kOpenIssuesId];
    [aCoder encodeDouble:_number forKey:kOpenIssuesNumber];
    [aCoder encodeObject:_repositoryUrl forKey:kOpenIssuesRepositoryUrl];
    [aCoder encodeObject:_user forKey:kOpenIssuesUser];
    [aCoder encodeObject:_closedAt forKey:kOpenIssuesClosedAt];
    [aCoder encodeObject:_labelsUrl forKey:kOpenIssuesLabelsUrl];
    [aCoder encodeDouble:_comments forKey:kOpenIssuesComments];
    [aCoder encodeObject:_createdAt forKey:kOpenIssuesCreatedAt];
    [aCoder encodeObject:_htmlUrl forKey:kOpenIssuesHtmlUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    OpenIssues *copy = [[OpenIssues alloc] init];
    
    if (copy) {

        copy.labels = [self.labels copyWithZone:zone];
        copy.milestone = [self.milestone copyWithZone:zone];
        copy.locked = self.locked;
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.eventsUrl = [self.eventsUrl copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.commentsUrl = [self.commentsUrl copyWithZone:zone];
        copy.assignee = [self.assignee copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.openIssuesIdentifier = self.openIssuesIdentifier;
        copy.number = self.number;
        copy.repositoryUrl = [self.repositoryUrl copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.closedAt = [self.closedAt copyWithZone:zone];
        copy.labelsUrl = [self.labelsUrl copyWithZone:zone];
        copy.comments = self.comments;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.htmlUrl = [self.htmlUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
