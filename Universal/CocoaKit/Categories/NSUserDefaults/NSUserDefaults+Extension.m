//
//  NSUserDefaults+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSUserDefaults+Extension.h"
#import "PodHeaders.h"

@implementation NSUserDefaults (Extension)

+ (id)objectForKey:(NSString*)key;
{
    id result = nil ;

    if ([[NSUserDefaults standardUserDefaults]objectForKey:key]) {
        
        result = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    }
    return result;
}

+ (void)removeObjectForKey:(NSString*)key
{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:key]) {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

+ (void)__ldx_safeSetObject:(id)obj forKey:(NSString*)key
{
    if ([key isKindOfClass:[NSString class]]) {
        id oldObj = [[NSUserDefaults standardUserDefaults]objectForKey:key];
        if (oldObj) {
            NSLog(@"oldObj:%@ newObj:%@",oldObj,obj);
        }
        [[NSUserDefaults standardUserDefaults]setObject:obj forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
@end
