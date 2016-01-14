//
//  NSObject+Extension.m
//  Universal
//
//  Created by 杜晓星 on 15/10/15.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSObject+Extension.h"

#import <UIKit/UIKit.h>
#import <MJExtension.h>


@implementation NSObject (Extension)

#pragma mark clsMethod
char const* __clsName(Class cls)
{
    return class_getName(cls);
}

Class __clsSuperClass(Class cls)
{
    return class_getSuperclass(cls);
}

int __clsVersion(Class cls)
{
    return class_getVersion(cls);
}
void __clsSetVersion(Class cls, int version)
{
    return class_setVersion(cls,version);
}

size_t __clsInstanceSize(Class cls)
{
    return class_getInstanceSize(cls);
}

Ivar __clsInstanceVar(Class cls,NSString *key)
{
    return class_getInstanceVariable(cls, [key UTF8String]);
}

Ivar __clsClassVar(Class cls,NSString *key)
{
    return class_getClassVariable(cls, [key UTF8String]);
}

Ivar* __clsCopyIVarList(Class cls, unsigned int *outCount)
{
    return class_copyIvarList(cls,outCount);
}
Method __clsInstanceMethod(Class cls, SEL name)
{
    return  class_getInstanceMethod(cls,name);
}
Method __clsClassMethod(Class cls, SEL name)
{
    return  class_getClassMethod(cls,name);
}
IMP __clsMethodImplementation(Class cls, SEL name)
{
    return class_getMethodImplementation(cls, name);
}
BOOL __clsRespondsToSelector(Class cls, SEL sel)
{
    return class_respondsToSelector(cls,sel);
}

Method *__clsCopyMethodList(Class cls, unsigned int *outCount)
{
    return class_copyMethodList(cls,outCount);
}

BOOL __clsConformsToProtocol(Class cls, Protocol *protocol)
{
    return class_conformsToProtocol(cls,protocol);
}

BOOL __clsIsMetaClass(Class cls)
{
    return class_isMetaClass(cls);
}

#pragma mark objMethod
Class __objGetClass(id obj)
{
    return object_getClass(obj);
}

Class __objSetClass(id obj,Class cls)
{
    return object_setClass(obj, cls);
}

BOOL __objIsClass(id obj)
{
    return object_isClass(obj);
}

const char *__objGetClassName(id obj)
{
    return object_getClassName(obj);
}

id __objGetIvar(id obj,Ivar ivar)
{
    return object_getIvar(obj, ivar);
}

void __objSetIvar(id obj, Ivar ivar, id value)
{
    object_setIvar(obj, ivar, value);
}

#pragma mark objcMethod

Class __objcGetClass(const char *name)
{
    return objc_getClass(name);
}
Class __objcGetMetaClass(const char *name)
{
    return objc_getMetaClass(name);
}
Class __objclookupClass(const char *name)
{
    return objc_lookUpClass(name);
}
Class __objcGetRepairClass(const char *name)
{
    return objc_getRequiredClass(name);
}

int __objcGetClassList(Class *buffer, int bufferCount)
{
    return objc_getClassList(buffer, bufferCount);
}

Class *__objcCopyClassList(unsigned int *outCount)
{
    return objc_copyClassList(outCount);
}


#pragma mark
- (NSDictionary*)mjInfo
{
    return [self mj_JSONObject];
}

+ (instancetype)initWithMjInfo:(NSDictionary*)info;
{
    return [self mj_objectWithKeyValues:info];
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

- (BOOL)notNullArray;
{
    if (!self) {
        
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    
    if (![self isKindOfClass:[NSArray class]]) {
        
        return NO ;
    }
    if ([(NSArray*)self count] == 0) {
        
        return NO;
    }
    else
    {
        return YES;
    }
}
- (BOOL)notNullString
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
    if ([@"<null>" isEqualToString:(NSString*)self]) {
        
        return NO;
    }
    if ([((NSString*)self)isEqualToString:@"(null)"]) {
        
        return NO;
    }
    if ([[(NSString*)self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        
        return NO ;
    }
    else
    {
        return YES;
    }
}

- (BOOL)notNullDictionary
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

- (void)obserCurrentInputModeWithAction:(SEL)action object:(id)obj;
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:action name:UITextInputCurrentInputModeDidChangeNotification object:obj];
}

@end
