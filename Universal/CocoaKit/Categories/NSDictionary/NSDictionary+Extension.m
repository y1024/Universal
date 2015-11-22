//
//  NSDictionary+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSDictionary+Extension.h"
//#import "NSObject+Extension.h"
//#import <objc/runtime.h>
#import "NSString+Extension.h"

@implementation NSDictionary (Extension)

//+ (void)load
//{
//    @autoreleasepool {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSMutableArray  *mutableArrayInstance = [self dictionary];
//            [self methodSwizzleWithClassName:NSStringFromClass([mutableArrayInstance class])];
//        });
//    }
//}
//
//+ (void)methodSwizzleWithClassName:(NSString*)clsName
//{
//    const char *clsCharName = clsName.UTF8String;
//    
//    Class subclass = objc_getClass(clsCharName);
//    
//    BOOL arrayI =  [subclass methodSwizzle:@selector(setValue:forKey:) withMethod:@selector(safeSetValue:key:) error:nil];
//    if (arrayI) {
//        NSLog(@"SEL:%@",NSStringFromSelector(@selector(safeSetValue:key:)));
//    }
//    
//}

+ (NSDictionary*)__ldx_dictionaryWithData:(NSData*)data
{
    if ([data isKindOfClass:[NSData class]]) {
        
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    else
    {
        return nil;
    }
}

- (NSString*)__ldx_jsonString
{
    if ([self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    else if ([self isKindOfClass:[NSString class]]) {
        return (NSString*)self;
    }
    else if([self isKindOfClass:[NSData class]])
    {
        NSString *resultString = [NSString stringWithUTF8Data:(NSData*)self];
        
        return resultString;
    }
    else
    {
        NSData *infoData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
        NSString *resultString = [NSString stringWithUTF8Data:infoData];
        
        return resultString;
    }
}

- (id)safeObjectForKey:(NSString*)key
{
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    else
    {
        return [self objectForKey:key];
    }
}

@end
