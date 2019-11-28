//
//  GZBaseWebVC.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/26.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "GZBaseVC.h"
#import <WebKit/WebKit.h>

@interface GZBaseWebVC : GZBaseVC
@property (nonatomic,strong) WKWebView * webView;
@property (nonatomic) UIColor *progressViewColor; // 进度条颜色

// 初始化
-(instancetype)initWithUrl:(NSString *)url;
@end
