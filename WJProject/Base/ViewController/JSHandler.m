//
//  JSHandler.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/26.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "JSHandler.h"

@interface JSHandler ()
@property (nonatomic,strong) UIViewController * webVC;
@property (nonatomic,strong) WKWebViewConfiguration * configuration;
@end

@implementation JSHandler
-(instancetype)initWithViewController:(UIViewController *)webVC configuration:(WKWebViewConfiguration *)configuration {
    self = [super init];
    if (self) {
        _webVC = webVC;
        _configuration = configuration;
        //注册JS 事件
        [configuration.userContentController addScriptMessageHandler:self name:@"backPage"];
        
    }
    return self;
}

#pragma mark -  JS 调用 Native  代理
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"backPage"]) {
        //返回
        if (self.webVC.presentingViewController) {
            [self.webVC dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self.webVC.navigationController popViewControllerAnimated:YES];
        }
    }
}

-(void)cancelHandler {
    [_configuration.userContentController removeScriptMessageHandlerForName:@"backPage"];
}
@end
