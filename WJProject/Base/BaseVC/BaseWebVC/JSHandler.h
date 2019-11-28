//
//  JSHandler.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/26.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface JSHandler : NSObject<WKScriptMessageHandler>

-(instancetype)initWithViewController:(UIViewController *)webVC configuration:(WKWebViewConfiguration *)configuration;

-(void)cancelHandler;

@end
