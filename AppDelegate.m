//
//  AppDelegate.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/14.
//  Copyright © 2016年 student. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTableVC.h"

@interface AppDelegate ()

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [BaseTableVC sharedTableBarController];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
