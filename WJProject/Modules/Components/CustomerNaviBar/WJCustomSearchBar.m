//
//  WJCustomSearchBar.m
//  导航栏
//
//  Created by haowenju on 2019/8/13.
//  Copyright © 2019 ESSC_iOS. All rights reserved.
//

#import "WJCustomSearchBar.h"

@interface WJCustomSearchBar ()<UITextFieldDelegate>
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, copy) NSString *leftIcon;
@property (nonatomic, copy) NSString *rightIcon;
@end

@implementation WJCustomSearchBar

// 这个frame 宽度最后会在导航栏中自适应  起作用的只是这个高度
- (instancetype)initWithFrame:(CGRect)frame leftIcon:(NSString *)leftIcon rightIcon:(NSString *)rightIcon placeholder:(NSString *)placeholder{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = frame.size.height / 2.0;
        self.layer.masksToBounds = YES;
        self.leftIcon = leftIcon;
        self.rightIcon = rightIcon;
        self.placeholder = placeholder;
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews {
    [self addSubview:self.leftBtn];
    [self addSubview:self.textField];
    [self addSubview:self.rightBtn];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        CGFloat width = ValidStr(self.leftIcon) ? self.bounds.size.height : 0;
        make.width.mas_equalTo(width);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-5);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        CGFloat width = ValidStr(self.rightIcon) ? self.bounds.size.height : 0;
        make.width.mas_equalTo(width);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftBtn.mas_right);
        make.right.equalTo(self.rightBtn.mas_left);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]){
        return [self.delegate searchBarShouldBeginEditing:self];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]) {
        [self.delegate searchBarTextDidBeginEditing:self];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]){
        return [self.delegate searchBarShouldEndEditing:self];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)]){
        [self.delegate searchBarTextDidEndEditing:self];
    }
}
- (void)textFieldDidChange:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)]){
        [self.delegate searchBar:self textDidChange:textField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)]){
        [self.delegate searchBarSearchButtonClicked:self];
    }
    return YES;
}
#pragma event
- (void)leftBtnAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarIconClicked:)]){
        [self.delegate searchBarIconClicked:WJCustomSearchBarIconLeft];
    }
}

- (void)rightBtnAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarIconClicked:)]){
        [self.delegate searchBarIconClicked:WJCustomSearchBarIconRight];
    }
}

#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.textField.placeholder = self.placeholder;
}
#pragma mark - getter
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc] init];
        if (ValidStr(self.leftIcon)) {
            [_leftBtn setImage:[UIImage imageNamed:self.leftIcon] forState:UIControlStateNormal];
            [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] init];
        if (ValidStr(self.rightIcon)) {
            [_rightBtn setImage:[UIImage imageNamed:self.rightIcon] forState:UIControlStateNormal];
            [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _rightBtn;
}
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.placeholder = self.placeholder;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.enablesReturnKeyAutomatically = YES; // 输入框有值时，才可以点击returnkey。
        _textField.font = [UIFont systemFontOfSize:14.0f];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _textField.borderStyle = UITextBorderStyleNone;
    }
    return _textField;
}
@end
