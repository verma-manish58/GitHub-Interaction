//
//  RepoOpenIssues.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RepoOpenIssues.h"
#import "OpenIssues.h"


NSString *const kRepoOpenIssuesOpenIssues = @"OpenIssues";


@interface RepoOpenIssues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RepoOpenIssues

@synthesize openIssues = _openIssues;


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
    NSObject *receivedOpenIssues = [dict objectForKey:kRepoOpenIssuesOpenIssues];
    NSMutableArray *parsedOpenIssues = [NSMutableArray array];
    if ([receivedOpenIssues isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOpenIssues) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOpenIssues addObject:[OpenIssues modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOpenIssues isKindOfClass:[NSDictionary class]]) {
       [parsedOpenIssues addObject:[OpenIssues modelObjectWithDictionary:(NSDictionary *)receivedOpenIssues]];
    }

    self.openIssues = [NSArray arrayWithArray:parsedOpenIssues];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForOpenIssues = [NSMutableArray array];
    for (NSObject *subArrayObject in self.openIssues) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOpenIssues addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOpenIssues addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOpenIssues] forKey:kRepoOpenIssuesOpenIssues];

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

    self.openIssues = [aDecoder decodeObjectForKey:kRepoOpenIssuesOpenIssues];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_openIssues forKey:kRepoOpenIssuesOpenIssues];
}

- (id)copyWithZone:(NSZone *)zone
{
    RepoOpenIssues *copy = [[RepoOpenIssues alloc] init];
    
    if (copy) {

        copy.openIssues = [self.openIssues copyWithZone:zone];
    }
    
    return copy;
}


@end
