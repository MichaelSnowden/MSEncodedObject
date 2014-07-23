//
//  MSPFSubObject.m
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "MSEncodedObject.h"
#import <objc/runtime.h>

@implementation MSEncodedObject

- (id)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        _name = name;
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    NSArray *keys = [self getKeys];
    NSLog(@"Keys from class %@: %@", NSStringFromClass([self class]), keys);
    for (NSString *key in keys)
    {
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        NSArray *keys = [self getKeys];
        for (NSString *key in keys)
        {
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

- (NSArray *)getKeys
{
    // this array doesn't change, so let's make sure it's only created once
    static NSMutableArray *keys = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
    keys = [NSMutableArray new];
    __unsafe_unretained Class class = [self class];
    while (class != nil)
    {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(class, &outCount);
        for (i = 0; i < outCount; ++i)
        {
            objc_property_t property = properties[i];
            const char *propName = property_getName(property);
            if (propName)
            {
                NSString *propertyName = [NSString stringWithUTF8String:propName];
                [keys addObject:propertyName];
            }
        }
        class = [class superclass];
    }
//    });
    return (NSArray *)keys;
}

@end
