//
//  MainTabBarViewController.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/16.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "CYLTabBarController.h"

@interface MainTabBarViewController : CYLTabBarController

// 小红点
- (void)badgePointWithIndex:(NSInteger)index isShow:(BOOL)show;
// 数字
- (void)badgeNumberWithIndex:(NSInteger)index Number:(NSString *)num;
@end
