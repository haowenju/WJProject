//
//  LBXPermission.h
//  LBXKits
//
//  Created by lbx on 2017/9/7.
//  Copyright © 2017年 lbx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBXPermissionSetting.h"


typedef NS_ENUM(NSInteger,LBXPermissionType)
{
    LBXPermissionType_Location, // 定位
    LBXPermissionType_Camera, // 相机
    LBXPermissionType_Photos, // 照片
    LBXPermissionType_Contacts, // 联系人
    LBXPermissionType_Reminders, // 提醒事项
    LBXPermissionType_Calendar, // 日历
    LBXPermissionType_Microphone, // 麦克风
    LBXPermissionType_Health, // 健康
    LBXPermissionType_DataNetwork // 网络
};

@interface LBXPermission : NSObject

// [LBXPermission authorizedWithType:LBXPermissionType_Camera];

// 某项权限是否打开
+ (BOOL)authorizedWithType:(LBXPermissionType)type;


//[LBXPermission authorizeWithType:LBXPermissionType_Camera completion:^(BOOL granted, BOOL firstTime) {
//
//    if (granted) {
//        //TODO
//        //dosth
//    }
//    else if (!firstTime)
//    {
//        //不是第一次请求权限，那么可以弹出权限提示，用户选择设置，即跳转到设置界面，设置权限
//        [LBXPermissionSetting showAlertToDislayPrivacySettingWithTitle:@"提示" msg:@"没有相机权限，是否前往设置" cancel:@"取消" setting:@"设置"];
//    }
//}];

// 请求某项权限
+ (void)authorizeWithType:(LBXPermissionType)type completion:(void(^)(BOOL granted,BOOL firstTime))completion;





/**
 only effective for location servince,other type reture YES
 
 
 @param type permission type,when type is not location,return YES
 @return YES if system location privacy service enabled NO othersize
 */
//+ (BOOL)isServicesEnabledWithType:(LBXPermissionType)type;


/**
 whether device support the type
 
 @param type permission type
 @return  YES if device support
 
 */
//+ (BOOL)isDeviceSupportedWithType:(LBXPermissionType)type;
@end
