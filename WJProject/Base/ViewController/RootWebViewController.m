//
//  RootWebViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/26.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "RootWebViewController.h"
#import "JSHandler.h"

@interface RootWebViewController ()<WKNavigationDelegate>
@property (nonatomic,strong) JSHandler * jsHandler;
@property (nonatomic,strong) UIProgressView * progressView;
@property (nonatomic, copy) NSString * url;
@property (nonatomic,assign) double lastProgress;//上次进度条位置
@end

@implementation RootWebViewController

-(instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self) {
        self.url = url;
        _progressViewColor = [UIColor colorWithHexString:@"0485d1"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [_webView loadRequest:request];
    // Do any additional setup after loading the view.
}

#pragma mark --进度条
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    [self updateProgress:_webView.estimatedProgress];
}

#pragma mark -  更新进度条
-(void)updateProgress:(double)progress{
    self.progressView.alpha = 1;
    if(progress > _lastProgress){
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
    }else{
        [self.progressView setProgress:self.webView.estimatedProgress];
    }
    _lastProgress = progress;
    
    if (progress >= 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.progressView.alpha = 0;
            [self.progressView setProgress:0];
            _lastProgress = 0;
        });
    }
}

#pragma mark --navigation delegate
//加载完毕
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self updateProgress:webView.estimatedProgress];
    
    [self updateNavigationItems];
}

-(void)updateNavigationItems{
    
}

// 在发送请求之前，决定是否跳转
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if(webView != self.webView) {
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    //更新返回按钮
    [self updateNavigationItems];
    
    NSURL * url = webView.URL;
    //打开wkwebview禁用了电话和跳转appstore 通过这个方法打开
    UIApplication *app = [UIApplication sharedApplication];
    if ([url.scheme isEqualToString:@"tel"])
    {
        if ([app canOpenURL:url])
        {
            [app openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    if ([url.absoluteString containsString:@"itunes.apple.com"])
    {
        if ([app canOpenURL:url])
        {
            [app openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}


- (void)backBtnClicked {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else {
        [super backBtnClicked];
    }
}

-(void)dealloc {
    [_jsHandler cancelHandler];
    self.webView.navigationDelegate = nil;
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
        configuration.preferences.javaScriptEnabled = YES;//打开js交互
        _jsHandler = [[JSHandler alloc]initWithViewController:self configuration:configuration];
        
        CGRect f = self.view.bounds;
        if (self.navigationController && self.isHidenNaviBar == NO) {
            f = CGRectMake(0, 0, self.view.bounds.size.width, kScreenHeight - kTopHeight);
        }
        
        _webView = [[WKWebView alloc]initWithFrame:f configuration:configuration];
        // 网页加载的 过程周期
        _webView.navigationDelegate = self;
        _webView.backgroundColor = [UIColor clearColor];
        _webView.allowsBackForwardNavigationGestures =YES;//打开网页间的 滑动返回
        _webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
        //监控进度
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        //进度条
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.tintColor = _progressViewColor;
        _progressView.trackTintColor = [UIColor clearColor];
        _progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 3.0);
        [_webView addSubview:_progressView];
    }
    return _webView;
}
@end
