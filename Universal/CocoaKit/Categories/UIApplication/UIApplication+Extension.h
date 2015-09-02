//
//  UIApplication+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extension)

+ (void)openAPPInStore:(NSInteger)APPID;

+ (void)statusBarBlack;

+ (void)statusBarWhite;

/**
 *  2G 3G 4G WIFI
 *
 *  @return 
 */
+ (NSString*)netWorkName;

+ (void)callPhone:(NSString*)phone;

@end
