//
//  User.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "User.h"


NSString *const kUserId = @"id";
NSString *const kUserOrganizationsUrl = @"organizations_url";
NSString *const kUserReceivedEventsUrl = @"received_events_url";
NSString *const kUserFollowingUrl = @"following_url";
NSString *const kUserLogin = @"login";
NSString *const kUserSubscriptionsUrl = @"subscriptions_url";
NSString *const kUserAvatarUrl = @"avatar_url";
NSString *const kUserUrl = @"url";
NSString *const kUserType = @"type";
NSString *const kUserReposUrl = @"repos_url";
NSString *const kUserHtmlUrl = @"html_url";
NSString *const kUserEventsUrl = @"events_url";
NSString *const kUserSiteAdmin = @"site_admin";
NSString *const kUserStarredUrl = @"starred_url";
NSString *const kUserGistsUrl = @"gists_url";
NSString *const kUserGravatarId = @"gravatar_id";
NSString *const kUserFollowersUrl = @"followers_url";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

@synthesize userIdentifier = _userIdentifier;
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
            self.userIdentifier = [[self objectOrNilForKey:kUserId fromDictionary:dict] doubleValue];
            self.organizationsUrl = [self objectOrNilForKey:kUserOrganizationsUrl fromDictionary:dict];
            self.receivedEventsUrl = [self objectOrNilForKey:kUserReceivedEventsUrl fromDictionary:dict];
            self.followingUrl = [self objectOrNilForKey:kUserFollowingUrl fromDictionary:dict];
            self.login = [self objectOrNilForKey:kUserLogin fromDictionary:dict];
            self.subscriptionsUrl = [self objectOrNilForKey:kUserSubscriptionsUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kUserAvatarUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kUserUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kUserType fromDictionary:dict];
            self.reposUrl = [self objectOrNilForKey:kUserReposUrl fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:kUserHtmlUrl fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:kUserEventsUrl fromDictionary:dict];
            self.siteAdmin = [[self objectOrNilForKey:kUserSiteAdmin fromDictionary:dict] boolValue];
            self.starredUrl = [self objectOrNilForKey:kUserStarredUrl fromDictionary:dict];
            self.gistsUrl = [self objectOrNilForKey:kUserGistsUrl fromDictionary:dict];
            self.gravatarId = [self objectOrNilForKey:kUserGravatarId fromDictionary:dict];
            self.followersUrl = [self objectOrNilForKey:kUserFollowersUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kUserId];
    [mutableDict setValue:self.organizationsUrl forKey:kUserOrganizationsUrl];
    [mutableDict setValue:self.receivedEventsUrl forKey:kUserReceivedEventsUrl];
    [mutableDict setValue:self.followingUrl forKey:kUserFollowingUrl];
    [mutableDict setValue:self.login forKey:kUserLogin];
    [mutableDict setValue:self.subscriptionsUrl forKey:kUserSubscriptionsUrl];
    [mutableDict setValue:self.avatarUrl forKey:kUserAvatarUrl];
    [mutableDict setValue:self.url forKey:kUserUrl];
    [mutableDict setValue:self.type forKey:kUserType];
    [mutableDict setValue:self.reposUrl forKey:kUserReposUrl];
    [mutableDict setValue:self.htmlUrl forKey:kUserHtmlUrl];
    [mutableDict setValue:self.eventsUrl forKey:kUserEventsUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.siteAdmin] forKey:kUserSiteAdmin];
    [mutableDict setValue:self.starredUrl forKey:kUserStarredUrl];
    [mutableDict setValue:self.gistsUrl forKey:kUserGistsUrl];
    [mutableDict setValue:self.gravatarId forKey:kUserGravatarId];
    [mutableDict setValue:self.followersUrl forKey:kUserFollowersUrl];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kUserId];
    self.organizationsUrl = [aDecoder decodeObjectForKey:kUserOrganizationsUrl];
    self.receivedEventsUrl = [aDecoder decodeObjectForKey:kUserReceivedEventsUrl];
    self.followingUrl = [aDecoder decodeObjectForKey:kUserFollowingUrl];
    self.login = [aDecoder decodeObjectForKey:kUserLogin];
    self.subscriptionsUrl = [aDecoder decodeObjectForKey:kUserSubscriptionsUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kUserAvatarUrl];
    self.url = [aDecoder decodeObjectForKey:kUserUrl];
    self.type = [aDecoder decodeObjectForKey:kUserType];
    self.reposUrl = [aDecoder decodeObjectForKey:kUserReposUrl];
    self.htmlUrl = [aDecoder decodeObjectForKey:kUserHtmlUrl];
    self.eventsUrl = [aDecoder decodeObjectForKey:kUserEventsUrl];
    self.siteAdmin = [aDecoder decodeBoolForKey:kUserSiteAdmin];
    self.starredUrl = [aDecoder decodeObjectForKey:kUserStarredUrl];
    self.gistsUrl = [aDecoder decodeObjectForKey:kUserGistsUrl];
    self.gravatarId = [aDecoder decodeObjectForKey:kUserGravatarId];
    self.followersUrl = [aDecoder decodeObjectForKey:kUserFollowersUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kUserId];
    [aCoder encodeObject:_organizationsUrl forKey:kUserOrganizationsUrl];
    [aCoder encodeObject:_receivedEventsUrl forKey:kUserReceivedEventsUrl];
    [aCoder encodeObject:_followingUrl forKey:kUserFollowingUrl];
    [aCoder encodeObject:_login forKey:kUserLogin];
    [aCoder encodeObject:_subscriptionsUrl forKey:kUserSubscriptionsUrl];
    [aCoder encodeObject:_avatarUrl forKey:kUserAvatarUrl];
    [aCoder encodeObject:_url forKey:kUserUrl];
    [aCoder encodeObject:_type forKey:kUserType];
    [aCoder encodeObject:_reposUrl forKey:kUserReposUrl];
    [aCoder encodeObject:_htmlUrl forKey:kUserHtmlUrl];
    [aCoder encodeObject:_eventsUrl forKey:kUserEventsUrl];
    [aCoder encodeBool:_siteAdmin forKey:kUserSiteAdmin];
    [aCoder encodeObject:_starredUrl forKey:kUserStarredUrl];
    [aCoder encodeObject:_gistsUrl forKey:kUserGistsUrl];
    [aCoder encodeObject:_gravatarId forKey:kUserGravatarId];
    [aCoder encodeObject:_followersUrl forKey:kUserFollowersUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    
    if (copy) {

        copy.userIdentifier = self.userIdentifier;
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
