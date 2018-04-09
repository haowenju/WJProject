//
//  MainTabBarViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/16.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "RootNavigationController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
@interface MainTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabarItems];
    [self addChildViewControllers];
    [self customizeTabBarAppearance];
    
    self.delegate = self;
}

- (void)addChildViewControllers
{
    RootNavigationController *one = [[RootNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    
    RootNavigationController *two = [[RootNavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]];
    
    self.viewControllers = @[one,two];
    
}

- (void)addTabarItems {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"icon_tabbar_homepage",
                                                 CYLTabBarItemSelectedImage : @"icon_tabbar_homepage_selected",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我",
                                                  CYLTabBarItemImage : @"icon_tabbar_mine",
                                                  CYLTabBarItemSelectedImage : @"icon_tabbar_mine_selected",
                                                  };
    self.tabBarItemsAttributes = @[firstTabBarItemsAttributes,secondTabBarItemsAttributes
                                       ];
    
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance {
    // 自定义 TabBar 高度
    // self.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"00AE68"];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake([UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
// 点击的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    
    // 消除小红点
    if ([self.selectedViewController cyl_isShowTabBadgePoint]) {
        [self badgePointWithIndex:self.selectedIndex isShow:NO];
    }
    // 消除数字
    [self badgeNumberWithIndex:self.selectedIndex Number:nil];
    
    // 动画
    if ([control cyl_isTabButton]) {
        animationView = [control cyl_tabImageView];
    }
    if ([control cyl_isPlusButton]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
    }
    if (self.selectedIndex % 2 == 0) {
        [self addScaleAnimationOnView:animationView repeatCount:1];
    } else {
        [self addRotateAnimationOnView:animationView];
    }
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}


// 小红点
- (void)badgePointWithIndex:(NSInteger)index isShow:(BOOL)show {
    UIViewController *viewController = self.viewControllers[index];
    // 小红点
    UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:KRedColor radius:4.5];
    [self.tabBarItem.cyl_tabButton cyl_setTabBadgePointView:tabBadgePointView0];
    if (show) {
        [viewController cyl_showTabBadgePoint];
    }else{
        [viewController cyl_removeTabBadgePoint];
    }
    
}
// 数字
- (void)badgeNumberWithIndex:(NSInteger)index Number:(NSString *)num {
    UIViewController *viewController = self.viewControllers[index];
    [viewController.tabBarItem setBadgeValue:num];
}
@end
