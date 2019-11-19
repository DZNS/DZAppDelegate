//
//  UIApplication+KeyWindow.m
//  DZAppdelegate
//
//  Created by Nikhil Nigade on 19/11/19.
//  Copyright © 2019 Dezine Zync Studios LLP. All rights reserved.
//

#import "UIApplication+KeyWindow.h"

@implementation UIApplication (KeyWindow)

+ (UIWindow *)keyWindow {
    
    UIWindow        *foundWindow = nil;
    NSArray         *windows = [[UIApplication sharedApplication]windows];
    
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    
    return foundWindow;
}

@end
