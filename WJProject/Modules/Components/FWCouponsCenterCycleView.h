//
//  FWCouponsCenterCycleView.h
//  MarketB2B
//
//  Created by Admin on 2018/8/6.
//  Copyright © 2018年 FW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    cycleType_receive = 0,
    cycleType_use,
    cycleType_look,
} cycleType;

@interface FWCouponsCenterCycleView : UIView
- (void)setUpSendedPer:(long)sendedPer cycleType:(NSUInteger)type;
@end
