//
//  UserRepository.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "UserRepository.h"
#import "Repository.h"


NSString *const kUserRepositoryRepository = @"Repository";


@interface UserRepository ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserRepository

@synthesize repository = _repository;


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
    NSObject *receivedRepository = [dict objectForKey:kUserRepositoryRepository];
    NSMutableArray *parsedRepository = [NSMutableArray array];
    if ([receivedRepository isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRepository) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRepository addObject:[Repository modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRepository isKindOfClass:[NSDictionary class]]) {
       [parsedRepository addObject:[Repository modelObjectWithDictionary:(NSDictionary *)receivedRepository]];
    }

    self.repository = [NSArray arrayWithArray:parsedRepository];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForRepository = [NSMutableArray array];
    for (NSObject *subArrayObject in self.repository) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRepository addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRepository addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRepository] forKey:kUserRepositoryRepository];

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

    self.repository = [aDecoder decodeObjectForKey:kUserRepositoryRepository];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_repository forKey:kUserRepositoryRepository];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserRepository *copy = [[UserRepository alloc] init];
    
    if (copy) {

        copy.repository = [self.repository copyWithZone:zone];
    }
    
    return copy;
}


@end
