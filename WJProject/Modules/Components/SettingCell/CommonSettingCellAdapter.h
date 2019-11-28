//
//  CommonSettingCellAdapter.h
//  WJProject
//
//  Created by Admin on 2018/9/14.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonSettingCellAdapterProtocol.h"

@interface CommonSettingCellAdapter : NSObject <CommonSettingCellAdapterProtocol>

/**
 *  输入对象
 */
@property (nonatomic, weak) id data;

/**
 *  与输入对象建立联系
 *
 *  @param data 输入的对象
 *
 *  @return 实例对象
 */
- (instancetype)initWithData:(id)data;

@end
