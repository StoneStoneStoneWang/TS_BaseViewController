//
//  UIViewController+Call.m
//  TS_BaseViewController
//
//  Created by three stone 王 on 2018/11/4.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+Call.h"
#import <objc/runtime.h>
// 利用Category 和Runtime实行方法hook hook方案有一个好处,就是可以避免代码入侵,做到更加广泛的通用性.通过swizzling我们可以将原method与自己加入的method相结合,即不需要在原有工程中加入代码,又能做到全局覆盖

void __ts_swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIViewController (Call)

+ (void)load {
    
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __ts_swizzleMethod([self class], @selector(viewDidLoad), @selector(__ts_viewDidLoad));
    });
}

- (void)setPhoneWebView:(UIWebView *)phoneWebView {
    
    objc_setAssociatedObject(self, @"phoneWebView", phoneWebView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIWebView *)phoneWebView {
    
    return objc_getAssociatedObject(self, @"phoneWebView");
}
- (BOOL)shouldInitPhoneWebView {
    
    return false;
}

- (void)__ts_viewDidLoad {
    [self __ts_viewDidLoad];
    
    //由于方法已经被交换,这里调用的实际上是viewDidLoad方法
    
    if ([self shouldInitPhoneWebView]) {
        
        self.phoneWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        
        self.phoneWebView.delegate = self;
    }
}

#pragma mark --- phone call
- (void)call:(NSString *)phone {
    
    if (!self.phoneWebView) {
        
        return ;
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]];
    
    [self.phoneWebView loadRequest: [NSURLRequest requestWithURL:url]];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"WebKitDiskImageCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
