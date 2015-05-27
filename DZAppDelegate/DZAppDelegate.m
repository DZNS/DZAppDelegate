//
//  DZAppDelegate.m
//  DZAppDelegate
//
//  Created by Nikhil Nigade on 5/27/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP. All rights reserved.
//

#import "DZAppDelegate.h"

@implementation DZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    if([self respondsToSelector:@selector(appDefaults)])
    {
        
        NSDictionary *defaults = [self performSelector:@selector(appDefaults)];
        
        if(defaults)
        {
            [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
        }
        
    }
    
    [self callDelegate:@selector(setupAppearance)];
    [self callDelegate:@selector(setupRouting)];
    [self callDelegate:@selector(setupNetworking)];
    [self callDelegate:@selector(setupRootController)];
    
    if(self.window && ![self.window isKeyWindow])
    {
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}

#pragma mark - Helpers

- (void)callDelegate:(SEL)aSelector
{
    
    if([self respondsToSelector:aSelector])
    {
        
        IMP imp = [self methodForSelector:aSelector];
        void (*func)(id, SEL) = (void *)imp;
        func(self, aSelector);
        
    }
    
}

@end
