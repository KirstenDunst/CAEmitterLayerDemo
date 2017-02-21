//
//  BaseTableVC.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/15.
//  Copyright © 2016年 student. All rights reserved.
//

#import "BaseTableVC.h"

#import "SnowVC.h"
#import "HeartVC.h"

#import "FireVC.h"
#import "TouchVC.h"
#import "FireworksVC.h"

@implementation BaseTableVC


+ (instancetype)sharedTableBarController {
    
    static BaseTableVC *sharedInstance = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BaseTableVC   alloc] init];
    });
    
    
    return sharedInstance;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarAttribute];
    [self createAllChildViewController];
    
}



- (void)setTabBarAttribute {
    
    self.tabBar.barTintColor = [UIColor blackColor];
    self.tabBar.tintColor    = [UIColor redColor];
}


- (void)createAllChildViewController {
    
    [self createOneChildViewController:[SnowVC new] withTitle:@"雪花"];
    [self createOneChildViewController:[HeartVC new] withTitle:@"心型"];
    [self createOneChildViewController:[FireVC new] withTitle:@"火花"];
    [self createOneChildViewController:[TouchVC new] withTitle:@"扩散"];
    [self createOneChildViewController:[FireworksVC new] withTitle:@"烟花"];
}


- (void)createOneChildViewController:(UIViewController *)controller withTitle:(NSString *)title {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:21.0]}];
    
    nav.title = title;
    
    [nav.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    

    
    controller.navigationItem.title = title;
    
    //未选中字体颜色及字体大小
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:14.0]} forState:UIControlStateNormal];
    
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14.0]} forState:UIControlStateSelected];
    
    
    [self addChildViewController:nav];
    
}


@end
