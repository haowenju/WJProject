//
//  CustomIOSAlertView.h
//  CustomIOSAlertView
//
//  Created by Richard on 20/09/2013.
//  Copyright (c) 2013-2015 Wimagguc.
//
//  Lincesed under The MIT License (MIT)
//  http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>

@protocol CustomIOSAlertViewDelegate

- (void)customIOS7dialogButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface CustomIOSAlertView : UIView<CustomIOSAlertViewDelegate>
// 走代理也行，走block也行
@property (nonatomic, assign) id<CustomIOSAlertViewDelegate> delegate;
@property (copy) void (^onButtonTouchUpInside)(CustomIOSAlertView *alertView, int buttonIndex);


@property (nonatomic, retain) UIView *parentView;    // The parent view this 'dialog' is attached to
@property (nonatomic, retain) UIView *dialogView;    // Dialog's container view
@property (nonatomic, retain) UIView *containerView; // Container within the dialog (place your ui elements here)

// 按钮title
@property (nonatomic, retain) NSArray *buttonTitles;
// 按钮颜色[uicolor class]（要求数组个数和buttonTitles个数相同，否则不起作用）
@property (nonatomic, retain) NSArray *buttonTitlesColor;
// 点击背景是否消失 默认不消失
@property (nonatomic, assign) BOOL closeOnTouchUpOutside;



- (id)init;

/*!
 DEPRECATED: Use the [CustomIOSAlertView init] method without passing a parent view.
 */
- (id)initWithParentView: (UIView *)_parentView __attribute__ ((deprecated));

- (void)show;
- (void)close;



- (void)deviceOrientationDidChange: (NSNotification *)notification;
- (void)dealloc;

@end
