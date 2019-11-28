//
//  GZTabbarVC.m
//  WJProject
//
//  Created by haowenju on 2019/11/6.
//  Copyright © 2019 wenju hao. All rights reserved.
//

#import "GZTabbarVC.h"
#import "GZBaseTabBar.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "GZNaviVC.h"

@interface GZTabbarVC ()<GZBaseTabBarDelegate>
@property (nonatomic,strong) GZBaseTabBar *tabbarCustom;
@end

@implementation GZTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    self.tabBar.translucent = NO;
    [self setUpChildVC];
    [self.tabBar addSubview:self.tabbarCustom];
    [self.tabbarCustom switchTabbarToIndex:0];
}


#pragma mark - Public Methods
-(void)switchTabbarToIndex:(NSUInteger)index{
    [self.tabbarCustom switchTabbarToIndex:index];
}

#pragma mark - private methods
- (void)setUpChildVC{
    GZNaviVC *vc1 = [[GZNaviVC alloc] initWithRootViewController:[HomeViewController new]];
    GZNaviVC *vc2 = [[GZNaviVC alloc] initWithRootViewController:[MineViewController new]];
    self.viewControllers = @[vc1,vc2];
}
#pragma mark tabbarVC delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController{
    
}

#pragma mark - FXBaseTabBarDelegate
-(void)tabBarDidClickedItem:(NSUInteger)index{
    self.selectedIndex = index;
}


- (GZBaseTabBar *)tabbarCustom {
    if (!_tabbarCustom) {
        _tabbarCustom = [[GZBaseTabBar alloc]init];
        _tabbarCustom.frame = self.tabBar.bounds;
        _tabbarCustom.delegate = self ;
        _tabbarCustom.backgroundColor = [UIColor whiteColor];
        
        UIColor *titleNormalColor = RGBACOLOR(153, 153, 153, 1);
        UIColor *titleSelectedColor = RGBACOLOR(219, 53, 57, 1);
        
        GZBaseTabBarItem *managerItem = [GZBaseTabBarItem createItemWithTitle:@"商品管理" titleColorNormal:titleNormalColor imageNameNormal:@"icon_goods_show_defult" titleColorSelected:titleSelectedColor imageNameSelected:@"icon_goods_show_selected" index:0];
        
        GZBaseTabBarItem *consoleItem = [GZBaseTabBarItem createItemWithTitle:@"控制台" titleColorNormal:titleNormalColor imageNameNormal:@"icon_workspace_defult" titleColorSelected:titleSelectedColor imageNameSelected:@"icon_workspace_selected" index:1];
    
        _tabbarCustom.tabbarItems = @[managerItem,consoleItem].mutableCopy;
    }
    return _tabbarCustom;
}
@end
