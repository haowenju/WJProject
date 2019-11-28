//
//  GZBaseTabBar.h
//  FengXing
//
//  Created by shizhankun on 2018/10/24.
//  Copyright © 2018年 fengxingtianxia. All rights reserved.
//

#import "GZBaseTabBarItem.h"
#import <UIKit/UIKit.h>
@protocol GZBaseTabBarDelegate <NSObject>
@optional
- (void)tabBarDidClickedItem:(NSUInteger)index;
@end



@interface GZBaseTabBar : UIView
@property (nonatomic,weak) id <GZBaseTabBarDelegate> delegate ;
@property (nonatomic,strong) NSMutableArray *tabbarItems ;

-(void)switchTabbarToIndex:(NSUInteger)index;
@end


