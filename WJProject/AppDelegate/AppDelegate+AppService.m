//
//  AppDelegate+AppService.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/15.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "AppDelegate+AppService.h"

@implementation AppDelegate (AppService)
#pragma mark ————— 初始化服务 —————
-(void)initService{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNotificationLoginStateChange
                                               object:nil];
    
    //网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(netWorkStateChange:)
                                                 name:KNotificationNetWorkStateChange
                                               object:nil];
}

- (void)netWorkStateChange:(NSNotification *)notification
{
    BOOL isNetWork = [notification.object boolValue];
    
    if (isNetWork) {//有网络
//        if ([userManager loadUserInfo] && !isLogin) {//有用户数据 并且 未登录成功 重新来一次自动登录
//            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
//                if (success) {
//                    DLog(@"网络改变后，自动登录成功");
//                    //                    [MBProgressHUD showSuccessMessage:@"网络改变后，自动登录成功"];
//                    KPostNotification(KNotificationAutoLoginSuccess, nil);
//                }else{
//                    [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
//                }
//            }];
//        }
        
    }else {//登陆失败加载登陆页面控制器
        [MBProgressHUD showTopTipMessage:@"网络状态不佳" isWindow:YES];
    }
}
#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = KWhiteColor;
    [self.window makeKeyAndVisible];
    
    // 避免按钮被多次点击
    [[UIButton appearance] setExclusiveTouch:YES];
    // ios11以后automaticallyAdjustsScrollViewInsets 失效
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    
    self.tabBarVC = [MainTabBarViewController new];
    self.window.rootViewController = self.tabBarVC;
    // 显示小红点
    [self.tabBarVC badgePointWithIndex:1 isShow:YES];
    // 显示数字
    [self.tabBarVC badgeNumberWithIndex:0 Number:@"3"];
}
//初始化用户系统
-(void)initUserManager {
    
}

//监听网络状态
- (void)monitorNetworkStatus {
    
}

@end
