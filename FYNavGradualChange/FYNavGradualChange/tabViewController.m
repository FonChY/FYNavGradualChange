//
//  tabViewController.m
//  导航条测试
//
//  Created by FonChY on 2017/2/17.
//  Copyright © 2017年 FonChY. All rights reserved.
//

#import "tabViewController.h"
#import "homeViewController.h"
#import "NavViewController.h"
@interface tabViewController ()

@end

@implementation tabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //首页
    homeViewController *oneCtrl = [[homeViewController alloc] init];
    oneCtrl.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:oneCtrl imageName:@"tab_1" title:@"首页"];
    
    //首页
    homeViewController *onCtrl = [[homeViewController alloc] init];
    onCtrl.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:onCtrl imageName:@"tab_1" title:@"首页2"];
    //首页
    homeViewController *eCtrl = [[homeViewController alloc] init];
    eCtrl.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:eCtrl imageName:@"tab_1" title:@"首页3"];
    //首页
    homeViewController *oneCtrwl = [[homeViewController alloc] init];
    oneCtrwl.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:oneCtrwl imageName:@"tab_1" title:@"首页4"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//添加子控制器,设置标题与图片
- (void)addChildViewController:(UIViewController *)childCtrl imageName:(NSString *)imageName title:(NSString *)title{
    
    //设置选中与未选中的图片-->指定一下渲染模式-->图片以原样的方式显示出来
    childCtrl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    childCtrl.tabBarItem.image = [UIImage imageNamed:imageName];
    //    childCtrl.tabBarItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0);
    
    childCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置标题
    
    childCtrl.title = title;
    //    childCtrl.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    //指定一下属性
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor redColor];
    //指定字体
    //    dic[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    
    //指定选中状态下文字颜色
    [childCtrl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    NavViewController *navCtrl = [[NavViewController alloc] initWithRootViewController:childCtrl];
    //    navCtrl.navigationBar.backgroundColor = [UIColor redColor];
    [self addChildViewController:navCtrl];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
