//
//  HomeViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/16.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"
#import "WebViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    NSLog(@"3333");
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(PushAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(300, 100, 50, 50)];
    button1.backgroundColor = [UIColor greenColor];
    [button1 addTarget:self action:@selector(PushAction1) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button1];
}

- (void)PushAction {
    FirstViewController *vc = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)PushAction1 {
    WebViewController *vc = [[WebViewController alloc] initWithUrl:@"https://www.jianshu.com/p/6ba2507445e4"];
     [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
