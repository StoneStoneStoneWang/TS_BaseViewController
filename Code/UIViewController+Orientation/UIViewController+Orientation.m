//
//  UIViewController+UIViewController_Orientation.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+Orientation.h"

@implementation UIViewController (Orientation)

#pragma mark --- 不支持旋转
- (BOOL)shouldAutorotate {
    
    return false;
}
#pragma mark --- 支持朝向

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}
#pragma mark --- 展示朝向

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return UIInterfaceOrientationPortrait;
}

@end
