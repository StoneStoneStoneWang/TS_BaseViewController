//
//  ViewController.m
//  TS_BaseViewController
//
//  Created by three stone 王 on 2018/11/4.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 100, 100);
    
    btn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)shouldInitPhoneWebView {
    
    return true;
}
- (void)btnClick {
    
    [self call:@"13643148393"];
}

@end
