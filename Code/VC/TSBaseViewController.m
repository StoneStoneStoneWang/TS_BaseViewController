//
//  TSBaseViewController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TSNavigationController.h"
#import <TS_ToolKit/TS_ToolKit.h>
@interface TSBaseViewController ()

@end

@implementation TSBaseViewController
{
    UIImageView *_navBarHairlineImageView;
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            
            return imageView;
        }
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
#pragma mark ---- 如果不是通过xib加载的 取消 第一个检查器 use trait variations勾选
    
    if (self.navigationController ) {
        
        _navBarHairlineImageView.hidden = true;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    [self initSubviews];
    
    [self addOwnSubviews];
    
    [self configOwnSubviews];
    
    [self configOwnProperties];
    
    [self configNaviItem];
    
    [self addOwnSubVC];
    
    [self prepareData];
    
    [self configAutoAdjust];
}
#pragma mark --- ios 11以后发生了变化
- (void)configAutoAdjust {
    
    if (@available(iOS 11.0, *)) {
        // 本想循环遍历 子view的 现在选择是只设置一级子类的scrollview 设置
       
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            if ([obj isKindOfClass:[UIScrollView class]]) {
                
                UIScrollView *scr = (UIScrollView *)obj;
                
                scr.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            
        }];
        
    } else {
        
        self.automaticallyAdjustsScrollViewInsets = false;
    }
}

#pragma mark --- 初始化子视图
- (void)initSubviews {
    
    // MARK: do something in subclass
}

- (void)addOwnSubviews {
    
    // MARK: do something in subclass
}
- (void)configOwnSubviews {
    
    // MARK: do something in subclass
}
- (void)configNaviItem {
    
    // MARK: do something in subclass
}
- (void)configOwnProperties {
    
    // MARK: do something in subclass
    
    self.view.backgroundColor = TSColorHEX([TSConfigUtil shared].Background_HEXColor);
}
- (void)addOwnSubVC {
    
    // MARK: do something in subclass
}

- (void)prepareData {
    // MARK: do something in subclass
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:true];
}

@end


