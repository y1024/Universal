//
//  AVCaptureDevice+Extension.m
//  Universal
//
//  Created by Code on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "AVCaptureDevice+Extension.h"
#import "PodHeaders.h"

@implementation AVCaptureDevice (Extension)

+ (void)ledTurn
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
}

+ (void)ledOff
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

+ (BOOL)cameraAccess
{
    BOOL access = NO ;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
        DDLogDebug(@"允许状态");
        
        access = YES ;
    }
    else if (authStatus == AVAuthorizationStatusRestricted)
    {
        DDLogDebug(@"AVAuthorizationStatusRestricted");
        access = NO;
    }
    
    else if (authStatus == AVAuthorizationStatusDenied)
    {
        [UIAlertView showAlertViewWithTitle:@"未获得授权使用摄像头" message:@"请在iOS-设置-隐私-相机中打开" cancle:@"知道了" other:nil delegate:nil tag:0];
        access = NO ;
        
    }
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        DDLogDebug(@"系统还未知是否访问，第一次开启相机时");
        
        access = YES ;
    }
    
    if (![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        
        [UIAlertView showAlertViewWithTitle:@"提示" message:@"摄像头不可用" cancle:@"知道了" other:nil delegate:nil tag:0];
        access = NO ;
    }
    
    return access ;

}

@end
