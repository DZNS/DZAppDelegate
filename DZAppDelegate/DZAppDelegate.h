//
//  DZAppDelegate.h
//  DZAppDelegate
//
//  Created by Nikhil Nigade on 5/27/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DZAppDelegateProtocol <NSObject>

@optional
// The following methods are called during setup. All are optional, and called in the order as listed below.
- (NSDictionary *)appDefaults; // these are loaded into [NSUserDefaults standardUserDefaults]
- (void)setupAppearance;
- (void)setupRouting;
- (void)setupNetworking;
- (void)setupRootController;
// Once the last method in the above list is checked, the window property, if not key and visible is made so.

@end

@interface DZAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

/**
 *  Change the rootViewController on the window using an animation.
 *
 *  @param viewController the new rootViewController
 *  @param transition     UIViewAnimationOptions to use during the transition. Pass a transition animation in here.
 *  @param duration       the duration for the transition animation.
 *  @param completion     the completion block to be invoked when the transition finishes.
 */
- (void)setRootViewController:(UIViewController *)viewController
               withTransition:(UIViewAnimationOptions)transition
                     duration:(NSTimeInterval)duration
                   completion:(void (^)(BOOL finished))completion;

@end

