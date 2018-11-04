//
//  UINavigationController+UINavigationController_Orientation.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UINavigationController+Orientation.h"

@implementation UINavigationController (Orientation)

#pragma mark --- 支持自动旋转

- (BOOL)shouldAutorotate {
    
    return [self.topViewController shouldAutorotate];
}
#pragma mark --- 支持朝向

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return [self.topViewController supportedInterfaceOrientations];
}
#pragma mark --- 初始化方向

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
