//
//  MSPFSubObject.h
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSEncodedObject : NSObject <NSCoding>

- (id)initWithName:(NSString *)name;

@property (nonatomic, strong) NSString *name;

@end
