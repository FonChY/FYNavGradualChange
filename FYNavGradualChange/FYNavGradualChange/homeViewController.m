//
//  homeViewController.m
//  导航条测试
//
//  Created by FonChY on 2017/2/17.
//  Copyright © 2017年 FonChY. All rights reserved.
//

#import "homeViewController.h"
#import "UINavigationBar+Awesome.h"
#import "twoViewController.h"
#import "UIView+Extension.h"


#define kScreenW     [UIScreen mainScreen].bounds.size.width
#define kScreenH     [UIScreen mainScreen].bounds.size.height
//适配
#define  KadapterW   [UIScreen mainScreen].bounds.size.width/375
#define  KadapterH   [UIScreen mainScreen].bounds.size.height/667
#define UIColorFromValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define NAVBAR_CHANGE_POINT 50

@interface homeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)  UITableView *tableView;

@property (nonatomic, strong) UIView *navBgView;
@property (nonatomic, strong) UIButton *readerBtn;
@end

@implementation homeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //设置当前控制器显示的title
    self.title = @" ";
    //设置tab显示的title
    self.tabBarItem.title = @"首页";
    
    //在下级页面有的需要隐藏当行栏-->所以在这显示出来
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.tableView.delegate = self;
    //取消导航栏最下面的那一条线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
#pragma mark HaveHiddenAnimation ->当有隐藏和消失的动画时需要加这个(如无此效果,可全局搜索前面的英文定义进行删除,begin-->end ,不影响效果)
    //begin
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"white_7"] forBarMetrics:UIBarMetricsDefault];
    //end
    
    [self setNavBar];
    
    [self scrollViewDidScroll:self.tableView];
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
#pragma mark 这块我也不明白为什么取消了代理就好使了....
    self.tableView.delegate = nil;
    
    [self.navigationController.navigationBar lt_reset];
    [self.navBgView removeFromSuperview];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, kScreenW, kScreenH - 20)];
    //    [self.view addSubview:bgView];
#pragma mark 不加这句问题也会有问题,但是我不知道为什么.......知道的告诉我,谢谢
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView =[[ UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.height) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    
}


- (void)setNavBar{
    
    UIView *navBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 64)];
    [self.navigationController.navigationBar addSubview:navBgView];
    self.navBgView = navBgView;
    navBgView.backgroundColor = [UIColor clearColor];
    
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 7, 295 * KadapterW, 30)];
    searchBtn.centerX = self.view.centerX;
    
    UIColor *color = UIColorFromValue(0xf3f3f3);
    
    [searchBtn setBackgroundColor:[color colorWithAlphaComponent:0.6]];
    
    searchBtn.layer.masksToBounds = YES;
    searchBtn.layer.cornerRadius = 6;
    searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    //    [searchBtn addTarget:self action:@selector(gotoSearch) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"] forState:UIControlStateNormal];
    [searchBtn setTitle:@"搜索商品" forState:UIControlStateNormal];
    [searchBtn setTitleColor:UIColorFromValue(0x9c9c9c) forState:UIControlStateNormal];
    
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //    self.navigationItem.titleView  = searchBtn;
#pragma mark 这部是关键
    [navBgView addSubview:searchBtn];
    
    //左面导航按钮
    UIButton *readerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.readerBtn = readerButton;
    readerButton.frame = CGRectMake((kScreenW - searchBtn.width - 40) / 4, 0, 20 , 20 );
    
    readerButton.centerY = searchBtn.centerY;
    
    [navBgView addSubview:readerButton];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y ;
    NSLog(@"%lf",offsetY);
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
#pragma mark HaveHiddenAnimation
        //begin
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        //end
        
        [self.readerBtn setImage:[UIImage imageNamed:@"scan_white"] forState:UIControlStateNormal];
        
        
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else if(offsetY < 0){
#pragma mark HaveHiddenAnimation
        //begin
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        //end
        [self.readerBtn setImage:[UIImage imageNamed:@"scan_black"] forState:UIControlStateNormal];
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }else{
#pragma mark HaveHiddenAnimation
        //begin
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        //end
        
        [self.readerBtn setImage:[UIImage imageNamed:@"scan_black"] forState:UIControlStateNormal];
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}
//


#pragma mark UITableViewDatasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"text";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    twoViewController *vv = [[twoViewController alloc] init];
    
    [self.navigationController pushViewController:vv animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
