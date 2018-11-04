//
//  OpenUrl.m
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/7/26.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "OpenUrl.h"

@implementation OpenUrl

+ (void)openUrl:(NSString *)url {
    
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

@end
