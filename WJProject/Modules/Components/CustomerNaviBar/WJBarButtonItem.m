//
//  WJBarButtonItem.m
//  导航栏
//
//  Created by haowenju on 2019/8/6.
//  Copyright © 2019 ESSC_iOS. All rights reserved.
//

#import "WJBarButtonItem.h"

@interface WJBarButtonItem ()
@property (nonatomic, weak) id<WJBarButtonItemDelegate> delegate;
@property (nonatomic, assign) WJItemType itemType;
@property (nonatomic, assign) WJItemPosition position;

@end

#define TagValue  1000
@implementation WJBarButtonItem

- (instancetype)initItem:(WJItemType)itemType position:(WJItemPosition)position param:(NSDictionary *  __nullable)param delegate:(id<WJBarButtonItemDelegate>)delegate {
    if (self = [super init]) {
        self.itemType = itemType;
        self.position = position;
        self.delegate = delegate;
        [self configItem];
    }
    return self ;
}

- (void)configItem {
    CGFloat itemWH = 35 ;
    switch (self.itemType) {
        case WJItemTypeBack:
        {
            self.frame = CGRectMake(0, 0, itemWH, kNavBarHeight);
            UIButton *btn = [self buttonConfig:CGRectMake(0, 0, itemWH, kNavBarHeight) title:nil titleColor:nil font:nil Image:@"返回" highlightImage:nil btnTag:1];
            [self addSubview:btn];
        }
            break;
        case WJItemTypeQrcode:
        {
            self.frame = CGRectMake(0, 0, itemWH, kNavBarHeight);
            UIButton *btn = [self buttonConfig:CGRectMake(0, 0, itemWH, kNavBarHeight) title:nil titleColor:nil font:nil Image:@"qrcode" highlightImage:nil btnTag:1];
            [self addSubview:btn];
        }
            break;
        case WJItemTypeScan:
        {
            self.frame = CGRectMake(0, 0, itemWH, kNavBarHeight);
            UIButton *btn = [self buttonConfig:CGRectMake(0, 0, itemWH, kNavBarHeight) title:nil titleColor:nil font:nil Image:@"scanIcon" highlightImage:nil btnTag:1];
            [self addSubview:btn];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - event
-(void)barButtonItemDidClickWithClickBtn:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(barButtonItemDidClick:position:index:)]) {
        [self.delegate barButtonItemDidClick:self.itemType position:self.position index:(button.tag - TagValue)];
    }
}

-(UIButton *)buttonConfig:(CGRect)frame
                    title:(NSString *)title
               titleColor:(UIColor *)titleColor
                     font:(UIFont *)font
                    Image:(NSString *)image
           highlightImage:(NSString *)highlightImage
                      btnTag:(NSInteger)btnTag {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    if (ValidStr(title)) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        [btn.titleLabel setFont:font];
    }
    if (ValidStr(image)) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    }
    btn.tag = TagValue + btnTag;
    [btn addTarget:self action:@selector(barButtonItemDidClickWithClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
