//
//  HYHStatusBarHUD.h
//  HYHStatusBarHUD
//
//  Created by Taylor Jepsen on 2017/11/10.
//  Copyright © 2017年 Taylor Jepsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYHStatusBarHUD : NSObject
+ (void)tj_showMessage:(NSString *)msg image:(UIImage *)image;
+ (void)tj_showSuccess:(NSString *)msg;
+ (void)tj_showError:(NSString *)msg;
+ (void)tj_showLoading:(NSString *)msg;
+ (void)tj_hide;
@end
