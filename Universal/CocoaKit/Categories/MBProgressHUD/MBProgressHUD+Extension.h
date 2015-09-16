//
//  MBProgressHUD+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Extension)


+ (void)showInView:(UIView*)view text:(NSString*)text;

+ (void)loadingInView:(UIView*)view text:(NSString*)text;

+ (void)hideAll;


+ (void)debug:(NSString*)text;

@end
