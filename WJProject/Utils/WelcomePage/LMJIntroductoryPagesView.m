//
//  LMJIntroductoryPagesView.m
//  iOSProject
//
//  Created by HuXuPeng on 2017/12/29.
//  Copyright © 2017年 HuXuPeng. All rights reserved.
//

#import "LMJIntroductoryPagesView.h"

@interface LMJIntroductoryPagesView ()<UIScrollViewDelegate>
/** <#digest#> */
@property (nonatomic, strong) NSArray<NSString *> *imagesArray;

@property(nonatomic,strong)UIPageControl *pageControl;

/** <#digest#> */
@property (weak, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIButton *TiyanButton;

@end

@implementation LMJIntroductoryPagesView

+ (instancetype)pagesViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images
{
    LMJIntroductoryPagesView *pagesView = [[self alloc] initWithFrame:frame];
    pagesView.imagesArray = images;
    return pagesView;
}



- (void)setupUIOnce
{
    self.backgroundColor = [UIColor clearColor];

}

- (void)setImagesArray:(NSArray<NSString *> *)imagesArray {
    _imagesArray = imagesArray;
    [self loadPageView];
    [self loadPassButton];
}

- (void)loadPageView
{
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.scrollView.contentSize = CGSizeMake((self.imagesArray.count) * kScreenWidth, kScreenHeight);
    self.pageControl.numberOfPages = self.imagesArray.count;
    
    [self.imagesArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc]init];
        
        imageView.frame = CGRectMake(idx * kScreenWidth, 0, kScreenWidth, kScreenHeight);
        
        YYImage *image = [YYImage imageNamed:obj];
        
        [imageView setImage:image];
        
        [self.scrollView addSubview:imageView];
    }];
}

- (void)loadPassButton {
    // 1.跳过按钮
    CGFloat btnW = 50;
    CGFloat btnH = 24;
    UIButton *_countBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - btnW - 24, kTopHeight - 34, btnW, btnH)];
    [_countBtn addTarget:self action:@selector(handleSingleTapFrom) forControlEvents:UIControlEventTouchUpInside];
    [_countBtn setTitle:@"跳过" forState:UIControlStateNormal];
    _countBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_countBtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    _countBtn.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1/1.0];
    _countBtn.layer.cornerRadius = 12;
    [self addSubview:_countBtn];
    [self bringSubviewToFront:_countBtn];
}

-(void)handleSingleTapFrom
{
    [self removeFromSuperview];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offSet = scrollView.contentOffset;
    NSInteger page = (offSet.x / (self.bounds.size.width) + 0.5);
    self.pageControl.currentPage = page;//计算当前的页码
    self.pageControl.hidden = (page > self.imagesArray.count - 1);
    
    if (_pageControl.currentPage == self.imagesArray.count-1){
        [self addSubview:self.TiyanButton];
    }else {
        [self.TiyanButton removeFromSuperview];
    }
}

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    if (scrollView.contentOffset.x >= (_imagesArray.count) * kScreenWidth) {
//        [self removeFromSuperview];
//    }
//}


- (UIButton *)TiyanButton {
    if (!_TiyanButton) {
        CGFloat btnW = 150;
        CGFloat btnH = 40;
        _TiyanButton = [[UIButton alloc] initWithFrame:CGRectMake((KScreenWidth - btnW)/2.0 , KScreenHeight - 94, btnW, btnH)];
        [_TiyanButton addTarget:self action:@selector(handleSingleTapFrom) forControlEvents:UIControlEventTouchUpInside];
        [_TiyanButton setTitle:@"立即体验" forState:UIControlStateNormal];
        _TiyanButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_TiyanButton setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        _TiyanButton.backgroundColor = [UIColor whiteColor];
        _TiyanButton.layer.cornerRadius = 20;
        _TiyanButton.layer.borderWidth = 0.5;
        _TiyanButton.layer.borderColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0].CGColor;
    }
    return _TiyanButton;
}

- (UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:scrollView];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;//设置分页
        scrollView.bounces = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if(!_pageControl)
    {
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth/2, kScreenHeight - 60, 0, 40)];
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.pageIndicatorTintColor = [UIColor clearColor];
        pageControl.currentPageIndicatorTintColor = [UIColor clearColor];
        [self addSubview:pageControl];
        _pageControl = pageControl;
    }
    return _pageControl;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUIOnce];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUIOnce];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
