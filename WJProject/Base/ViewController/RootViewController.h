//
//  RootViewController.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/15.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

// 是否隐藏导航栏 默认为NO（根据这个字段，跳转时由Nav控制是否显示） 可在VC的viewdidload设置，因为这个字段是在Nav的willShowViewController方法里使用
@property (nonatomic, assign) BOOL isHidenNaviBar;

// 是否显示返回按钮,默认情况是YES(一级界面也不用设置，有判断栈里大于1) 可在VC的viewdidload设置
@property (nonatomic, assign) BOOL isShowLiftBack;

// 修改状态栏颜色 可在VC的viewdidload设置
@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

// 默认返回按钮的点击事件，默认是返回
- (void)backBtnClicked;


@end
