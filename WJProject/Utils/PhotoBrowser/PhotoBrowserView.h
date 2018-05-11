//
//  PhotoBrowserView.h
//  WJProject
//
//  Created by 郝文举 on 2018/5/10.
//  Copyright © 2018年 wenju hao. All rights reserved.
// NSArray *arr = @[@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2531276078,2913225038&fm=27&gp=0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526015679775&di=5b8770f777e951c468b6f1d1a57aebf5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01e1d8596a4778a8012193a32eaf45.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526015679775&di=c3f6513047a812ead51a532af46252d1&imgtype=0&src=http%3A%2F%2Fwww.taopic.com%2Fuploads%2Fallimg%2F140421%2F318743-140421213T910.jpg",@"https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=2bda68a29082d158a4825fb1b00b19d5/0824ab18972bd407cf293db177899e510eb30994.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526016154608&di=96c17c5f483d387d669a7bcd1060a6b8&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F9345d688d43f8794f7940c9ede1b0ef41bd53a12.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526016154608&di=3a3a94abad6fb0ccd78c60f6885363ef&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9198618367adab4c32b570487d4b31c8601e4fa.jpg"];
// PhotoBrowserView *photo = [[PhotoBrowserView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) andUrl:arr];

#import <UIKit/UIKit.h>

@interface PhotoBrowserView : UIView

- (instancetype)initWithFrame:(CGRect)frame andUrl:(NSArray *)url;

@end
