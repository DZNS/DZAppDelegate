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

@end

