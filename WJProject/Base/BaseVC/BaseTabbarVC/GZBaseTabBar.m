//
//  GZBaseTabBar.m
//  FengXing
//
//  Created by shizhankun on 2018/10/24.
//  Copyright © 2018年 fengxingtianxia. All rights reserved.
//

#import "GZBaseTabBar.h"

@interface GZBaseTabBar ()<GZBaseTabBarItemDelegate>

@property (nonatomic,weak) GZBaseTabBarItem *currentSelectedItem ;

@end

@implementation GZBaseTabBar

@synthesize tabbarItems = _tabbarItems ;

#pragma mark - layout

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSInteger childCount = self.tabbarItems.count ;
    NSInteger currentIndex = 0 ;
    CGFloat elementWidth = self.frame.size.width/childCount ;
    CGFloat elementHeight = self.frame.size.height ;
    
    for (GZBaseTabBarItem *item in self.tabbarItems) {
        CGFloat x = elementWidth*currentIndex ;
        item.frame = CGRectMake(x, 0, elementWidth, elementHeight);
        currentIndex ++ ;
    }
}

#pragma mark - public
-(void)switchTabbarToIndex:(NSUInteger)index{
    if (index == self.currentSelectedItem.index) {
        return;
    }
    GZBaseTabBarItem *item = self.tabbarItems[index];
    [self itemDidClick:item];
}
#pragma mark - FXBaseTabBarItemDelegate
- (void)itemDidClick:(GZBaseTabBarItem *)clickItem{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedItem:)]){
        self.currentSelectedItem.selected = NO ;
        self.currentSelectedItem = clickItem ;
        self.currentSelectedItem.selected = YES ;
        [self.delegate tabBarDidClickedItem:clickItem.index];
    }
}


#pragma mark - setter & getter
-(void)setTabbarItems:(NSMutableArray *)tabbarItems{
    _tabbarItems = tabbarItems ;
    for (GZBaseTabBarItem *item in tabbarItems) {
        [self addSubview:item];
        item.delegate = self ;
    }
    self.currentSelectedItem = tabbarItems[0];
    self.currentSelectedItem.selected = YES;
}

-(NSMutableArray *)tabbarItems{
    if (!_tabbarItems) {
        _tabbarItems = [NSMutableArray array];
    }
    return _tabbarItems ;
}


@end
