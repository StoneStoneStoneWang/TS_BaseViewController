//
//  UIBarButtonItem+Setting.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/15.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Setting)

+ (instancetype)barButtonItemWith:(UIImage *)image andTarget:(id)target andSelector:(SEL)selector;

+ (instancetype)barButtonItemWith:(NSString *)normalTitle andNormalColor:(UIColor *)normalColor andHighTitle:(NSString *)highTitle andHighColor:(UIColor *)highColor andFontSize:(CGFloat )fontSize andTarget:(id)target andSelector:(SEL)selector;

@end
