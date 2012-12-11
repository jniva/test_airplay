//
//  t_ExternalViewController.m
//  test_airplay
//
//  Created by abe.chua on 12-12-11.
//  Copyright (c) 2012年 abe.chua. All rights reserved.
//

#import "t_ExternalViewController.h"

@interface t_ExternalViewController ()

@end

@implementation t_ExternalViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
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
