//
//  t_AppDelegate.m
//  test_airplay
//
//  Created by abe.chua on 12-12-11.
//  Copyright (c) 2012年 abe.chua. All rights reserved.
//

#import "t_AppDelegate.h"

#import "t_ViewController.h"
#import "t_ExternalViewController.h"
#import "t_RemoteControlViewController.h"

@implementation t_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Register for notification
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(screenDidConnect:)
												 name:UIScreenDidConnectNotification
											   object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(screenDidDisconnect:)
												 name:UIScreenDidDisconnectNotification
											   object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenModeDidChange:)
                                                 name:UIScreenModeDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenBrightnessDidChange:)
                                                 name:UIScreenBrightnessDidChangeNotification
                                               object:nil];
    
    // Intitialise windows
    [self initWindows];
    
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
    
    // Unregister for notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIScreenDidConnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIScreenDidDisconnectNotification object:nil];
    
}

- (void)screenDidConnect:(NSNotification *)notification {
    NSLog(@"Screen Connected:%@",[notification object]);
    
    [self initWindows];
}

- (void)screenDidDisconnect:(NSNotification *)notification {
    NSLog(@"Screen Disconnected:%@",[notification object]);
    
    [self initWindows];
}

- (void)screenModeDidChange:(NSNotification *)notification {
    NSLog(@"Screen Mode Changed:%@",[notification object]);
    
    [self initWindows];
}

- (void)screenBrightnessDidChange:(NSNotification *)notification {
    NSLog(@"Screen Brightness Changed:%@",[notification object]);
}

- (void)initWindows {
    NSArray *screens;
    
    screens = [UIScreen screens];
    NSUInteger screenCount = [screens count];
    
    NSLog(@"There are have %d screen.",screenCount);
    
    if (screenCount > 1) {
    
        if(self.internalWindow == nil) {
            self.internalWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        }
        if(self.externalWindow == nil) {
            self.externalWindow = [[UIWindow alloc] initWithFrame:[[screens objectAtIndex:1] bounds]];
        }
        
        if(self.viewController != nil) {
            [self.viewController removeFromParentViewController];
            self.viewController = nil;
        }
        if(self.remoteControlViewController == nil) {
            self.remoteControlViewController = [[t_RemoteControlViewController alloc] init];
        }
        if(self.externalViewController == nil) {
            self.externalViewController = [[t_ExternalViewController alloc] init];
        }
        
        
        self.internalWindow.rootViewController = self.remoteControlViewController;
        [self.internalWindow makeKeyAndVisible];
        
        self.externalWindow.rootViewController = self.externalViewController;
        [self.externalWindow setScreen:[screens objectAtIndex:1]];
        [self.externalWindow setHidden:NO];
    }
    else {
        
        if(self.internalWindow == nil ) {
            self.internalWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        }
        if(self.externalWindow != nil) {
            self.externalWindow = nil;
        }
        
        if(self.viewController == nil) {
            self.viewController = [[t_ViewController alloc] init];
        }
        if(self.remoteControlViewController != nil) {
            [self.remoteControlViewController removeFromParentViewController];
            self.remoteControlViewController = nil;
        }
        if(self.externalViewController != nil) {
            [self.externalViewController removeFromParentViewController];
            self.externalViewController = nil;
        }
        
        self.internalWindow.rootViewController = self.viewController;
        [self.internalWindow makeKeyAndVisible];
    }
}
@end
