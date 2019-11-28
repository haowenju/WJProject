//
//  AdPageView.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/22.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 启动广告页面
 */

// 广告显示的时间
static int const showtime = 5;

typedef void(^TapBlock)();

@interface AdPageView : UIView
// 初始化
- (instancetype)initWithFrame:(CGRect)frame withTapBlock:(TapBlock)tapBlock;

@end
