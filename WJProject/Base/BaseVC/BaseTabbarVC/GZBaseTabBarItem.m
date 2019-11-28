//
//  GZBaseTabBarItem.m
//  FengXing
//
//  Created by shizhankun on 2018/10/24.
//  Copyright © 2018年 fengxingtianxia. All rights reserved.
//

#import "GZBaseTabBarItem.h"

@interface GZBaseTabBarItem()

/**
 蒙版btn
 */
@property (nonatomic,strong) UIButton *menuBtn ;
@property (nonatomic,strong) UIImageView *imageContentView;
@property (nonatomic,strong) UILabel *titleLabel ;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) UIColor *titleColorNormal;
@property (nonatomic,strong) UIImage *imageNormal;
@property (nonatomic,copy) UIColor *titleColorSelected;
@property (nonatomic,strong) UIImage *imageSelected;
@end

@implementation GZBaseTabBarItem

#pragma mark - create
-(void)layoutSubviews{
    [super layoutSubviews];
    self.menuBtn.frame = self.bounds ;
    CGFloat imageContentViewWH = 20 ;
    self.imageContentView.frame = CGRectMake(self.width*0.5 - imageContentViewWH*0.5, 6, imageContentViewWH, imageContentViewWH);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageContentView.frame) + 4, self.width, 15);
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageContentView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.menuBtn];
    }
    return self ;
}

+(GZBaseTabBarItem *)createItemWithTitle:(NSString *)title titleColorNormal:(UIColor *)titleColorNormal imageNameNormal:(NSString *)imageNameNormal  titleColorSelected:(UIColor *)titleColorSelected imageNameSelected:(NSString *)imageNameSelected index:(NSUInteger)index{
    
    GZBaseTabBarItem *item = [[GZBaseTabBarItem alloc]init];
    [item updateItemWithTitle:title titleColorNormal:titleColorNormal imageNameNormal:imageNameNormal titleColorSelected:titleColorSelected imageNameSelected:imageNameSelected index:index];
    return item ;
    
}

-(void)updateItemWithTitle:(NSString *)title titleColorNormal:(UIColor *)titleColorNormal imageNameNormal:(NSString *)imageNameNormal titleColorSelected:(UIColor *)titleColorSelected imageNameSelected:(NSString *)imageNameSelected index:(NSUInteger)index{
    self.index = index;
    self.title = title;
    self.titleColorNormal = titleColorNormal ;
    self.imageNormal = [UIImage imageNamed:imageNameNormal];
    self.titleColorSelected = titleColorSelected ;
    self.imageSelected = [UIImage imageNamed:imageNameSelected];
    
    self.titleLabel.text = title;
    self.titleLabel.textColor = titleColorNormal ;
    self.imageContentView.image = self.imageNormal ;
}



#pragma mark - action

-(void)menuBtnDidClick:(UIButton *)menuBtn{
    if ([self.delegate respondsToSelector:@selector(itemDidClick:)]) {
        [self.delegate itemDidClick:self];
    }
}

#pragma mark - setter & getter
-(void)setSelected:(BOOL)selected{
    _selected = selected;
    if (selected) {
        self.titleLabel.textColor = _titleColorSelected ;
        self.imageContentView.image = _imageSelected ;
    }else{
        self.titleLabel.textColor = _titleColorNormal ;
        self.imageContentView.image = _imageNormal ;
    }
}


-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter ;
        _titleLabel.font = kSYSTEMFONT(12);
    }
    return _titleLabel ;
}

-(UIImageView *)imageContentView{
    if (!_imageContentView) {
        _imageContentView = [[UIImageView alloc]init];
        _imageContentView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageContentView ;
}

-(UIButton *)menuBtn{
    if (!_menuBtn) {
        _menuBtn = [[UIButton alloc]init];
        [_menuBtn addTarget:self action:@selector(menuBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _menuBtn ;
}

@end
