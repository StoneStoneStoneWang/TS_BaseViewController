//
//  UIColor+ColorTool.h
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/11/4.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 格式0xffffff 或者#ffffff 0XFFFFFF
#define TSColorHEX(s) [UIColor colorWithHexString:s]

@interface UIColor (ColorTool)

+ (UIColor *) colorWithHexString:(NSString *)color;

@end

