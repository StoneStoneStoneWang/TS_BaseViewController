//
//  TSNavigationController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNavigationController.h"
#import "TSBaseViewController.h"
#import "UIBarButtonItem+Setting.h"
#import <TS_ToolKit/TS_ToolKit.h>
static TSConfigUtil *manager = nil;

@implementation TSConfigUtil

+ (TSConfigUtil *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [TSConfigUtil new];
    });
    
    return manager;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        NSDictionary *json = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TSConfig" ofType:@"plist"]];
        
        self.Back_Image = json[@"Back_Image"];
        
        self.Background_HEXColor = json[@"Background_HEXColor"];
        
        self.Title_HEXColor = json[@"Title_HEXColor"];
        
        self.Title_FontSize = (CGFloat)[json[@"Title_FontSize"] floatValue];
        
        self.NaviBackground_HEXColor = json[@"NaviBackground_HEXColor"];
    }
    return self;
}

@end

@interface TSNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic ,strong) TSConfigUtil *util;

@end

@implementation TSNavigationController

+ (void)initialize {
    
    TSConfigUtil *util = [TSConfigUtil shared];
    
    [[UINavigationBar appearance] setBarTintColor: TSColorHEX(util.NaviBackground_HEXColor)];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:util.Title_FontSize],
                                                           NSForegroundColorAttributeName: TSColorHEX(util.Title_HEXColor)
                                                           }];
}

- (TSConfigUtil *)util {
    
    return [TSConfigUtil shared];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    self.transitionType = TSNavigationTransionTypePush;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = true;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:[UIImage imageNamed:self.util.Back_Image] andTarget:self andSelector: @selector(pop)];
        
    } else {
        
        if (self.transitionType == TSNavigationTransionTypePresent) {
            
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:[UIImage imageNamed:self.util.Back_Image] andTarget:self andSelector: @selector(pop)];
        }
        
    }
    [super pushViewController:viewController animated:animated];
}

- (void)pop {
    
    if (self.transitionType == TSNavigationTransionTypePush) {
        
        [self popViewControllerAnimated:true];
    } else {
        
        [self.topViewController dismissViewControllerAnimated:true completion:nil];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.viewControllers.count > 1;
}

@end
