//
//  AVCaptureDevice+Extension.h
//  Universal
//
//  Created by Code on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface AVCaptureDevice (Extension)

+ (void)ledTurn;

+ (void)ledOff;

/**
 *  相机权限
 *
 *  @return 
 */
+ (BOOL)cameraAccess;

@end
