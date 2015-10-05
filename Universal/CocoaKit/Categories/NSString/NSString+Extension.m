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
    
    NSString *selfString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([selfString isEqualToString:@""]) {
        
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
                NSLog(@"拼音带声调:%@",mutableChineseString);
        }
        if (CFStringTransform((__bridge CFMutableStringRef)mutableChineseString, 0, kCFStringTransformStripCombiningMarks, NO))
        {
                NSLog(@"不带拼音带声调:%@",mutableChineseString);
            
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
            NSLog(@"network info -> %@", networkInfo);
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

+ (NSString*)timestamp
{
    NSDate *datenow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
    NSString *timeSp = [NSString stringWithFormat:@"%f", [localeDate timeIntervalSince1970]];
    
    return timeSp;
}

+ (NSString*)dateWithTimestamp:(NSInteger)seconds;
{
    NSDate *datenow = [NSDate dateWithTimeIntervalSince1970:seconds/1000];
    NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *dateString = [formatter stringFromDate:localeDate];
    
    return dateString;
}

+ (NSString*)stringWithCodeImage:(UIImage*)img;
{
    CGImageRef imageRef = img.CGImage;
    
    ZXLuminanceSource *source = [[ZXCGImageLuminanceSource alloc] initWithCGImage:imageRef];
    ZXBinaryBitmap *bitmap = [ZXBinaryBitmap binaryBitmapWithBinarizer:[ZXHybridBinarizer binarizerWithSource:source]];
    
    NSError *error = nil;
    
    ZXDecodeHints *hints = [ZXDecodeHints hints];
    
    ZXMultiFormatReader *reader = [ZXMultiFormatReader reader];
    ZXResult *result = [reader decode:bitmap
                                hints:hints
                                error:&error];
    if (result) {
        // The coded result as a string. The raw data can be accessed with
        // result.rawBytes and result.length.
        return result.text;
        
    } else {
      
        NSLog(@"解析条码失败");
        
        return  nil;
    }
}


@end
