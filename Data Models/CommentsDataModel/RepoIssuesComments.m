//
//  RepoIssuesComments.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RepoIssuesComments.h"
#import "IssuesComments.h"


NSString *const kRepoIssuesCommentsIssuesComments = @"IssuesComments";


@interface RepoIssuesComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RepoIssuesComments

@synthesize issuesComments = _issuesComments;


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
    NSObject *receivedIssuesComments = [dict objectForKey:kRepoIssuesCommentsIssuesComments];
    NSMutableArray *parsedIssuesComments = [NSMutableArray array];
    if ([receivedIssuesComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedIssuesComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedIssuesComments addObject:[IssuesComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedIssuesComments isKindOfClass:[NSDictionary class]]) {
       [parsedIssuesComments addObject:[IssuesComments modelObjectWithDictionary:(NSDictionary *)receivedIssuesComments]];
    }

    self.issuesComments = [NSArray arrayWithArray:parsedIssuesComments];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForIssuesComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.issuesComments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIssuesComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIssuesComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIssuesComments] forKey:kRepoIssuesCommentsIssuesComments];

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

    self.issuesComments = [aDecoder decodeObjectForKey:kRepoIssuesCommentsIssuesComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_issuesComments forKey:kRepoIssuesCommentsIssuesComments];
}

- (id)copyWithZone:(NSZone *)zone
{
    RepoIssuesComments *copy = [[RepoIssuesComments alloc] init];
    
    if (copy) {

        copy.issuesComments = [self.issuesComments copyWithZone:zone];
    }
    
    return copy;
}


@end
