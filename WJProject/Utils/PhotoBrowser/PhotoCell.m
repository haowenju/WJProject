//
//  PhotoCell.m
//  WJProject
//
//  Created by 郝文举 on 2018/5/10.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation PhotoCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    [self.scrollView addSubview:self.imageView];
    [self.contentView addSubview:self.scrollView];
}

- (void)setUrl:(NSString *)url {
    _url = url;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_url] placeholderImage:[UIImage imageNamed:@"purchaseList"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.imageView.image = image;
    }];
}

#pragma mark -- 点击事件
- (void)handleDoubleTap:(UIGestureRecognizer *)gesture
{
    CGFloat zoomScale = self.scrollView.zoomScale;
    zoomScale = (zoomScale == 1.0) ? 2.0 : 1.0;
    CGRect zoomRect = [self zoomRectForScale:zoomScale withCenter:[gesture locationInView:gesture.view]];
    [self.scrollView zoomToRect:zoomRect animated:YES];
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height =self.frame.size.height / scale;
    zoomRect.size.width  =self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  /2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height /2.0);
    return zoomRect;
}

#pragma mark -- 代理
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


#pragma mark -- 懒加载
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [doubleTapGesture setNumberOfTapsRequired:2];
        [_imageView addGestureRecognizer:doubleTapGesture];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.contentView.bounds];
        _scrollView.maximumZoomScale = 2.0;
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.delegate = self;
    }
    return _scrollView;
}
@end
