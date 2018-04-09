//
//  MineViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/16.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "MineViewController.h"
#import "SecondViewController.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(PushAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 120 * (i+1), 100, 100)];
        imageView.image = [UIImage imageNamed:@"1.jpg"];
        [self.view addSubview:imageView];
    }
}

- (void)PushAction {
    SecondViewController *vc = [[SecondViewController alloc] init];
    
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
