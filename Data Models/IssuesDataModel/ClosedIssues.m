//
//  ClosedIssues.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ClosedIssues.h"
#import "User.h"


NSString *const kClosedIssuesLabels = @"labels";
NSString *const kClosedIssuesMilestone = @"milestone";
NSString *const kClosedIssuesLocked = @"locked";
NSString *const kClosedIssuesTitle = @"title";
NSString *const kClosedIssuesUrl = @"url";
NSString *const kClosedIssuesEventsUrl = @"events_url";
NSString *const kClosedIssuesUpdatedAt = @"updated_at";
NSString *const kClosedIssuesCommentsUrl = @"comments_url";
NSString *const kClosedIssuesAssignee = @"assignee";
NSString *const kClosedIssuesState = @"state";
NSString *const kClosedIssuesBody = @"body";
NSString *const kClosedIssuesId = @"id";
NSString *const kClosedIssuesNumber = @"number";
NSString *const kClosedIssuesRepositoryUrl = @"repository_url";
NSString *const kClosedIssuesUser = @"user";
NSString *const kClosedIssuesClosedAt = @"closed_at";
NSString *const kClosedIssuesLabelsUrl = @"labels_url";
NSString *const kClosedIssuesComments = @"comments";
NSString *const kClosedIssuesCreatedAt = @"created_at";
NSString *const kClosedIssuesHtmlUrl = @"html_url";


