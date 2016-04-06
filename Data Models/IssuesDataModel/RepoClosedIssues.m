//
//  RepoClosedIssues.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RepoClosedIssues.h"
#import "ClosedIssues.h"


NSString *const kRepoClosedIssuesClosedIssues = @"ClosedIssues";


@interface RepoClosedIssues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RepoClosedIssues

@synthesize closedIssues = _closedIssues;


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
    NSObject *receivedClosedIssues = [dict objectForKey:kRepoClosedIssuesClosedIssues];
    NSMutableArray *parsedClosedIssues = [NSMutableArray array];
    if ([receivedClosedIssues isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedClosedIssues) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedClosedIssues addObject:[ClosedIssues modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedClosedIssues isKindOfClass:[NSDictionary class]]) {
       [parsedClosedIssues addObject:[ClosedIssues modelObjectWithDictionary:(NSDictionary *)receivedClosedIssues]];
    }

    self.closedIssues = [NSArray arrayWithArray:parsedClosedIssues];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForClosedIssues = [NSMutableArray array];
    for (NSObject *subArrayObject in self.closedIssues) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForClosedIssues addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForClosedIssues addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForClosedIssues] forKey:kRepoClosedIssuesClosedIssues];

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

    self.closedIssues = [aDecoder decodeObjectForKey:kRepoClosedIssuesClosedIssues];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_closedIssues forKey:kRepoClosedIssuesClosedIssues];
}

- (id)copyWithZone:(NSZone *)zone
{
    RepoClosedIssues *copy = [[RepoClosedIssues alloc] init];
    
    if (copy) {

        copy.closedIssues = [self.closedIssues copyWithZone:zone];
    }
    
    return copy;
}


@end
