//
//  DZAppDelegate.h
//  DZAppDelegate
//  DZAppdelegate.h
//  DZAppdelegate
//
//  Created by Nikhil Nigade on 5/27/15.
//  Created by Nikhil Nigade on 7/31/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

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

typedef NS_ENUM(NSInteger, DZAppRootAnimation) {
    DZAppAnimationFade,
    DZAppAnimationFocusOut, //the old viewController's view scales up in size and fades out.
    DZAppAnimationFocusIn //the old viewController's view scales down in size and fades out.
};

@interface DZAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

/**
 *  Change the rootViewController on the window using an UIKit animation.
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


/**
 *  Change the rootViewController on the window using a custom animation.
 *
 *  @param viewController the new rootViewController
 *  @param animation      A DZAppRootAnimation type. Default is fade-out.
 *  @param duration       the duration for the transition animation.
 *  @param completion     the completion block to be invoked when the transition finishes.
 */
- (void)setRootViewController:(UIViewController *)viewController
                withAnimation:(DZAppRootAnimation)animation
                     duration:(NSTimeInterval)duration
                   completion:(void (^)(BOOL finished))completion;

@end
