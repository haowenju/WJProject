//
//  AdPageView.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/22.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "AdPageView.h"



@interface AdPageView()
/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@property (nonatomic, strong) UIImageView *adView;

@property (nonatomic, strong) UIButton *countBtn;

@property (nonatomic, strong) NSTimer *countTimer;

@property (nonatomic, assign) int count;

@property (nonatomic, copy) TapBlock tapBlock;

@end

@implementation AdPageView

- (instancetype)initWithFrame:(CGRect)frame withTapBlock:(TapBlock)tapBlock
{
    if (self = [super initWithFrame:frame]) {
        
        // 1.广告图片
        _adView = [[UIImageView alloc] initWithFrame:frame];
        _adView.userInteractionEnabled = YES;
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        
        // 2.跳过按钮
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - btnW - 24, kTopHeight, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d", showtime] forState:UIControlStateNormal];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
        _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_adView];
        [self addSubview:_countBtn];

        // 1.判断沙盒中是否存在广告图片，如果存在，直接显示
        NSString *filePath = [self getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
        
        BOOL isExist = [WJFileManager isExistFileWithFilePath:filePath];
        if (isExist) {// 图片存在
            [self setFilePath:filePath];
            self.tapBlock = tapBlock;
            [self show];
        }
        // 2.无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新
        [self getAdvertisingImage];
    }
    return self;
}

- (void)setFilePath:(NSString *)filePath
{
    _filePath = filePath;
    _adView.image = [UIImage imageWithContentsOfFile:filePath];
}

# pragma mark -- 显示、移除、点击广告
// 显示广告页
- (void)show {
    if (showtime<=0) {
        return;
    }
    [self startTimer];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

// 移除广告页
- (void)dismiss {
    [self.countTimer invalidate];
    self.countTimer = nil;
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

// 点击广告
- (void)pushToAd {
    [self dismiss];
    if (self.tapBlock) {
        self.tapBlock();
    }
}

# pragma mark -- 定时器
- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}

// 定时器倒计时
- (void)startTimer {
    _count = showtime;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}

// 时间减少
- (void)countDown {
    _count --;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%d",_count] forState:UIControlStateNormal];
    if (_count <= 0) {
        [self dismiss];
    }
}

#pragma mark -- 网络
// 请求广告接口
- (void)getAdvertisingImage
{
    
    NSString *imageUrl = @"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg";
    
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    // 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];
    BOOL isExist = [WJFileManager isExistFileWithFilePath:filePath];
    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
        
        [self downloadAdImageWithUrl:imageUrl imageName:imageName];
        
    }
    
    // TODO 请求广告接口
    
    //    [PPNetworkHelper POST:NSStringFormat(@"%@%@",URL_main,URL_Test) parameters:@{@"versionId":@100} success:^(id responseObject) {
    //        if (ValidDict(responseObject)) {
    //            if (ValidDict(responseObject[@"data"])) {
    //                NSDictionary *data = responseObject[@"data"];
    //                if (ValidStr(data[@"picUrl"])) {
    //                    // 获取图片名:43-130P5122Z60-50.jpg
    //                    NSArray *stringArr = [data[@"picUrl"] componentsSeparatedByString:@"/"];
    //                    NSString *imageName = stringArr.lastObject;
    //
    //                    // 拼接沙盒路径
    //                    NSString *filePath = [self getFilePathWithImageName:imageName];
    //                    BOOL isExist = [self isFileExistWithFilePath:filePath];
    //                    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
    //
    //                        [self downloadAdImageWithUrl:data[@"picUrl"] imageName:imageName];
    //
    //                    }
    //
    //                }
    //            }
    //        }
    //
    //    } failure:^(NSError *error) {
    //
    //    }];
}

// 下载新图片
- (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        NSString *filePath = [self getFilePathWithImageName:imageName]; // 保存文件的名称
        
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) {// 保存成功
            NSLog(@"广告页保存成功");
            [self deleteOldImage];
            [kUserDefaults setValue:imageName forKey:adImageName];
            [kUserDefaults synchronize];
            // 如果有广告链接，将广告链接也保存下来
        }else{
            NSLog(@"广告页保存失败");
        }
        
    });
}

// 删除旧图片
- (void)deleteOldImage {
    NSString *imageName = [kUserDefaults valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        [WJFileManager deleteFileWithPath:filePath];
    }
}

//根据图片名拼接文件路径
- (NSString *)getFilePathWithImageName:(NSString *)imageName {
    if (imageName) {
        NSString *path = [WJFileManager cachesPath];
        NSString *filePath = [path   stringByAppendingPathComponent:imageName];
        return filePath;
    }else {
        return nil;
    }
    
}

@end
