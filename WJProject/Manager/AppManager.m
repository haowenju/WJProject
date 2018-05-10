//
//  AppManager.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/21.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "AppManager.h"
#import "AdPageView.h"
#import "RootWebViewController.h"
#import "RootNavigationController.h"
#import "LMJIntroductoryPagesHelper.h"
@implementation AppManager


+(void)appStart{
    //加载广告
    AdPageView *adView = [[AdPageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) withTapBlock:^{
        RootNavigationController *loginNavi =[[RootNavigationController alloc] initWithRootViewController:[[RootWebViewController alloc] initWithUrl:@"http://www.hao123.com"]];
        [kRootViewController presentViewController:loginNavi animated:YES completion:nil];
    }];
    adView = adView;
}


+ (void)loadIntroductoryPages {
    if (![kUserDefaults objectForKey:KFirstUse]) {
        // 欢迎视图
        [LMJIntroductoryPagesHelper showIntroductoryPageView:@[@"bg_welcome1.png", @"bg_welcome2.png", @"bg_welcome3.png"]];
        [kUserDefaults setObject:@"1" forKey:KFirstUse];
    }
}
@end
