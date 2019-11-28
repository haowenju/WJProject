//
//  WJCustomSearchBar.h
//  导航栏
//
//  Created by haowenju on 2019/8/13.
//  Copyright © 2019 ESSC_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WJCustomSearchBarIconPosition) {
    WJCustomSearchBarIconLeft = 0, //左
    WJCustomSearchBarIconRight, //右
};

@class WJCustomSearchBar;

@protocol WJCustomSearchBarDelegate <UIBarPositioningDelegate>
@optional
// 是否开始编辑
- (BOOL)searchBarShouldBeginEditing:(WJCustomSearchBar *)searchBar;
//开始编辑
- (void)searchBarTextDidBeginEditing:(WJCustomSearchBar *)searchBar;
// 是否结束编辑
- (BOOL)searchBarShouldEndEditing:(WJCustomSearchBar *)searchBar;
// 结束编辑
- (void)searchBarTextDidEndEditing:(WJCustomSearchBar *)searchBar;
// 输入更改了
- (void)searchBar:(WJCustomSearchBar *)searchBar textDidChange:(NSString *)searchText;
// 搜索
- (void)searchBarSearchButtonClicked:(WJCustomSearchBar *)searchBar;
// 左右按钮点击
- (void)searchBarIconClicked:(WJCustomSearchBarIconPosition)positon;
@end

@interface WJCustomSearchBar : UIView
@property (nullable, nonatomic, weak) id<WJCustomSearchBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame leftIcon:(NSString *)leftIcon rightIcon:(NSString *)rightIcon placeholder:(NSString *)placeholder;

@property (nonatomic, copy) NSString *placeholder;
@end

NS_ASSUME_NONNULL_END
