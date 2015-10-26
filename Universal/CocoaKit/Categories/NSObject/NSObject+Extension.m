//
//  NSObject+Extension.m
//  Universal
//
//  Created by 杜晓星 on 15/10/15.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <MJExtension.h>

@implementation NSObject (Extension)

- (NSDictionary*)mjInfo
{
    return [self JSONObject];
}

+ (instancetype)initWithMjInfo:(NSDictionary*)info;
{
    return [self objectWithKeyValues:info];
}

- (void)receiveTextFieldChangeNotificationWithObj:(id)obj action:(SEL)sel
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:sel name:UITextFieldTextDidChangeNotification object:obj];
}
- (void)removeAllNotification
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

+ (BOOL)methodSwizzle:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error
{
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    if (!originalMethod) {
        NSString *string = [NSString stringWithFormat:@" %@ 类没有找到 %@ 方法",NSStringFromClass([self class]),NSStringFromSelector(originalSelector)];
        *error = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:string forKey:NSLocalizedDescriptionKey]];
        return NO;
    }
    
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!swizzledMethod) {
        NSString *string = [NSString stringWithFormat:@" %@ 类没有找到 %@ 方法",NSStringFromClass([self class]),NSStringFromSelector(swizzledSelector)];
        *error = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:-1 userInfo:[NSDictionary dictionaryWithObject:string forKey:NSLocalizedDescriptionKey]];
        return NO;
    }
    
    if (class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    return YES;
}

@end
