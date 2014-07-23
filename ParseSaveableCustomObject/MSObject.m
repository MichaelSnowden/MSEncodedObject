//
//  MSObject.m
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "MSObject.h"
#import <Parse/PFObject+Subclass.h>

@implementation MSObject

@dynamic subObject1, subObject2;

+ (NSString *)parseClassName
{
    return @"Object";
}

@end
