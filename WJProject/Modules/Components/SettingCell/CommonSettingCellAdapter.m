//
//  CommonSettingCellAdapter.m
//  WJProject
//
//  Created by Admin on 2018/9/14.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "CommonSettingCellAdapter.h"

@implementation CommonSettingCellAdapter

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    if (self) {
        
        self.data = data;
    }
    
    return self;
}

- (NSString *)title {
    return nil;
}

- (NSString *)subTitle {
    return nil;
}

- (BOOL)noRightArrow {
    return nil;
}

@end
