//
//  CommonSettingCellAdapterProtocol.h
//  WJProject
//
//  Created by Admin on 2018/9/14.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommonSettingCellAdapterProtocol <NSObject>
- (NSString *)title;

- (NSString *)subTitle;

- (BOOL)noRightArrow;
@end
