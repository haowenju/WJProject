//
//  UIView+Show.m
//  WJProject
//
//  Created by Admin on 2018/9/4.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "UIView+Show.h"
#define TagValue  1000
#define AlertTime 0.3 //弹出动画时间
#define DropTime 0.5 //落下动画时间

static NSString *Key = @"type";

@implementation UIView (Show)

-(void)showInWindowByTransformType:(transformType)type{
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [self removeBackView];
    
    // 灰色背景
    UIView *iview = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    iview.tag = TagValue;
    iview.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideFromWindow)];
    [iview addGestureRecognizer:tap];
    iview.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    // 添加到window
    [[UIApplication sharedApplication].keyWindow addSubview:iview];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    switch (type) {
        case transform_bottom:
        {
            objc_setAssociatedObject(self, &Key, @"0", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [UIView animateWithDuration:AlertTime animations:^{
                self.transform = CGAffineTransformMakeTranslation(0,-self.height);
            }];
            break;
        }
        case transform_scale:
        {
            objc_setAssociatedObject(self, &Key, @"1", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.center = [UIApplication sharedApplication].keyWindow.center;
            self.alpha = 0;
            self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
            [UIView animateWithDuration:AlertTime animations:^{
                self.transform = CGAffineTransformIdentity;
                self.alpha = 1;
            }];
            break;
        }
            
        default:
            break;
    }
}


//弹出隐藏
-(void)hideFromWindow {
    if (self.superview) {
        NSString *type = objc_getAssociatedObject(self, &Key);
        if ([type isEqualToString:@"0"]) {
            [UIView animateWithDuration:AlertTime animations:^{
                self.transform = CGAffineTransformMakeTranslation(0,self.height);
            } completion:^(BOOL finished) {
                [self removeBackView];
                [self removeFromSuperview];
            }];
        }else {
            [UIView animateWithDuration:AlertTime animations:^{
                self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeBackView];
                [self removeFromSuperview];
            }];
        }
    }
}

- (void)removeBackView {
    UIView *bgview = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (bgview) {
        [bgview removeFromSuperview];
    }
}
@end
