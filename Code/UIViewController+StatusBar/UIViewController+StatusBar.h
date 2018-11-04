//
//  UIViewController+StatusBar.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (StatusBar)

/*
 statusBarStyle 状态栏style
 有的时候需要设置状态栏状态 所以在这里就单独提出来 通过属性设置
 下面这个函数已经被舍弃 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent]
 
 当然你还需要在info.plist里设置 View controller-based status bar appearance 为no
 */

@property (nonatomic ,assign) UIStatusBarStyle statusBarStyle;

- (UIStatusBarStyle)preferredStatusBarStyle;

- (BOOL)prefersStatusBarHidden;

@end
