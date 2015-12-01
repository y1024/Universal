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
    [[UIWindow __ldx_keyWindow]resignFirstResponder];
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
+ (void)log
{
#ifdef DEBUG
    
    //如果已经连接Xcode调试则不输出到文件
    if (isatty(STDOUT_FILENO)) {
        return;
    }
    
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] hasSuffix:@"Simulator"]) { //在模拟器不保存到文件中
        return;
    }
    
    //将NSlog打印信息保存到Document目录下的Log文件夹下
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *logDirectory =
    [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExists = [fileManager fileExistsAtPath:logDirectory];
    if (!fileExists) {
        [fileManager createDirectoryAtPath:logDirectory
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:
     @"yyyy-MM-dd HH:mm:ss"]; //每次启动后都保存一个新的日志文件中
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    NSString *logFilePath =
    [logDirectory stringByAppendingFormat:@"/%@.log", dateStr];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+",
            stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+",
            stderr);
    
    //未捕获的Objective-C异常日志
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
#endif
    
}

void UncaughtExceptionHandler(NSException *exception) {
    NSString *name = [exception name];
    NSString *reason = [exception reason];
    NSArray *symbols = [exception callStackSymbols]; // 异常发生时的调用栈
    NSMutableString *strSymbols =
    [[NSMutableString alloc] init]; //将调用栈拼成输出日志的字符串
    for (NSString *item in symbols) {
        [strSymbols appendString:item];
        [strSymbols appendString:@"\r\n"];
    }
    
    //将crash日志保存到Document目录下的Log文件夹下
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *logDirectory =
    [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:logDirectory]) {
        [fileManager createDirectoryAtPath:logDirectory
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
    
    NSString *logFilePath =
    [logDirectory stringByAppendingPathComponent:@"UncaughtException.log"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    
    NSString *crashString =
    [NSString stringWithFormat:@"<- %@ ->[ Uncaught Exception ]\r\nName: %@, "
     @"Reason: %@\r\n[ Fe Symbols Start ]\r\n%@[ "
     @"Fe Symbols End ]\r\n\r\n",
     dateStr, name, reason, strSymbols];
    //把错误日志写到文件中
    if (![fileManager fileExistsAtPath:logFilePath]) {
        [crashString writeToFile:logFilePath
                      atomically:YES
                        encoding:NSUTF8StringEncoding
                           error:nil];
    } else {
        NSFileHandle *outFile =
        [NSFileHandle fileHandleForWritingAtPath:logFilePath];
        [outFile seekToEndOfFile];
        [outFile writeData:[crashString dataUsingEncoding:NSUTF8StringEncoding]];
        [outFile closeFile];
    }
    
    //  //把错误日志发送到邮箱
    //  NSString *urlStr = [NSString
    //      stringWithFormat:
    //          @"mailto://125322700@qq.com?subject=bug报告&body=感谢您的配合!
    //          %@",
    //          crashString];
    //
    //  //错误详情:
    //
    //  NSURL *url =
    //      [NSURL URLWithString:[urlStr
    //      stringByAddingPercentEscapesUsingEncoding:
    //                                       NSUTF8StringEncoding]];
    //  [[UIApplication sharedApplication] openURL:url];
}

@end
