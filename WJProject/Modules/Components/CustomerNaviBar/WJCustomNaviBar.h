//
//  WJCustomNaviBar.h
//  导航栏
//
//  Created by haowenju on 2019/8/6.
//  Copyright © 2019 ESSC_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJBarButtonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface WJCustomNaviBar : UIView
@property (nonatomic,copy) NSString                                     *title;
@property (nonatomic,strong) UIView                                     *titleView;
@property (nonatomic, strong) WJBarButtonItem   *leftBarButtonItem;
@property (nonatomic, strong) WJBarButtonItem   *rightBarButtonItem;

+ (instancetype)customNaviBar;
- (void)setBottomLineHidden:(BOOL)hidden;
- (void)setBackgroundColor:(nullable UIColor *)barBackgroundColor;
- (void)setBackgroundImage:(nullable UIImage *)barBackgroundImage;
- (void)setBackgroundAlpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
