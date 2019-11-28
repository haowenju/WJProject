//
//  CommonSettingCell.h
//  WJProject
//
//  Created by Admin on 2018/9/14.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonSettingCellAdapterProtocol.h"

@interface CommonSettingCell : UITableViewCell
/**
 *  加载数据(实现了BusinessCardAdapterProtocol协议的数据)
 *
 *  @param data 实现了BusinessCardAdapterProtocol协议的数据
 */
- (void)loadData:(id <CommonSettingCellAdapterProtocol>)data;
@end
