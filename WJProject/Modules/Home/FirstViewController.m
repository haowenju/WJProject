//
//  FirstViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/19.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    self.navBar.title = @"首页首页首页首页首页首页首页首页首页首页首页";
    NSLog(@"123");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"123");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
