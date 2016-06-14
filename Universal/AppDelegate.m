//
//  AppDelegate.m
//  Universal
//
//  Created by emiaobao on 15/8/31.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"
#include <stdlib.h>
#include <stdio.h>
#import "NSMutableArray+Extension.h"
#import "NSData+Extension.h"

//#import "PodHeaders.h"

//#import "NSArray+Extension.h"
//#import "NSMutableArray+Extension.h"

#import "CategoryHeaders.h"
#import "NSData+AES256.h"

#import "ServiceMonitor.h"


//#import <CocoaLumberjack/CocoaLumberjack.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSMutableArray *array = [[NSMutableArray alloc] init];
////
////    [array addObject:@"a"];
////    [array addObject:nil];
//    NSLog(@"%@",[array objectAtIndex:10]);

//    NSLog(@"%@",[@"www.baidu.com" htmlString]);
//    NSLog(@"%@",[@"<a href='www.163.com' /a>" htmlString]);
    
//    [self DDLog];
    
//    NSInteger a = 7;
//    CGFloat b = 15.5;
//    int c = 55;
//    
//    
//    
//    NSLog(@"b:  %X",b);
//    printf("b:%X",b);
//    NSLog(@"c:%f",c);
//    NSLog(@"%f", (float)(a * c));
//    NSLog(@"%f", a * b);
//    
////    int a = 7;
//    int i;
//    for(i = sizeof(int)*8 - 1; i >= 0; i--){
//        if((1 << i) & a)
//            printf("%c", '1');
//        else
//            printf("%c", '0');
//    }
//    
//    
//    int number = 7;
//    char string[25];
//    
////    itoa(number, string, 2);
//    printf("integer = %d string = %s\n", number, string);
    
    
    
//    NSNull *nul = [NSNull null];
//    
//    NSArray *nulArray = (NSArray*)nul;
//    NSLog(@"nul:%@",[nulArray objectAtIndex:0]);
//    
//    
//    float a[] = {1.0, 2.0, 3.0};
//    
//    NSLog(@"array encoding type: %s", @encode(typeof(a)));
//    
//    [[ServiceMonitor instance]install];
//    
//    if ([UIApplication isHTTPEnable]) {
//        NSLog(@"HTTP enable");
//    } else {
//        NSLog(@"HTTP disable");
//    }
//    NSString *key = @"P)KSU0JNU&D=&^Dyuu^DB!#D";
//    NSString *ivString = @"AGS1WIG!IE*IQ9UW";
//    NSString *iv = @"";
//    for (int i = 0 ; i < ivString.length; i ++) {
//        NSLog(@"char:%x",[ivString characterAtIndex:i]);
//        iv = [iv stringByAppendingString:[NSString stringWithFormat:@"0x%x,",[ivString characterAtIndex:i]]];
//    };
//    
//    NSString *string = @"VERIFYCODE_KEY|1459911352|13907550001";
//    NSData *data = [string dataUsingEncoding:NSASCIIStringEncoding];
//    NSLog(@"%@",[[NSString alloc]initWithData:[data AES256EncryptWithKey:key] encoding:NSUTF8StringEncoding]);
//  NSLog(@"%@",[NSData AES256EncryptWithPlainText:string]);
    
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
