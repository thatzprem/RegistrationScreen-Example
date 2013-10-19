//
//  AppDelegate.m
//  TestAPS
//
//  Created by Prem kumar on 20/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

HomeViewController *viewController;
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    viewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [self.window addSubview:viewController.view];
    
    [self.window makeKeyAndVisible];
    
    // Let the device know we want to receive push notifications
//	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
//     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    NSLog(@"iCloud: %d",[[NSUserDefaults standardUserDefaults] boolForKey:@"iCloud"]);
    
    
    return YES;
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString* myString = [NSString stringWithFormat:@"Received device token: %@",deviceToken];
    NSLog(@"%@",myString);
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Received Push Notofication!"
                                                        message:@"Message here" delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
    NSLog(@"Received notification: %@", userInfo);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    
//    __block UIBackgroundTaskIdentifier identifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        if (identifier != UIBackgroundTaskInvalid) {
//            [[UIApplication sharedApplication] endBackgroundTask:identifier];
//            identifier = UIBackgroundTaskInvalid;
//        }
//    }];
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        for (int i=0; i < 20; i++) {
//            NSLog(@"%d", i);
//            sleep(1);
//        }
//        if (identifier != UIBackgroundTaskInvalid) {
//            [[UIApplication sharedApplication] endBackgroundTask:identifier];
//            identifier = UIBackgroundTaskInvalid;
//        }
//    });
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
    NSLog(@"In applicationWillTerminate ");
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"iCloud"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
