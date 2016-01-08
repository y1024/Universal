//
//  MBProgressHUD+Extension.h
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Extension)

/**
 *  只提示文字
 *
 *  @param view
 *  @param text 
 */
+ (void)showInView:(UIView*)view text:(NSString*)text;
/**
 *  loading + 文字
 *
 *  @param view
 *  @param text
 */
+ (void)loadingInView:(UIView*)view text:(NSString*)text;

+ (void)hideAll;

+ (void)hideInView:(UIView*)view;

+ (void)debug:(NSString*)text;



@end
