//
//  UINavigationController+UINavigationController_Orientation.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 控制tabbarvc朝向
 */


@interface UINavigationController (Orientation)

#pragma mark --- 支持自动旋转

- (BOOL)shouldAutorotate;

#pragma mark --- 支持朝向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations;

#pragma mark --- 初始化方向

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;


@end
