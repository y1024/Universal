//
//  UIApplication+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIApplication+Extension.h"
#import "PodHeaders.h"


#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#import "UIWindow+Extension.h"

@implementation UIApplication (Extension)

+ (void)openAPPInStore:(NSInteger)APPID
{
    NSString *appURLString = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%ld",(long)APPID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURLString]];
}

+ (void)statusBarBlack
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

+ (void)statusBarWhite
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

+ (void)endEditing
{
    [[UIWindow keyWindow]resignFirstResponder];
}


+ (NSString*)netWorkName
{
    UIApplication *mainApplication = [UIApplication sharedApplication];
    
    /*
     // 遍历当前app的所有属性，找到关于状态栏的
     unsigned int appOutCount = 0 ;
     Ivar *ivars = class_copyIvarList(mainApplication.class, &appOutCount);
     for (int  i = 0 ; i < appOutCount; i ++) {
     Ivar ivar = ivars[i];
     printf("遍历当前app的所有属性:%s\n", ivar_getName(ivar));
     }
     
     // 遍历状态栏的所有成员
     unsigned int statusBarOutCount = 0;
     id statusBar = [mainApplication valueForKeyPath:@"statusBar"];
     Ivar *statusBar_ivars = class_copyIvarList([statusBar class], &statusBarOutCount);
     
     for (int i = 0; i < statusBarOutCount; i++) {
     Ivar ivar =statusBar_ivars[i];
     printf("遍历状态栏的所有成员:%s\n", ivar_getName(ivar));
     }
     
     //所有当前显示的视图
     
     NSArray *foregroundView_children = [[[mainApplication valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
     for (id childView in foregroundView_children) {
     NSLog(@"所有当前显示的视图:%@", [childView class]);
     }
     */
    
    //获取当前网络状态
    NSArray *children = [[[mainApplication valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    if (type == 0 ) {
        return @"没有网络";
        
    }
    if (type == 1) {
        return @"2g 网络";
    }
    if (type == 2) {
        return @"3g 网络";
    }
    if (type == 3 ) {
        return @"4g 网络";
    }
    if (type == 5 ) {
        return  @"wifi 网络";
    }
    else
    {
        return @"未知网络";
    }
}

+ (void)callPhone:(NSString*)phone
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *isoCountryCode =  [carrier mobileCountryCode];
    if ([isoCountryCode length]!=0) {
        
        NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phone]];
        [[UIApplication sharedApplication] openURL:phoneNumberURL];
        
    }else{
        NSString *msg =  @"呼叫失败，没有可用的SIM卡!";
        
        
        [UIAlertView showAlertViewWithTitle:@"提示" message:msg cancle:@"确定" other:nil delegate:nil tag:0];
        
    }

}

@end
