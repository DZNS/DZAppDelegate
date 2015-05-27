//
//  AppDelegate.m
//  DZAppDelegate
//
//  Created by Nikhil Nigade on 5/27/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <DZAppDelegateProtocol>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BOOL launched = [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    // Override point for customization after application launch
    
    return launched;
    
}

- (void)setupAppearance
{
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
    
}

- (void)setupRootController
{
    
    UITableViewController *viewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    viewController.title = @"First";
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    if(!self.window)
    {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    self.window.rootViewController = nav;
    
}

@end
