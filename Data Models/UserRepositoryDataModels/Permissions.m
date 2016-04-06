//
//  Permissions.m
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Permissions.h"


NSString *const kPermissionsAdmin = @"admin";
NSString *const kPermissionsPush = @"push";
NSString *const kPermissionsPull = @"pull";


@interface Permissions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Permissions

@synthesize admin = _admin;
@synthesize push = _push;
@synthesize pull = _pull;


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
            self.admin = [[self objectOrNilForKey:kPermissionsAdmin fromDictionary:dict] boolValue];
            self.push = [[self objectOrNilForKey:kPermissionsPush fromDictionary:dict] boolValue];
            self.pull = [[self objectOrNilForKey:kPermissionsPull fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.admin] forKey:kPermissionsAdmin];
    [mutableDict setValue:[NSNumber numberWithBool:self.push] forKey:kPermissionsPush];
    [mutableDict setValue:[NSNumber numberWithBool:self.pull] forKey:kPermissionsPull];

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

    self.admin = [aDecoder decodeBoolForKey:kPermissionsAdmin];
    self.push = [aDecoder decodeBoolForKey:kPermissionsPush];
    self.pull = [aDecoder decodeBoolForKey:kPermissionsPull];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_admin forKey:kPermissionsAdmin];
    [aCoder encodeBool:_push forKey:kPermissionsPush];
    [aCoder encodeBool:_pull forKey:kPermissionsPull];
}

- (id)copyWithZone:(NSZone *)zone
{
    Permissions *copy = [[Permissions alloc] init];
    
    if (copy) {

        copy.admin = self.admin;
        copy.push = self.push;
        copy.pull = self.pull;
    }
    
    return copy;
}


@end
