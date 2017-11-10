//
//  HYHStatusBarHUD.m
//  HYHStatusBarHUD
//
//  Created by Taylor Jepsen on 2017/11/10.
//  Copyright © 2017年 Taylor Jepsen. All rights reserved.
//

#import "HYHStatusBarHUD.h"

@implementation HYHStatusBarHUD

#define XMGMessageFont [UIFont systemFontOfSize:12]


static CGFloat const XMGMessageDuration = 2.0;

static CGFloat const XMGAnimationDuration = 0.25;

static UIWindow *window_;

static NSTimer *timer_;

+ (void)tj_showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

+ (void)tj_showMessage:(NSString *)msg image:(UIImage *)image
{

    [timer_ invalidate];
    

    [self tj_showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = XMGMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
   timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(tj_hide) userInfo:nil repeats:NO];
}

+ (void)tj_showSuccess:(NSString *)msg
{
    [self tj_showMessage:msg image:[UIImage imageNamed:@"HYHStatusBarHUD.bundle/success"]];
}

+ (void)tj_showError:(NSString *)msg
{
    [self tj_showMessage:msg image:[UIImage imageNamed:@"HYHStatusBarHUD.bundle/error"]];
}

+ (void)tj_showLoading:(NSString *)msg
{
    [timer_ invalidate];
    timer_ = nil;
    
    [self tj_showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = XMGMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];

    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : XMGMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

+ (void)tj_hide
{
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
@end
