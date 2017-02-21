//
//  twoViewController.m
//  导航条测试
//
//  Created by FonChY on 2017/2/20.
//  Copyright © 2017年 FonChY. All rights reserved.
//

#import "twoViewController.h"
#import "FYBackBtn.h"
#import "UINavigationBar+Awesome.h"
@interface twoViewController ()

@end

@implementation twoViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.title = @"测试正确与否";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"white"]forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    FYBackBtn *btn = [[FYBackBtn alloc] init];
    [btn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
//    self.rightBtn = rightBtn;
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightBtn setTitle:@"说明" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightBtnClick{
    NSLog(@"点击了右边的按钮");
}


@end
