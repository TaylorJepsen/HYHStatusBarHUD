# HYHStatusBarHUD
用于显示状态栏指示器

#显示成功信息
 [HYHStatusBarHUD tj_showSuccess:@"加载成功"];
#显示失败信息
 [HYHStatusBarHUD tj_showError:@"加载失败"];
#显示正在加载
 [HYHStatusBarHUD tj_showLoading:@"正在加载中..."];
#显示其他信息
 [HYHStatusBarHUD tj_showMessage:@"自定义文字" image:[UIImage imageNamed:@"check"]];
#收回状态指示器
 [HYHStatusBarHUD tj_hide];
