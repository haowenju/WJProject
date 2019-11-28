//
//  GZBaseTabBarItem.h
//  FengXing
//
//  Created by shizhankun on 2018/10/24.
//  Copyright © 2018年 fengxingtianxia. All rights reserved.
//


@class GZBaseTabBarItem;
@protocol GZBaseTabBarItemDelegate <NSObject>
@optional
- (void)itemDidClick:(GZBaseTabBarItem *)clickItem;
@end


@interface GZBaseTabBarItem : UIView
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic,assign) BOOL selected;
@property (nonatomic,weak) id<GZBaseTabBarItemDelegate>delegate;

/**
 通过title和image各个状态初始化item
 @return item
 */
+(GZBaseTabBarItem *)createItemWithTitle:(NSString *)title titleColorNormal:(UIColor *)titleColorNormal imageNameNormal:(NSString *)imageNameNormal titleColorSelected:(UIColor *)titleColorSelected imageNameSelected:(NSString *)imageNameSelected index:(NSUInteger)index;

@end


