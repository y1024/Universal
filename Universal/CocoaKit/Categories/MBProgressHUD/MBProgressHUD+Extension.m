//
//  MBProgressHUD+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "MBProgressHUD+Extension.h"
#import "UIScreen+Extension.h"
#import "UIWindow+Extension.h"

@implementation MBProgressHUD (Extension)

+ (void)debug:(NSString*)text
{
    UIWindow *keyWindow = [UIWindow __ldx_keyWindow];
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hub.mode = MBProgressHUDModeText;
    hub.labelText = text;
    hub.margin = 10.0f;
    hub.yOffset = [UIScreen height]/2 - 50 - 20;
    hub.removeFromSuperViewOnHide = YES;
    [hub hide:YES afterDelay:1.0f];
}

+ (void)showInView:(UIView*)view text:(NSString*)text
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.mode = MBProgressHUDModeText;
    hub.labelText = text;
    hub.margin = 10.0f;
    hub.yOffset = [UIScreen height]/2 - 50 - 20;
    hub.removeFromSuperViewOnHide = YES;
    [hub hide:YES afterDelay:1.5f];
}

+ (void)loadingInView:(UIView*)view text:(NSString*)text
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hub.labelText = text;
}
+ (void)hideInView:(UIView*)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)hideAll
{
    UIWindow *keyWindow = [UIWindow __ldx_keyWindow];
    
    [MBProgressHUD hideAllHUDsForView:keyWindow animated:YES];
}

@end
