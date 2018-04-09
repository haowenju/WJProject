//
//  AppDelegate+AppService.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/15.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "AppDelegate.h"

/**
 第三方初始化 和 应用内业务
 */
@interface AppDelegate (AppService)
//初始化window
-(void)initWindow;

-(void)initService;
//初始化用户系统
-(void)initUserManager;

//监听网络状态
- (void)monitorNetworkStatus;

@end
