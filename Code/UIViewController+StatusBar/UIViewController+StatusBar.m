//
//  UIViewController+StatusBar.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+StatusBar.h"
#import <objc/runtime.h>

@implementation UIViewController (StatusBar)

- (void)setStatusBarStyle:(UIStatusBarStyle )statusBarStyle {
    
    objc_setAssociatedObject(self, @"statusBarStyle", @(statusBarStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIStatusBarStyle )statusBarStyle {
    
    return [objc_getAssociatedObject(self, @"statusBarStyle") integerValue];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}
- (BOOL)prefersStatusBarHidden {
    
    return false;
}

@end
