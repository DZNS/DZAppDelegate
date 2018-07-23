//
//  DZAppDelegate.m
//  DZAppDelegate
//
//  Created by Nikhil Nigade on 5/27/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP. All rights reserved.
//

#import "DZAppDelegate.h"

@implementation DZAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
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
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    if(self.window && ![self.window isKeyWindow])
    {
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}

#pragma mark - Instance Methods

- (void)setRootViewController:(UIViewController *)viewController
               withTransition:(UIViewAnimationOptions)transition
                     duration:(NSTimeInterval)duration
                   completion:(void (^)(BOOL finished))completion
{
    
    UIViewController *oldViewController = self.window.rootViewController;
    
    [UIView transitionFromView:oldViewController.view toView:viewController.view duration:duration options:(UIViewAnimationOptions)(transition|UIViewAnimationOptionAllowAnimatedContent|UIViewAnimationOptionLayoutSubviews) completion:^(BOOL finished) {
        
        self.window.rootViewController = viewController;
        
        if (completion)
        {
            completion(finished);
        }
        
    }];
    
}

- (void)setRootViewController:(UIViewController *)viewController
                withAnimation:(DZAppRootAnimation)animation
                     duration:(NSTimeInterval)duration
                   completion:(void (^)(BOOL finished))completion
{
    
    UIView *snapshot = [self.window.rootViewController.view snapshotViewAfterScreenUpdates:NO];
    
    [viewController.view addSubview:snapshot];
    
    self.window.rootViewController = viewController;
    
    [UIView animateWithDuration:duration animations:^{
        
        switch (animation)
        {
            case DZAppAnimationFocusOut:
                snapshot.transform = CGAffineTransformMakeScale(1.25f, 1.25f);
                break;
            case DZAppAnimationFocusIn:
                snapshot.transform = CGAffineTransformMakeScale(0.925f, 0.925f);
                break;
            default:
                break;
                
        }
        
        snapshot.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [snapshot removeFromSuperview];
        
        if(completion)
        {
            completion(finished);
        }
        
    }];
    
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
