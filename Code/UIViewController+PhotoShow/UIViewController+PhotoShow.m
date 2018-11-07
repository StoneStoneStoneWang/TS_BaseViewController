//
//  UIViewController+PhoneShow.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/15.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+PhotoShow.h"
#import <objc/runtime.h>
#import "JXTAlertController.h"

@implementation UIViewController (PhotoShow)

- (void)setImageicker:(UIImagePickerController *)imageicker {
    
    objc_setAssociatedObject(self, @"imageicker", imageicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImagePickerController *)imageicker {
    
    return objc_getAssociatedObject(self, @"imageicker");
}

- (void)setMediaType:(PhotoLibraryType)mediaType {
    
    objc_setAssociatedObject(self, @"mediaType", @(mediaType), OBJC_ASSOCIATION_RETAIN);
}

- (PhotoLibraryType)mediaType {
    
    return [objc_getAssociatedObject(self, @"mediaType") integerValue];
}

- (void)setCaptureMode:(UIImagePickerControllerCameraCaptureMode)captureMode {
    
    objc_setAssociatedObject(self, @"captureMode", @(captureMode), OBJC_ASSOCIATION_RETAIN);
}
- (UIImagePickerControllerCameraCaptureMode)captureMode {
    
    return [objc_getAssociatedObject(self, @"captureMode") integerValue];
}
- (void)setAllowsEditing:(BOOL)allowsEditing {
    
    objc_setAssociatedObject(self, @"allowsEditing", @(allowsEditing), OBJC_ASSOCIATION_RETAIN);
}
- (BOOL)allowsEditing {
    
    return [objc_getAssociatedObject(self, @"allowsEditing") integerValue];
}

- (void)setWriteToAlbum:(BOOL)writeToAlbum {
    
    objc_setAssociatedObject(self, @"writeToAlbum", @(writeToAlbum), OBJC_ASSOCIATION_RETAIN);
}
- (BOOL)writeToAlbum {
    
    return [objc_getAssociatedObject(self, @"writeToAlbum") integerValue];
}

- (void)setQualityType:(UIImagePickerControllerQualityType)qualityType {
    
    objc_setAssociatedObject(self, @"qualityType", @(qualityType), OBJC_ASSOCIATION_RETAIN);
}

- (UIImagePickerControllerQualityType)qualityType {
    
    return [objc_getAssociatedObject(self, @"qualityType") integerValue];
}

- (void)setMediaTypes:(NSArray<NSString *> *)mediaTypes {
    
    objc_setAssociatedObject(self, @"mediaTypes", mediaTypes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSArray<NSString *> *)mediaTypes {
    
    return (NSArray<NSString *> *)objc_getAssociatedObject(self, @"mediaTypes");
}
- (void)photoActionShow {
    
    __weak __typeof__(self) weakSelf = self;
    
    [self jxt_showActionSheetWithTitle:@"选取图片"
                               message:@""
                     appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                         alertMaker.
                         addActionCancelTitle(@"取消").
                         addActionDefaultTitle(@"相机").
                         addActionDefaultTitle(@"相册");
                     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                         
                         __strong __typeof__(weakSelf) strongSelf = weakSelf;
                         
                         if ([action.title isEqualToString:@"取消"]) {
                             
                         } else if ([action.title isEqualToString:@"相机"]) {
                             
                             [strongSelf onCameraShow];
                         } else if ([action.title isEqualToString:@"相册"]) {
                             
                             [strongSelf onPhotoLibShow];
                         }
                     }];
}
- (void)onCameraShow {
    
    if (!self.imageicker) {
        
        self.imageicker = [UIImagePickerController new];
        
        self.imageicker.allowsEditing = self.allowsEditing;
        
        self.imageicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        self.imageicker.captureMode = self.captureMode;
        
        if (self.mediaTypes) {
            
            self.imageicker.mediaTypes = self.mediaTypes;
        }
        
        self.imageicker.captureMode = self.captureMode;
        
        self.imageicker.qualityType = self.qualityType;
    }
    if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        
        self.imageicker.delegate = self;
        
        self.imageicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:self.imageicker animated:true completion:nil];
        
    } else {
        
        NSLog(@"模拟器中无法打开相机");
    }
}

- (void)onPhotoLibShow {
    
    if (!self.imageicker) {
        
        self.imageicker = [UIImagePickerController new];
        
        self.imageicker.allowsEditing = self.allowsEditing;
        
        self.imageicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        self.imageicker.captureMode = self.captureMode;
        
        self.imageicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if (self.mediaTypes) {
            
            self.imageicker.mediaTypes = self.mediaTypes;
        }
    }
    self.imageicker.delegate = self;
    
    [self presentViewController:self.imageicker animated:true completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:true completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSString * mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage] ) {
        
        UIImage *image = nil;
        
        if (picker.allowsEditing ) {
            
            image = (UIImage *)info[UIImagePickerControllerEditedImage];
        } else {
            
            image = (UIImage *)info[UIImagePickerControllerOriginalImage];
        }
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            if (self.writeToAlbum) {
                
                UIImageWriteToSavedPhotosAlbum(image,self,nil,nil);
            }
        }
        
        [self performSelector:@selector(onSelectImage:) withObject:image];
    } else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        
        NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            if (self.writeToAlbum) {
                
                ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]init];
                
                [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL completionBlock:^(NSURL *assetURL,NSError *error) {
                    // 如果没有错误，显示保存成功。
                    if (!error){
                        NSLog(@"视频保存成功！");
                        
                    } else {
                        
                        NSLog(@"保存视频出现错误：%@", error);
                    }
                }];
            }
        }
        
        [self performSelector:@selector(onSelectVideo:) withObject:mediaURL];
    }
    
    [picker dismissViewControllerAnimated:true completion:nil];
}
- (void)onSelectImage:(UIImage *)img {
    
    
}
- (void)onSelectVideo:(NSURL *)videoUrl {
    
    
}

@end
