//
//  WJCustomNaviBar.m
//  导航栏
//
//  Created by haowenju on 2019/8/6.
//  Copyright © 2019 ESSC_iOS. All rights reserved.
//

#import "WJCustomNaviBar.h"

@interface WJCustomNaviBar ()
@property (nonatomic, strong) UIView            *backgroundView; // 最下层
@property (nonatomic, strong) UIImageView  *backgroundImageView;
@property (nonatomic, strong) UILabel           *titleLabel;
@property (nonatomic, strong) UIView            *bottomLine;
@end


static float const kWJGap = 5.0f;

@implementation WJCustomNaviBar
@synthesize leftBarButtonItem = _leftBarButtonItem;
@synthesize rightBarButtonItem = _rightBarButtonItem;
@synthesize titleView = _titleView;

+ (instancetype)customNaviBar {
    WJCustomNaviBar *navigationBar = [[self alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kTopHeight)];
    return navigationBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(void)setupView {
    [self addSubview:self.backgroundView];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.leftBarButtonItem];
    [self addSubview:self.rightBarButtonItem];
    [self addSubview:self.titleView];
    [self addSubview:self.bottomLine];
    [self updateFrame];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
}

-(void)updateFrame {
    // 这四个是固定的
    self.backgroundView.frame = self.bounds;
    self.backgroundImageView.frame = self.bounds;
    self.bottomLine.frame = CGRectMake(0, (CGFloat)(self.bounds.size.height-0.5), kScreenWidth, 0.5);
    // 另外三个是相对布局
    [self subViewMasonry];
}

- (void)subViewMasonry {
    [self.leftBarButtonItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(kNavBarHeight);
        make.width.mas_equalTo(self.leftBarButtonItem.bounds.size.width);
    }];
    [self.rightBarButtonItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(kNavBarHeight);
        make.width.mas_equalTo(self.rightBarButtonItem.bounds.size.width);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(kStatusBarHeight / 2.0);
        make.left.equalTo(self.leftBarButtonItem.mas_right).offset(kWJGap);
        make.right.equalTo(self.rightBarButtonItem.mas_left).offset(-kWJGap);
        make.height.mas_equalTo(kNavBarHeight);
    }];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(kStatusBarHeight / 2.0);
        make.left.equalTo(self.leftBarButtonItem.mas_right).offset(kWJGap);
        make.right.equalTo(self.rightBarButtonItem.mas_left).offset(-kWJGap);
        make.height.mas_equalTo(self.titleView.bounds.size.height);
    }];
    [self bringSubviewToFront:self.bottomLine];
}


#pragma mark - public method
- (void)setBottomLineHidden:(BOOL)hidden {
    self.bottomLine.hidden = hidden;
}
- (void)setBackgroundColor:(nullable UIColor *)barBackgroundColor {
    self.backgroundView.backgroundColor = barBackgroundColor;
}
- (void)setBackgroundImage:(nullable UIImage *)barBackgroundImage {
    self.backgroundImageView.image = barBackgroundImage;
}
- (void)setBackgroundAlpha:(CGFloat)alpha {
    self.backgroundView.alpha = alpha;
    self.backgroundImageView.alpha = alpha;
    self.bottomLine.alpha = alpha;
}
#pragma mark - setter
- (void)setTitle:(NSString *)title {
    self.titleView.hidden = YES;
    self.titleLabel.hidden = NO;
    self.titleLabel.text = title;
}

- (void)setLeftBarButtonItem:(WJBarButtonItem *)leftBarButtonItem {
    [_leftBarButtonItem removeFromSuperview];
    _leftBarButtonItem = leftBarButtonItem;
    [self addSubview:leftBarButtonItem];
    [self subViewMasonry];
}

- (void)setRightBarButtonItem:(WJBarButtonItem *)rightBarButtonItem {
    [_rightBarButtonItem removeFromSuperview];
    _rightBarButtonItem = rightBarButtonItem;
    [self addSubview:rightBarButtonItem];
    [self subViewMasonry];
}

- (void)setTitleView:(UIView *)titleView {
    [_titleView removeFromSuperview];
    _titleView = titleView;
    [self addSubview:titleView];
    self.titleView.hidden = NO;
    self.titleLabel.hidden = YES;
    [self subViewMasonry];
}

#pragma mark - getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] init];
    }
    return _titleView;
}
- (WJBarButtonItem *)leftBarButtonItem {
    if (!_leftBarButtonItem) {
        _leftBarButtonItem = [[WJBarButtonItem alloc] initWithFrame:CGRectMake(0, 0, kWJGap, 0)];
    }
    return _leftBarButtonItem;
}

- (WJBarButtonItem *)rightBarButtonItem {
    if (!_rightBarButtonItem) {
        _rightBarButtonItem = [[WJBarButtonItem alloc] initWithFrame:CGRectMake(0, 0, kWJGap, 0)];
    }
    return _rightBarButtonItem;
}
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
    }
    return _backgroundView;
}
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
    }
    return _backgroundImageView;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor colorWithRed:(CGFloat)(218.0/255.0) green:(CGFloat)(218.0/255.0) blue:(CGFloat)(218.0/255.0) alpha:1.0];
    }
    return _bottomLine;
}
@end
