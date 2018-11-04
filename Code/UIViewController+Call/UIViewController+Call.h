//
//  UIViewController+Call.h
//  TS_BaseViewController
//
//  Created by three stone 王 on 2018/11/4.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBaseViewController.h"

@interface UIViewController (Call) <UIWebViewDelegate>

@property (nonatomic ,strong ) UIWebView *phoneWebView;

/*
 是否初始化webview webview 必须先初始化 才可以调用拨打电话功能 如果在使用的时候初始化 会导致不会拨打电话
 */
- (BOOL )shouldInitPhoneWebView;

#pragma mark --- phone call  直接传入电话号码  可能有部分延迟 看需求调整

- (void)call:(NSString *)phone;

@end
