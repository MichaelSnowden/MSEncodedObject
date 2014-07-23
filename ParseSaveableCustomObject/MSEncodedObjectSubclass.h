//
//  MSEncodedObjectSubclass.h
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "MSEncodedObject.h"

@interface MSEncodedObjectSubclass : MSEncodedObject

- (id)initWithName:(NSString *)name age:(int) age;

// we can even use primitives :D
@property (nonatomic) int age;

@end
