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
#import <CommonCrypto/CommonDigest.h>



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

static NSString *urlExpression = @"((([A-Za-z]{3,9}:(?:\\/\\/)?)(?:[\\-;:&=\\+\\$,\\w]+@)?[A-Za-z0-9\\.\\-]+|(?:www\\.|[\\-;:&=\\+\\$,\\w]+@)[A-Za-z0-9\\.\\-]+)((:[0-9]+)?)((?:\\/[\\+~%\\/\\.\\w\\-]*)?\\??(?:[\\-\\+=&;%@\\.\\w]*)#?(?:[\\.\\!\\/\\\\\\w]*))?)";

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

- (NSString *)htmlString;
{
    __block  NSString *htmlString = [NSString stringWithString:self];
    if ([self notNullString])
    {
        NSRegularExpression *urlRegex = [NSRegularExpression regularExpressionWithPattern:urlExpression
                                                                                  options:NSRegularExpressionCaseInsensitive
                                                                                    error:nil];
        NSString *httpHeader = @"http://";
        NSString *hrefHeader = @"<a href='";
        NSMutableArray *textArray = [NSMutableArray array];
        [urlRegex enumerateMatchesInString:htmlString
                                   options:0
                                     range:NSMakeRange(0, [htmlString length])
                                usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                                    NSRange range = result.range;
                                    NSString *text = [htmlString substringWithRange:range];
                                    NSLog(@"text:%@",text);
                                    NSString *hrefString = nil;
//                                    if ([text hasPrefix:hrefHeader]) {
//                                        hrefString = [htmlString substringWithRange:NSMakeRange(range.location - hrefHeader.length ,hrefHeader.length)];
//                                    }
//                                    else
//                                    {
//                                        hrefString = [htmlString substringWithRange:NSMakeRange(range.location - hrefHeader.length, hrefHeader.length)];
//                                    }
//                                    
//                                    if (![hrefString isContainsString:hrefHeader]) {
                            
                                        [textArray addObject:text];
//                                    }

                                }];
        for (NSString *text in textArray) {
            if (![text hasPrefix:httpHeader]) {
                NSString *hrefString = [NSString stringWithFormat:@"<a href='%@%@'>%@</a>",httpHeader,text,text];
                htmlString = [htmlString stringByReplacingOccurrencesOfString:text withString:hrefString];
            }
            else
            {
                NSString *hrefString = [NSString stringWithFormat:@"<a href='%@'>%@</a>",text,text];
                htmlString = [htmlString stringByReplacingOccurrencesOfString:text withString:hrefString];
            }

        }
    }
    return htmlString;
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

- (NSString *)MD5
{
    return [NSString MD5ByAStr:self];
}

+ (NSString *)MD5ByAStr:(NSString *)aSourceStr
{
    const char* cStr = [aSourceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

- (BOOL)isContainEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

@end
