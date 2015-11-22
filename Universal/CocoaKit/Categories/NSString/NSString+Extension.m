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


NSString *const soundAlert              = @"\a";
NSString *const backspace               = @"\b";
NSString *const formFeed                = @"\f";
NSString *const lineFeed                = @"\n";
NSString *const enterKey                = @"\r";
NSString *const horizontalTab           = @"\t";
NSString *const VerticalTab             = @"\v";
NSString *const backslash               = @"\\";
NSString *const doubleQuotationMarks    = @"\"";
NSString *const SingleQuotes            = @"\'";
NSString *const regxAllNumbers          = @"^[0-9]+$";

@implementation NSString (Extension)

+ (NSString*)HomePath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}



- (NSString*)reutf8;
{
    NSString *resultString = nil ;
    
    if ([self notNullString]) {
        
        resultString = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return resultString ;
}

- (NSString*)utf8
{
    NSString *UTF8String = nil ;
    

    if ([self notNullString]) {
        
        UTF8String = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return UTF8String;
}

- (NSString*)combineSyllablesWithBlank;
{
    if (![self notNullString]) {
        
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
+ (NSString*)resource:(NSString*)name type:(NSString*)type
{
    NSString *resourcePath = [[NSBundle mainBundle]pathForResource:name ofType:type];
    
    return resourcePath;
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

- (NSString*)replaceBackslash
{
    NSString *resultString = nil;
    if ([self notNullString]) {
        NSMutableString *responseString = [NSMutableString stringWithString:self];
        NSString *character = nil;
        for (int i = 0; i < responseString.length; i ++) {
            character = [responseString substringWithRange:NSMakeRange(i, 1)];
            if ([character isEqualToString:backslash])
                [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
        }
        
        
        resultString = [NSString stringWithString:responseString];
    }
 
    
    return resultString;
}

- (BOOL)regexWithString:(NSString*)condition
{
    BOOL result = NO;
    if ([condition isKindOfClass:[NSString class]]) {
        
        NSPredicate *regxPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",condition];
        result = [regxPredicate evaluateWithObject:self];
    }
    return result;
}

- (BOOL)regexAllNumbers;
{
   return  [self regexWithString:regxAllNumbers];
}

+ (NSString*)stringWithUTF8Data:(NSData*)data
{
    if ([data isKindOfClass:[NSNull class]]) {
        return nil;
    }
    else
    {
        return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
}

- (NSString *)urlencode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    size_t sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}
+ (NSString*)QRCodeStringFromImage:(NSString*)imageName;
{
    if (![imageName notNullString]) {
        return nil;
    }
    else
    {
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy:CIDetectorAccuracyHigh }];
        CIImage *image = [[CIImage alloc] initWithImage:[UIImage imageNamed:imageName]];
        NSArray *features = [detector featuresInImage:image];
        
        NSString *resultString = @"";
        
        for (CIQRCodeFeature *feature in features) {
            
            resultString = [resultString stringByAppendingString:feature.messageString];

        }
        return resultString;
    }
}

- (CGFloat)selfHeightWithFont:(CGFloat)font totalWidth:(CGFloat)w
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(w, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName,nil] context:nil];
    
    CGSize resultSize = CGSizeMake(CGRectGetWidth(rect)+1, CGRectGetHeight(rect)+1);
    
    return  resultSize.height ;
}

- (CGFloat)selfWidthWithFont:(CGFloat)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName,nil] context:nil];
    
    CGSize resultSize = CGSizeMake(CGRectGetWidth(rect)+1, CGRectGetHeight(rect)+1);
    
    return  resultSize.width ;
}
@end
