//
//  RootWebViewController.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/26.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>

@interface RootWebViewController : RootViewController
@property (nonatomic,strong) WKWebView * webView;
@property (nonatomic) UIColor *progressViewColor; // 进度条颜色

// 初始化
-(instancetype)initWithUrl:(NSString *)url;
//更新导航栏按钮，子类去实现
-(void)updateNavigationItems;
@end
