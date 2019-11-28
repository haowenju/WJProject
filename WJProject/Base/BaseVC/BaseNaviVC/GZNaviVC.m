//
//  GZNaviVC.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/16.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "GZNaviVC.h"
#import "GZBaseVC.h"

#define CNavBgColor  [UIColor colorWithHexString:@"00AE68"]
//#define CNavBgColor  [Ulor colorWithHexString:@"ffffff"]
#define CNavBgFontColor  [UIColor colorWithHexString:@"ffffff"]

@interface GZNaviVC ()

@end

@implementation GZNaviVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//push时隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

/**
 *  返回到指定的类视图
 *
 *  @param ClassName 类名
 *  @param animated  是否动画
 */
-(BOOL)popToPointViewController:(NSString *)ClassName animated:(BOOL)animated
{
    id vc = [self getCurrentViewControllerClass:ClassName];
    if(vc != nil && [vc isKindOfClass:[UIViewController class]])
    {
        [self popToViewController:vc animated:animated];
        return YES;
    }
    
    return NO;
}

/*!
 *  获得当前导航器显示的视图
 *
 *  @param ClassName 要获取的视图的名称
 *
 *  @return 成功返回对应的对象，失败返回nil;
 */
-(instancetype)getCurrentViewControllerClass:(NSString *)ClassName
{
    Class classObj = NSClassFromString(ClassName);
    
    NSArray * szArray =  self.viewControllers;
    for (id vc in szArray) {
        if([vc isMemberOfClass:classObj])
        {
            return vc;
        }
    }
    
    return nil;
}

// 为了更改工具类颜色
-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}
@end
