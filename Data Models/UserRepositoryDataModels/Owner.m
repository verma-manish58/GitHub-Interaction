//
//  Owner.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Owner.h"


NSString *const kOwnerId = @"id";
NSString *const kOwnerOrganizationsUrl = @"organizations_url";
NSString *const kOwnerReceivedEventsUrl = @"received_events_url";
NSString *const kOwnerFollowingUrl = @"following_url";
NSString *const kOwnerLogin = @"login";
NSString *const kOwnerSubscriptionsUrl = @"subscriptions_url";
NSString *const kOwnerAvatarUrl = @"avatar_url";
NSString *const kOwnerUrl = @"url";
NSString *const kOwnerType = @"type";
NSString *const kOwnerReposUrl = @"repos_url";
NSString *const kOwnerHtmlUrl = @"html_url";
NSString *const kOwnerEventsUrl = @"events_url";
NSString *const kOwnerSiteAdmin = @"site_admin";
NSString *const kOwnerStarredUrl = @"starred_url";
NSString *const kOwnerGistsUrl = @"gists_url";
NSString *const kOwnerGravatarId = @"gravatar_id";
NSString *const kOwnerFollowersUrl = @"followers_url";


@interface Owner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Owner

@synthesize ownerIdentifier = _ownerIdentifier;
@synthesize organizationsUrl = _organizationsUrl;
@synthesize receivedEventsUrl = _receivedEventsUrl;
@synthesize followingUrl = _followingUrl;
@synthesize login = _login;
@synthesize subscriptionsUrl = _subscriptionsUrl;
@synthesize avatarUrl = _avatarUrl;
@synthesize url = _url;
@synthesize type = _type;
@synthesize reposUrl = _reposUrl;
@synthesize htmlUrl = _htmlUrl;
@synthesize eventsUrl = _eventsUrl;
@synthesize siteAdmin = _siteAdmin;
@synthesize starredUrl = _starredUrl;
@synthesize gistsUrl = _gistsUrl;
@synthesize gravatarId = _gravatarId;
@synthesize followersUrl = _followersUrl;


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
            self.ownerIdentifier = [[self objectOrNilForKey:kOwnerId fromDictionary:dict] doubleValue];
            self.organizationsUrl = [self objectOrNilForKey:kOwnerOrganizationsUrl fromDictionary:dict];
            self.receivedEventsUrl = [self objectOrNilForKey:kOwnerReceivedEventsUrl fromDictionary:dict];
            self.followingUrl = [self objectOrNilForKey:kOwnerFollowingUrl fromDictionary:dict];
            self.login = [self objectOrNilForKey:kOwnerLogin fromDictionary:dict];
            self.subscriptionsUrl = [self objectOrNilForKey:kOwnerSubscriptionsUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kOwnerAvatarUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kOwnerUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kOwnerType fromDictionary:dict];
            self.reposUrl = [self objectOrNilForKey:kOwnerReposUrl fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kOwnerHtmlUrl fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:kOwnerEventsUrl fromDictionary:dict];
            self.siteAdmin = [[self objectOrNilForKey:kOwnerSiteAdmin fromDictionary:dict] boolValue];
            self.starredUrl = [self objectOrNilForKey:kOwnerStarredUrl fromDictionary:dict];
            self.gistsUrl = [self objectOrNilForKey:kOwnerGistsUrl fromDictionary:dict];
            self.gravatarId = [self objectOrNilForKey:kOwnerGravatarId fromDictionary:dict];
            self.followersUrl = [self objectOrNilForKey:kOwnerFollowersUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ownerIdentifier] forKey:kOwnerId];
    [mutableDict setValue:self.organizationsUrl forKey:kOwnerOrganizationsUrl];
    [mutableDict setValue:self.receivedEventsUrl forKey:kOwnerReceivedEventsUrl];
    [mutableDict setValue:self.followingUrl forKey:kOwnerFollowingUrl];
    [mutableDict setValue:self.login forKey:kOwnerLogin];
    [mutableDict setValue:self.subscriptionsUrl forKey:kOwnerSubscriptionsUrl];
    [mutableDict setValue:self.avatarUrl forKey:kOwnerAvatarUrl];
    [mutableDict setValue:self.url forKey:kOwnerUrl];
    [mutableDict setValue:self.type forKey:kOwnerType];
    [mutableDict setValue:self.reposUrl forKey:kOwnerReposUrl];
    [mutableDict setValue:self.htmlUrl forKey:kOwnerHtmlUrl];
    [mutableDict setValue:self.eventsUrl forKey:kOwnerEventsUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.siteAdmin] forKey:kOwnerSiteAdmin];
    [mutableDict setValue:self.starredUrl forKey:kOwnerStarredUrl];
    [mutableDict setValue:self.gistsUrl forKey:kOwnerGistsUrl];
    [mutableDict setValue:self.gravatarId forKey:kOwnerGravatarId];
    [mutableDict setValue:self.followersUrl forKey:kOwnerFollowersUrl];

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

    self.ownerIdentifier = [aDecoder decodeDoubleForKey:kOwnerId];
    self.organizationsUrl = [aDecoder decodeObjectForKey:kOwnerOrganizationsUrl];
    self.receivedEventsUrl = [aDecoder decodeObjectForKey:kOwnerReceivedEventsUrl];
    self.followingUrl = [aDecoder decodeObjectForKey:kOwnerFollowingUrl];
    self.login = [aDecoder decodeObjectForKey:kOwnerLogin];
    self.subscriptionsUrl = [aDecoder decodeObjectForKey:kOwnerSubscriptionsUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kOwnerAvatarUrl];
    self.url = [aDecoder decodeObjectForKey:kOwnerUrl];
    self.type = [aDecoder decodeObjectForKey:kOwnerType];
    self.reposUrl = [aDecoder decodeObjectForKey:kOwnerReposUrl];
    self.htmlUrl = [aDecoder decodeObjectForKey:kOwnerHtmlUrl];
    self.eventsUrl = [aDecoder decodeObjectForKey:kOwnerEventsUrl];
    self.siteAdmin = [aDecoder decodeBoolForKey:kOwnerSiteAdmin];
    self.starredUrl = [aDecoder decodeObjectForKey:kOwnerStarredUrl];
    self.gistsUrl = [aDecoder decodeObjectForKey:kOwnerGistsUrl];
    self.gravatarId = [aDecoder decodeObjectForKey:kOwnerGravatarId];
    self.followersUrl = [aDecoder decodeObjectForKey:kOwnerFollowersUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ownerIdentifier forKey:kOwnerId];
    [aCoder encodeObject:_organizationsUrl forKey:kOwnerOrganizationsUrl];
    [aCoder encodeObject:_receivedEventsUrl forKey:kOwnerReceivedEventsUrl];
    [aCoder encodeObject:_followingUrl forKey:kOwnerFollowingUrl];
    [aCoder encodeObject:_login forKey:kOwnerLogin];
    [aCoder encodeObject:_subscriptionsUrl forKey:kOwnerSubscriptionsUrl];
    [aCoder encodeObject:_avatarUrl forKey:kOwnerAvatarUrl];
    [aCoder encodeObject:_url forKey:kOwnerUrl];
    [aCoder encodeObject:_type forKey:kOwnerType];
    [aCoder encodeObject:_reposUrl forKey:kOwnerReposUrl];
    [aCoder encodeObject:_htmlUrl forKey:kOwnerHtmlUrl];
    [aCoder encodeObject:_eventsUrl forKey:kOwnerEventsUrl];
    [aCoder encodeBool:_siteAdmin forKey:kOwnerSiteAdmin];
    [aCoder encodeObject:_starredUrl forKey:kOwnerStarredUrl];
    [aCoder encodeObject:_gistsUrl forKey:kOwnerGistsUrl];
    [aCoder encodeObject:_gravatarId forKey:kOwnerGravatarId];
    [aCoder encodeObject:_followersUrl forKey:kOwnerFollowersUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Owner *copy = [[Owner alloc] init];
    
    if (copy) {

        copy.ownerIdentifier = self.ownerIdentifier;
        copy.organizationsUrl = [self.organizationsUrl copyWithZone:zone];
        copy.receivedEventsUrl = [self.receivedEventsUrl copyWithZone:zone];
        copy.followingUrl = [self.followingUrl copyWithZone:zone];
        copy.login = [self.login copyWithZone:zone];
        copy.subscriptionsUrl = [self.subscriptionsUrl copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.reposUrl = [self.reposUrl copyWithZone:zone];
        copy.htmlUrl = [self.htmlUrl copyWithZone:zone];
        copy.eventsUrl = [self.eventsUrl copyWithZone:zone];
        copy.siteAdmin = self.siteAdmin;
        copy.starredUrl = [self.starredUrl copyWithZone:zone];
        copy.gistsUrl = [self.gistsUrl copyWithZone:zone];
        copy.gravatarId = [self.gravatarId copyWithZone:zone];
        copy.followersUrl = [self.followersUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
