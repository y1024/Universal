//
//  NSString+HomePath.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSString+Extension.h"
#import "PodHeaders.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation NSString (Extension)

+ (NSString*)HomePath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (BOOL)notNull
{
    if (!self) {
        
        return NO;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    if (![self isKindOfClass:[NSString class]]) {
        
        return NO ;
    }

    if ([self isEqualToString:@""]) {
        
        return NO;
    }
    else
    {
        return YES;
    }

}

- (NSString*)reutf8;
{
    NSString *resultString = nil ;
    
    if ([self notNull]) {
        
        resultString = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return resultString ;
}

- (NSString*)utf8
{
    NSString *UTF8String = nil ;
    

    if ([self notNull]) {
        
        UTF8String = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return UTF8String;
}

- (NSString*)combineSyllablesWithBlank;
{
    if (![self notNull]) {
        
        return nil;
    }

    NSMutableString *mutableChineseString = [NSMutableString stringWithString:self];
    
    __block NSString *resultString = @"";
    
    
    @autoreleasepool {
        
        if (CFStringTransform((__bridge CFMutableStringRef)mutableChineseString, 0, kCFStringTransformMandarinLatin, NO))
        {
                DDLogDebug(@"拼音带声调:%@",mutableChineseString);
        }
        if (CFStringTransform((__bridge CFMutableStringRef)mutableChineseString, 0, kCFStringTransformStripCombiningMarks, NO))
        {
                DDLogDebug(@"不带拼音带声调:%@",mutableChineseString);
            
                resultString = mutableChineseString ;
        }
    }
    
    return resultString ;
}

- (NSString*)combineSyllablesNoBlank
{
   __block NSString *noBlankString = @"";
    
    NSArray *mutableChineseStringArray = [[self combineSyllablesWithBlank] componentsSeparatedByString:@" "];
    [mutableChineseStringArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        noBlankString = [noBlankString stringByAppendingString:obj];
    }];
    
    return noBlankString ;
    
}
- (BOOL)isContainsString:(NSString *)aString
{
    if ([UIDevice IOS8]) {
        
        return [self containsString:aString];
    }
    else if ([self rangeOfString:aString].length > 0 && [self rangeOfString:aString].location != NSNotFound ) {
        return YES;
    }
    
    return NO ;
}

+ (NSString*)WIFIName
{
    NSString *wifiName = nil;
    
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    
    if (!wifiInterfaces) {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            DDLogDebug(@"network info -> %@", networkInfo);
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    
    CFRelease(wifiInterfaces);
    return wifiName;

}

+ (NSString*)UUID
{
    NSString *UUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
    
    return UUID;
}
@end
