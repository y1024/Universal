//
//  AppDelegate.m
//  Universal
//
//  Created by emiaobao on 15/8/31.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"

#import "PodHeaders.h"

//#import "NSArray+Extension.h"
//#import "NSMutableArray+Extension.h"

#import "CategoryHeaders.h"


#import <OneAPM/OneAPM.h>

//#import <CocoaLumberjack/CocoaLumberjack.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [OneAPM startWithApplicationToken:@"D847360619238D4EA0DECA8AD224467E69"];
    
//    [self DDLog];
    
    
//    NSArray *ary = @[@"1"];
    
    
//    NSMutableArray *ay2 = [NSMutableArray arrayWithArray:ary];
//
//    [ary safeObjectAtIndex:2];
//
//    ay2[1];
//
//    NSMutableDictionary *dic = @{@"key":@"value"};
//    [dic safeSetValue:@"value" key:[ay2 safeObjectAtIndex:10]];
//
//
//    
//    [ay2 addObject:nil];
    
//    NSString *str =@"{\"aps\":{\"content-available\":1,\"sound\":\"default\",\"alert\":{\"body\":\"医生回复您的问题，立刻点击查看\",\"title\":\"【问医生】\"},\"badge\":1},\"payload\":\"{\\\"params\\\":\\\"{\\\\\\\"userId\\\\\\\":\\\\\\\"386\\\\\\\",\\\\\\\"issueId\\\\\\\":\\\\\\\"564\\\\\\\"}\\\",\\\"url\\\":\\\"emb://askdoctordetail\\\"}\"}";
//    NSString *resultString = [str replaceBackslash];
//    
//    [str longLongValue];
    
    
    id dic = @{@"key":@"value",@"new":@[@{@"newKey":@"中国"}]};
    
    NSLog(@"str:%@",[dic __ldx_jsonString]);
    
    [NSUserDefaults __ldx_safeSetObject:@"" forKey:dic];
    

    
    NSString *str = @"123";
    
    if ([str regexAllNumbers]) {
        
        NSLog(@"2");
    }
    
    return YES;
}

- (void)DDLog
{
//    [DDLog addLogger:[DDASLLogger sharedInstance]];
//    [DDLog addLogger:[DDTTYLogger sharedInstance]];
//    
//    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
//    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//    
//    [DDLog addLogger:fileLogger];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
