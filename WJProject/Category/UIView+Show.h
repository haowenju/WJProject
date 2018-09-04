//
//  UIView+Show.h
//  WJProject
//
//  Created by Admin on 2018/9/4.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    transform_bottom, // 创建的时候就在屏幕下面
    transform_scale, // 只用给宽高
} transformType;

@interface UIView (Show)

- (void)showInWindowByTransformType:(transformType)type;
- (void)hideFromWindow;

@end
