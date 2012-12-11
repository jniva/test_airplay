//
//  t_RemoteControlViewController.m
//  test_airplay
//
//  Created by abe.chua on 12-12-11.
//  Copyright (c) 2012年 abe.chua. All rights reserved.
//

#import "t_RemoteControlViewController.h"

@interface t_RemoteControlViewController ()

@end

@implementation t_RemoteControlViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
