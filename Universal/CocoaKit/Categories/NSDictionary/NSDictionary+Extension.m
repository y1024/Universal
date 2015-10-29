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

- (BOOL)notNull
{
    if (!self) {
        return NO;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    if (![self isKindOfClass:[NSDictionary class]]) {
        
        return NO;
    }
    else
    {
        return YES;
    }
}

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

- (void)safeSetValue:(id)value key:(NSString*)key
{
    if (value && [key isKindOfClass:[NSString class]]) {
        [self setValue:value forKey:key];
    }
    else
    {
        return ;
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


@end
