//
//  GZBaseVC.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/15.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJCustomNaviBar.h"

@interface GZBaseVC : UIViewController<WJBarButtonItemDelegate>
@property (nonatomic, strong) WJCustomNaviBar *navBar;
// 修改状态栏颜色 可在VC的viewdidload设置
@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;
- (void)backBtnClicked;
@end
