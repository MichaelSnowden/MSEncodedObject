//
//  MSObject.h
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import <Parse/Parse.h>

@interface MSObject : PFObject <PFSubclassing>

@property (retain) NSData *subObject1;
@property (retain) NSData *subObject2;

@end
