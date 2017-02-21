//
//  AppDelegate.m
//  导航条测试
//
//  Created by FonChY on 2017/2/17.
//  Copyright © 2017年 FonChY. All rights reserved.
//

#import "AppDelegate.h"
#import "tabViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.初始化一个window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //进入主页
    //    self.window.rootViewController = [FYTabBarViewController new];
    
    
    //    FYLoginVC *vc = [[FYLoginVC alloc] init];
    //    vc.preferredStatusBarStyle = UIStatusBarStyleLightContent;
    
    
    //    FYMyCenterVC *vc = [[FYMyCenterVC alloc] init];
    
    tabViewController *vc= [[tabViewController alloc] init];
    //      FYNavVC *nav = [[FYNavVC alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = vc;
    //3.让显示并成为主窗口
    [self.window makeKeyAndVisible];
    #pragma mark 不加这句跳转的时候绝对有问题,不信你试一试
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
