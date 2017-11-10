//
//  ViewController.m
//  HYHStatusBarHUD
//
//  Created by Taylor Jepsen on 2017/11/10.
//  Copyright © 2017年 Taylor Jepsen. All rights reserved.
//

#import "ViewController.h"
#import "HYHStatusBarHUD.h"

@interface ViewController ()
- (IBAction)tj_showSuccess:(UIButton *)sender;
- (IBAction)tj_showError:(UIButton *)sender;
- (IBAction)tj_showLoading:(UIButton *)sender;
- (IBAction)tj_hide:(UIButton *)sender;
- (IBAction)tj_showOther:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tj_showSuccess:(UIButton *)sender {
    [HYHStatusBarHUD tj_showSuccess:@"加载成功"];
}

- (IBAction)tj_showError:(UIButton *)sender {
    [HYHStatusBarHUD tj_showError:@"加载失败"];
}

- (IBAction)tj_showLoading:(UIButton *)sender {
    [HYHStatusBarHUD tj_showLoading:@"正在加载中..."];
}

- (IBAction)tj_hide:(UIButton *)sender {
    [HYHStatusBarHUD tj_hide];
}

- (IBAction)tj_showOther:(UIButton *)sender {
    [HYHStatusBarHUD tj_showMessage:@"自定义文字" image:[UIImage imageNamed:@"check"]];
}
@end
