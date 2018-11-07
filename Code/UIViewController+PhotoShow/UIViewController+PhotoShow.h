//
//  UIViewController+PhoneShow.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/15.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
//
typedef NS_ENUM(NSInteger, PhotoLibraryType) {
    
    PhotoLibraryTypeDefault, // 图片加视频
    
    PhotoLibraryTypeOnlyPhoto, // 图片上传
    
    PhotoLibraryTypeOnlyVideo, // 视频上传
    
    PhotoLibraryPhotoAndVideo = PhotoLibraryTypeDefault
};

@interface UIViewController (PhotoShow) <UINavigationControllerDelegate ,UIImagePickerControllerDelegate>

@property (nonatomic ,strong ,readonly) UIImagePickerController *imageicker;

/*
 图片选择器类型
 */
@property (nonatomic ,assign) PhotoLibraryType mediaType;

/*
 是否允许编辑
 */

@property (nonatomic ,assign) BOOL allowsEditing;

/*
 是否写入相册
 */

@property (nonatomic ,assign) BOOL writeToAlbum;
/*
 captureMode
 */

@property (nonatomic ,assign) UIImagePickerControllerCameraCaptureMode captureMode;

/*
 qualityType
 */

@property (nonatomic ,assign) UIImagePickerControllerQualityType qualityType;

/*
 mediaTypes  Demo kUTTypeMovie
 */

@property (nonatomic ,strong) NSArray<NSString *> *mediaTypes;


- (void)photoActionShow;

- (void)onCameraShow;

- (void)onPhotoLibShow;

// 无压缩
- (void)onSelectImage:(UIImage *)img;

- (void)onSelectVideo:(NSURL *)videoUrl;

@end
