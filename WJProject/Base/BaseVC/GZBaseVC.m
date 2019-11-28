//
//  GZBaseVC.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/15.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "GZBaseVC.h"

@interface GZBaseVC ()
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation GZBaseVC

- (UIStatusBarStyle)preferredStatusBarStyle{
    return _StatusBarStyle;
}
//动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    _StatusBarStyle=StatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //默认导航栏样式：黑字
    self.StatusBarStyle = UIStatusBarStyleDefault;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUpNaviBar];
}

- (void)setUpNaviBar {
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.navBar];
    NSInteger VCCount = self.navigationController.viewControllers.count;
    if (VCCount > 1) {
        WJBarButtonItem *backItem = [[WJBarButtonItem alloc] initItem:WJItemTypeBack position:WJItemPositionLeft param:nil delegate:self];
        self.navBar.leftBarButtonItem = backItem;
    }
}

#pragma mark - WJBarButtonItemDelegate
- (void)barButtonItemDidClick:(WJItemType)itemType position:(WJItemPosition)position index:(NSInteger)index {
    NSString *str1 = (position == 0) ? @"左边" : @"右边";
    NSLog(@"%@第%ld个",str1,(long)index);
    if (itemType == WJItemTypeBack && position == WJItemPositionLeft && index == 1) {
        [self backBtnClicked];
    }
}

// 删除观察者
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 返回键
- (void)backBtnClicked
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



#pragma mark -- setter
- (WJCustomNaviBar *)navBar {
    if (_navBar == nil) {
        _navBar = [WJCustomNaviBar customNaviBar];
        [_navBar setBackgroundColor:[UIColor colorWithRed:102.0/255 green:146.0/255 blue:218.0/255 alpha:1.0]];
    }
    return _navBar;
}

- (void)showLoading {
    
}
- (void)dismissLoading {
    
}
@end
