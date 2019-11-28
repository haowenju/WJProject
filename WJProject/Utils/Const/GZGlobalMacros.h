//
//  GZGlobalMacros.h
//  WJProject
//
//  Created by haowenju on 2019/11/6.
//  Copyright © 2019 wenju hao. All rights reserved.
//

#ifndef GZGlobalMacros_h
#define GZGlobalMacros_h

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]


// 状态栏
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
// 导航栏
#define kNavBarHeight 44.0
// 状态栏 + 导航栏
#define kTopHeight (kStatusBarHeight + kNavBarHeight)
// 底部安全区
#define kSafeBottomHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20 ? 34 : 0)
// tabbar
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
// 获取屏幕宽高
#define KScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

// 适配宽高
#define kScale_W(value) (!IS_SCREEN_47_INCH?(value)*KScreenWidth/375:(value))
#define kScale_H(value) (!IS_SCREEN_47_INCH?(value)*KScreenHeight/667:(value))

// 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

// 随屏幕大小改变字号
#define FontNumber(font) (KScreenWidth!=375?floor((font)*KScreenWidth/375):font)
#define kSYSTEMFONTB(FONTSIZE) [UIFont boldSystemFontOfSize:FontNumber(FONTSIZE)]
#define kSYSTEMFONT(FONTSIZE) [UIFont systemFontOfSize:FontNumber(FONTSIZE)]

#define RGBACOLOR(aRed,aGreen,aBlue,aAlpha) [UIColor colorWithRed:(aRed)/255.0 green:(aGreen)/255.0 blue:(aBlue)/255.0 alpha:(aAlpha)]

// 数据验证区
#define SafeStr(f)(StrValid(f)?f:@"")
#define HasString(str,eky)([str rangeOfString:key].location!=NSNotFound)
#define ValidStr(f)(f!=nil &&[f isKindOfClass:[NSString class]]&& ![f isEqualToString:@""])
#define ValidDict(f)(f!=nil &&[f isKindOfClass:[NSDictionary class]])
#define ValidArray(f)(f!=nil &&[f isKindOfClass:[NSArray class]]&&[f count]>0)
#define ValidNum(f)(f!=nil &&[f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls)(f!=nil &&[f isKindOfClass:[cls class]])
#define ValidData(f)(f!=nil &&[f isKindOfClass:[NSData class]])


//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

#endif /* GZGlobalMacros_h */
