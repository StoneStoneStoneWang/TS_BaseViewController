//
//  UIViewController+TSAdd.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TSDataBlock)(id,id,id);
/*
 
 通过分类增加了两个属性
 
 可以使用也可以不使用  因为在开发当中通常都会通过id 查询详情 或者其他的请求
 
 
 */
@interface UIViewController (ADDProperty)

/*
 identifier 标识
 */

@property (nonatomic ,copy) NSString *identifier;

/*
 vc 之间数据的回调 
 */

@property (nonatomic ,copy) TSDataBlock dataBlock;

@end
