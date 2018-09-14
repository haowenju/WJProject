//
//  SomeModelAdapter.m
//  WJProject
//
//  Created by Admin on 2018/9/14.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "SomeModelAdapter.h"
#import "SomeModel.h"

@implementation SomeModelAdapter
// 如果传入多个不同的model 根据类型判断返回不同的东西，那么就是对象适配器了
// if ([self.data isMemberOfClass:[SomeModel class]])

- (NSString *)title {
    SomeModel *model = self.data;
    return model.someName;
}

- (NSString *)subTitle {
    SomeModel *model = self.data;
    return model.someDescribe;
}

- (BOOL)noRightArrow {
    return nil;
}

@end
