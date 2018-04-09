//
//  AppDelegate.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/15.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainTabBarViewController *tabBarVC;

+ (AppDelegate *)shareAppDelegate;

// 顶级控制器
-(UIViewController*) getCurrentVC;
// 当前控制器
-(UIViewController*) getCurrentUIVC;
@end

