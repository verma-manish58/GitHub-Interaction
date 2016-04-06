//
//  Permissions.h
//
//  Created by Manish Verma on 01/04/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Permissions : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL admin;
@property (nonatomic, assign) BOOL push;
@property (nonatomic, assign) BOOL pull;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