@interface ClosedIssues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClosedIssues

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
@synthesize closedIssuesIdentifier = _closedIssuesIdentifier;
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
            self.labels = [self objectOrNilForKey:kClosedIssuesLabels fromDictionary:dict];
            self.milestone = [self objectOrNilForKey:kClosedIssuesMilestone fromDictionary:dict];
            self.locked = [[self objectOrNilForKey:kClosedIssuesLocked fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kClosedIssuesTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kClosedIssuesUrl fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:kClosedIssuesEventsUrl fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kClosedIssuesUpdatedAt fromDictionary:dict];
            self.commentsUrl = [self objectOrNilForKey:kClosedIssuesCommentsUrl fromDictionary:dict];
            self.assignee = [self objectOrNilForKey:kClosedIssuesAssignee fromDictionary:dict];
            self.state = [self objectOrNilForKey:kClosedIssuesState fromDictionary:dict];
            self.body = [self objectOrNilForKey:kClosedIssuesBody fromDictionary:dict];
            self.closedIssuesIdentifier = [[self objectOrNilForKey:kClosedIssuesId fromDictionary:dict] doubleValue];
            self.number = [[self objectOrNilForKey:kClosedIssuesNumber fromDictionary:dict] doubleValue];
            self.repositoryUrl = [self objectOrNilForKey:kClosedIssuesRepositoryUrl fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kClosedIssuesUser]];
            self.closedAt = [self objectOrNilForKey:kClosedIssuesClosedAt fromDictionary:dict];
            self.labelsUrl = [self objectOrNilForKey:kClosedIssuesLabelsUrl fromDictionary:dict];
            self.comments = [[self objectOrNilForKey:kClosedIssuesComments fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kClosedIssuesCreatedAt fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kClosedIssuesHtmlUrl fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabels] forKey:kClosedIssuesLabels];
    [mutableDict setValue:self.milestone forKey:kClosedIssuesMilestone];
    [mutableDict setValue:[NSNumber numberWithBool:self.locked] forKey:kClosedIssuesLocked];
    [mutableDict setValue:self.title forKey:kClosedIssuesTitle];
    [mutableDict setValue:self.url forKey:kClosedIssuesUrl];
    [mutableDict setValue:self.eventsUrl forKey:kClosedIssuesEventsUrl];
    [mutableDict setValue:self.updatedAt forKey:kClosedIssuesUpdatedAt];
    [mutableDict setValue:self.commentsUrl forKey:kClosedIssuesCommentsUrl];
    [mutableDict setValue:self.assignee forKey:kClosedIssuesAssignee];
    [mutableDict setValue:self.state forKey:kClosedIssuesState];
    [mutableDict setValue:self.body forKey:kClosedIssuesBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.closedIssuesIdentifier] forKey:kClosedIssuesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kClosedIssuesNumber];
    [mutableDict setValue:self.repositoryUrl forKey:kClosedIssuesRepositoryUrl];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kClosedIssuesUser];
    [mutableDict setValue:self.closedAt forKey:kClosedIssuesClosedAt];
    [mutableDict setValue:self.labelsUrl forKey:kClosedIssuesLabelsUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kClosedIssuesComments];
    [mutableDict setValue:self.createdAt forKey:kClosedIssuesCreatedAt];
    [mutableDict setValue:self.htmlUrl forKey:kClosedIssuesHtmlUrl];

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

    self.labels = [aDecoder decodeObjectForKey:kClosedIssuesLabels];
    self.milestone = [aDecoder decodeObjectForKey:kClosedIssuesMilestone];
    self.locked = [aDecoder decodeBoolForKey:kClosedIssuesLocked];
    self.title = [aDecoder decodeObjectForKey:kClosedIssuesTitle];
    self.url = [aDecoder decodeObjectForKey:kClosedIssuesUrl];
    self.eventsUrl = [aDecoder decodeObjectForKey:kClosedIssuesEventsUrl];
    self.updatedAt = [aDecoder decodeObjectForKey:kClosedIssuesUpdatedAt];
    self.commentsUrl = [aDecoder decodeObjectForKey:kClosedIssuesCommentsUrl];
    self.assignee = [aDecoder decodeObjectForKey:kClosedIssuesAssignee];
    self.state = [aDecoder decodeObjectForKey:kClosedIssuesState];
    self.body = [aDecoder decodeObjectForKey:kClosedIssuesBody];
    self.closedIssuesIdentifier = [aDecoder decodeDoubleForKey:kClosedIssuesId];
    self.number = [aDecoder decodeDoubleForKey:kClosedIssuesNumber];
    self.repositoryUrl = [aDecoder decodeObjectForKey:kClosedIssuesRepositoryUrl];
    self.user = [aDecoder decodeObjectForKey:kClosedIssuesUser];
    self.closedAt = [aDecoder decodeObjectForKey:kClosedIssuesClosedAt];
    self.labelsUrl = [aDecoder decodeObjectForKey:kClosedIssuesLabelsUrl];
    self.comments = [aDecoder decodeDoubleForKey:kClosedIssuesComments];
    self.createdAt = [aDecoder decodeObjectForKey:kClosedIssuesCreatedAt];
    self.htmlUrl = [aDecoder decodeObjectForKey:kClosedIssuesHtmlUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_labels forKey:kClosedIssuesLabels];
    [aCoder encodeObject:_milestone forKey:kClosedIssuesMilestone];
    [aCoder encodeBool:_locked forKey:kClosedIssuesLocked];
    [aCoder encodeObject:_title forKey:kClosedIssuesTitle];
    [aCoder encodeObject:_url forKey:kClosedIssuesUrl];
    [aCoder encodeObject:_eventsUrl forKey:kClosedIssuesEventsUrl];
    [aCoder encodeObject:_updatedAt forKey:kClosedIssuesUpdatedAt];
    [aCoder encodeObject:_commentsUrl forKey:kClosedIssuesCommentsUrl];
    [aCoder encodeObject:_assignee forKey:kClosedIssuesAssignee];
    [aCoder encodeObject:_state forKey:kClosedIssuesState];
    [aCoder encodeObject:_body forKey:kClosedIssuesBody];
    [aCoder encodeDouble:_closedIssuesIdentifier forKey:kClosedIssuesId];
    [aCoder encodeDouble:_number forKey:kClosedIssuesNumber];
    [aCoder encodeObject:_repositoryUrl forKey:kClosedIssuesRepositoryUrl];
    [aCoder encodeObject:_user forKey:kClosedIssuesUser];
    [aCoder encodeObject:_closedAt forKey:kClosedIssuesClosedAt];
    [aCoder encodeObject:_labelsUrl forKey:kClosedIssuesLabelsUrl];
    [aCoder encodeDouble:_comments forKey:kClosedIssuesComments];
    [aCoder encodeObject:_createdAt forKey:kClosedIssuesCreatedAt];
    [aCoder encodeObject:_htmlUrl forKey:kClosedIssuesHtmlUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClosedIssues *copy = [[ClosedIssues alloc] init];
    
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
        copy.closedIssuesIdentifier = self.closedIssuesIdentifier;
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
