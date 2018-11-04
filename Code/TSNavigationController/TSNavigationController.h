//
//  TSNavigationController.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSConfigUtil: NSObject

// 返回按钮
@property (nonatomic ,copy) NSString *Back_Image;

//  标题字体
@property (nonatomic ,assign) CGFloat Title_FontSize;

// 标题颜色
@property (nonatomic ,copy) NSString *Title_HEXColor;

// root vc 背景色
@property (nonatomic ,copy) NSString *Background_HEXColor;

// 导航背景色
@property (nonatomic ,copy) NSString *NaviBackground_HEXColor;

+ (TSConfigUtil *)shared;

@end


// 通过这个 判断是否需要返回按钮 并

typedef NS_ENUM(NSInteger ,TSNavigationTransionType) {
    
    TSNavigationTransionTypePush = 0, // 正常push
    
    TSNavigationTransionTypePresent // present
};

@interface TSNavigationController : UINavigationController

@property (nonatomic ,assign) TSNavigationTransionType transitionType;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

+ (void)initialize;

@end
