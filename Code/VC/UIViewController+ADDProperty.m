//
//  UIViewController+TSAdd.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+ADDProperty.h"
#import "TSBaseViewController.h"
#import <objc/runtime.h>
//typedef void (* _IMP)(id,SEL,...);

@implementation UIViewController (ADDProperty)

- (void)setDataBlock:(TSDataBlock)dataBlock {
    
    objc_setAssociatedObject(self, @"dataBlock", dataBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (TSDataBlock)dataBlock {
    
    return objc_getAssociatedObject(self, @"dataBlock");
}
- (void)setIdentifier:(NSString *)identifier {
    
    objc_setAssociatedObject(self, @"identifier", identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)identifier {
    
    return objc_getAssociatedObject(self, @"identifier");
}
@end
