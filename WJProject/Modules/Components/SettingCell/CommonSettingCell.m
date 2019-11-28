//
//  CommonSettingCell.m
//  WJProject
//
//  Created by Admin on 2018/9/14.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "CommonSettingCell.h"

@interface CommonSettingCell()
@property (strong, nonatomic) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (strong, nonatomic) UIImageView *imageViewRight;
@end

@implementation CommonSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell页面布局
        [self loadComponent];
    }
    return self;
}

- (void)loadComponent {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithHexString:@"666666"];
    label.font = kSYSTEMFONT(14);
    [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    self.titleLabel = label;
    [self.contentView addSubview:self.titleLabel];
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.textColor = [UIColor colorWithHexString:@"333333"];
    subTitleLabel.font = kSYSTEMFONT(14);
    subTitleLabel.textAlignment = NSTextAlignmentRight;
    self.subTitleLabel = subTitleLabel;
    [self.contentView addSubview:self.subTitleLabel];
    
    UIImageView *imageViewRight = [[UIImageView alloc] init];
    imageViewRight.image = [UIImage imageNamed:@"jinru"];
    self.imageViewRight = imageViewRight;
    [self.contentView addSubview:imageViewRight];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self p_addMasonry];
}

- (void)p_addMasonry {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(14);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(self.contentView.mas_height);
        make.right.equalTo(self.contentView.mas_right).offset(-36);
        make.left.equalTo(self.titleLabel.mas_right).offset(10);
    }];
    
    [self.imageViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-14);
        make.height.equalTo(@12);
        make.width.equalTo(@12);
    }];
    
    UIView *line = [[UIView alloc] init];
    [self.contentView addSubview:line];
    line.backgroundColor = [UIColor colorWithHexString:@"F2F1F6"];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(@0.5);
    }];
}

- (void)loadData:(id <CommonSettingCellAdapterProtocol>)data {
    NSString *title = [data title];
    NSString *subTitle = [data subTitle];
    BOOL noRightArrow = [data noRightArrow];
    
    self.titleLabel.text = ValidStr(title) ? title : @"";
    self.subTitleLabel.text = ValidStr(subTitle) ? subTitle : @"";
    if (noRightArrow) { // 没有右箭头
        self.imageViewRight.hidden = YES;
        [self.subTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-14);
        }];
    }else {
        self.imageViewRight.hidden = NO;
        [self.subTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-36);
        }];
    }
}



@end
