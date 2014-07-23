//
//  MSAppDelegate.m
//  MSParseSubObject
//
//  Created by Michael Snowden on 7/23/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSEncodedObject.h"
#import "MSEncodedObjectSubclass.h"
#import "MSObject.h"

@implementation MSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    [MSObject registerSubclass];
#warning - Obtain this information here: https://parse.com
    [Parse setApplicationId: @"YOUR_APPLICATION_ID"
                  clientKey: @"YOUR_CLIENT_KEY"];
    MSObject *object = [MSObject object];
    MSEncodedObject *encodedObject1 = [[MSEncodedObject alloc] initWithName:@"Mal"];
    MSEncodedObjectSubclass *encodedObject2 = [[MSEncodedObjectSubclass alloc] initWithName:@"Mikey"
                                                                                        age:18];
    object.subObject1 = [NSKeyedArchiver archivedDataWithRootObject: encodedObject1];
    object.subObject2 = [NSKeyedArchiver archivedDataWithRootObject: encodedObject2];

    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            MSEncodedObject *unarchivedSubObject1 = [NSKeyedUnarchiver unarchiveObjectWithData:object.subObject1];
            MSEncodedObjectSubclass *unarchivedSubObject2 = [NSKeyedUnarchiver unarchiveObjectWithData:object.subObject2];
            NSLog(@"\nSubobject1 name: %@\nSubobject2 name: %@\tage: %i",
                  unarchivedSubObject1.name,
                  unarchivedSubObject2.name, unarchivedSubObject2.age);
        } else {
            NSLog(@"Error: %@", error);
        }
    }];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
