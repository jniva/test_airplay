//
//  t_AppDelegate.h
//  test_airplay
//
//  Created by abe.chua on 12-12-11.
//  Copyright (c) 2012年 abe.chua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class t_ViewController;
@class t_ExternalViewController;
@class t_RemoteControlViewController;

@interface t_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *internalWindow;
@property (strong, nonatomic) UIWindow *externalWindow;

@property (strong, nonatomic) t_ViewController *viewController;
@property (strong, nonatomic) t_ExternalViewController *externalViewController;
@property (strong, nonatomic) t_RemoteControlViewController *remoteControlViewController;

@end
