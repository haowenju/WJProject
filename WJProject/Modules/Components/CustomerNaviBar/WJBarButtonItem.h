//
//  WJBarButtonItem.h
//  导航栏
//
//  Created by haowenju on 2019/8/6.
//  Copyright © 2019 ESSC_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WJItemType) {
    WJItemTypeBack = 0, //返回
    WJItemTypeQrcode,
    WJItemTypeScan, 
    WJItemTypeTitle, //自定义title
};

typedef NS_ENUM(NSInteger, WJItemPosition) {
    WJItemPositionLeft = 0, //左
    WJItemPositionRight //右
};

@protocol WJBarButtonItemDelegate <NSObject>
- (void)barButtonItemDidClick:(WJItemType)itemType position:(WJItemPosition)position index:(NSInteger)index;
@end


@interface WJBarButtonItem : UIView
- (instancetype)initItem:(WJItemType)itemType position:(WJItemPosition)position param:(NSDictionary *  __nullable)param delegate:(id<WJBarButtonItemDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
