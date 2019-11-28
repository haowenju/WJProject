//
//  FWCouponsCenterCycleView.m
//  MarketB2B
//
//  Created by Admin on 2018/8/6.
//  Copyright © 2018年 FW. All rights reserved.
//

#import "FWCouponsCenterCycleView.h"
#import <Masonry.h>

@interface FWCouponsCenterCycleView ()
@property (strong, nonatomic)CAShapeLayer *ovalSShapeLayer;
@property (strong, nonatomic)CAShapeLayer *redShapeLayer;

@property (strong, nonatomic)UILabel *titleLabel;
@property(assign,nonatomic) long sendedPer;//  (integer, optional): 已发放百分比 ,
@end

@implementation FWCouponsCenterCycleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadComponent];
    }
    return self;
}

- (void)loadComponent {
    // 中间的layer
    [self.layer addSublayer:self.ovalSShapeLayer];
    // 进度条layer
    [self.layer addSublayer:self.redShapeLayer];
    [self addSubview:self.titleLabel];
}

// 如果是相对布局 可以把布局写在构造方法中  但是这里的layer只能用frame，所以写在了layoutSubviews 这里可以获取到正确的frame
// masonry布局后 直接获取frame是0 因为约束转化成frame需要时间
- (void)layoutSubviews {
    [super layoutSubviews];
    // 半径
    CGFloat ovalRadius = self.frame.size.height/2.0;
    double stroke = self.sendedPer / 200.0; // 要旋转的角度
    // 在rect里面画椭圆
    self.ovalSShapeLayer.path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalRadius * 2, ovalRadius * 2)].CGPath;
    // 画圆，并规定起始角度
    self.redShapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(ovalRadius, ovalRadius) radius:ovalRadius startAngle:2*M_PI * (-stroke + 0.25) endAngle:2*M_PI*(stroke + 0.25) clockwise:YES].CGPath;
    self.titleLabel.frame = CGRectMake(0, 0, ovalRadius * 2.0,  ovalRadius * 2.0);
}

- (void)setUpSendedPer:(long)sendedPer cycleType:(NSUInteger)type {
    _sendedPer = sendedPer;
    switch (type) {
        case 0:
        {
            self.titleLabel.text = [NSString stringWithFormat:@"已抢\n%ld%%",_sendedPer];
            self.titleLabel.textColor = [UIColor colorWithHexString:@"F12525"];
        }
            break;
        case 1:
        {
            self.titleLabel.text = @"已领";
            self.titleLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        }
            break;
        case 2:
        {
            self.titleLabel.text = @"已抢光";
            self.titleLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        }
            break;
            
        default:
            break;
    }
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kSYSTEMFONT(12);
        _titleLabel.numberOfLines = 2;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (CAShapeLayer *)ovalSShapeLayer {
    if (!_ovalSShapeLayer) {
        _ovalSShapeLayer = [[CAShapeLayer alloc]init];
        //内部填充颜色
        _ovalSShapeLayer.fillColor = [UIColor cyanColor].CGColor;
    }
    return _ovalSShapeLayer;
}

- (CAShapeLayer *)redShapeLayer {
    if (!_redShapeLayer) {
        _redShapeLayer = [[CAShapeLayer alloc]init];
        _redShapeLayer.strokeColor = [UIColor colorWithHexString:@"F12525"].CGColor;
        _redShapeLayer.fillColor = nil;
        _redShapeLayer.lineWidth = 3;
        _redShapeLayer.lineCap = kCALineCapRound;
    }
    return _redShapeLayer;
}
@end
