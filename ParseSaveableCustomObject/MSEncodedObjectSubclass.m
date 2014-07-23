//
//  MSEncodedObjectSubclass.m
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "MSEncodedObjectSubclass.h"

@implementation MSEncodedObjectSubclass

- (id)initWithName:(NSString *)name age:(int)age
{
    if (self = [super initWithName:name])
    {
        _age = age;
    }
    return self;
}

@end
