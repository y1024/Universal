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
Protocol * __unsafe_unretained *__clscopyProtocolList(Class cls, unsigned int *outCount)
{
    return class_copyProtocolList(cls, outCount);
}

objc_property_t __clsGetProperty(Class cls, const char *name)
{
    return class_getProperty(cls, name);
}
objc_property_t *__clsCopyPropertyList(Class cls, unsigned int *outCount)
{
    return class_copyPropertyList(cls, outCount);
}

const uint8_t *__clsIvarLayout(Class cls)
{
    return class_getIvarLayout(cls);
}
const uint8_t *__clsWeakIvarLayout(Class cls)
{
    return class_getWeakIvarLayout(cls);
}

BOOL __clsAddMethod(Class cls, SEL name, IMP imp,
                     const char *types)
{
    return class_addMethod(cls,name,imp,types);

}
IMP __clsReplaceMethod(Class cls, SEL name, IMP imp,
                        const char *types)
{
    return class_replaceMethod(cls,name, imp,types);

}
BOOL __clsAddIvar(Class cls, const char *name, size_t size,
                   uint8_t alignment, const char *types)
{
    return  class_addIvar(cls,name, size,alignment,types);
}

BOOL __clsAddProtocol(Class cls, Protocol *protocol)
{
    return class_addProtocol(cls,protocol);
}
BOOL __clsAddProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
    return class_addProperty(cls,name,attributes,attributeCount);
}

void __clsReplaceProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
    return class_replaceProperty(cls,name,attributes,attributeCount);
}
void __clsSetIvarLayout(Class cls, const uint8_t *layout)
{
    return class_setIvarLayout(cls,layout);
}
void __clsSetWeakIvarLayout(Class cls, const uint8_t *layout)
{
    return  class_setWeakIvarLayout(cls,layout);
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

/* Adding Classes */

Class __objcAllocateClassPair(Class superclass, const char *name,
                             size_t extraBytes)
{
    return objc_allocateClassPair(superclass,name,extraBytes);
}
void __objcRegisterClassPair(Class cls)
{
    return objc_registerClassPair(cls);
}
Class __objcDuplicateClass(Class original, const char *name, size_t extraBytes)
{
    return objc_duplicateClass(original,name,extraBytes);
}

void __objcDisposeClassPair(Class cls)
{
    return objc_disposeClassPair(cls);
}
/* Adding Classes */



/* Working with Methods */

SEL __methodName(Method m)
{
    return method_getName(m);
}

IMP __methodImplementation(Method m)
{
    return method_getImplementation(m);
}

const char * __methodGetTypeEncoding(Method m)
{
    return method_getTypeEncoding(m);
}

unsigned int __methodNumberOfArguments(Method m)
{
    return method_getNumberOfArguments(m);
}

char *__methodCopyReturnType(Method m)
{
    return method_copyReturnType(m);
}

void __methodReturnType(Method m, char *dst, size_t dst_len)
{
    return method_getReturnType(m, dst, dst_len);
}

struct objc_method_description *__methodDescription(Method m)
{
    return method_getDescription(m);
}

IMP __methodSetImplementation(Method m, IMP imp)
{
    return method_setImplementation(m, imp);
}
void __methodExchangeImplementations(Method m1, Method m2)
{
    return method_exchangeImplementations(m1, m2);
}
/* Working with Methods */



/* Working with Instance Variables */

const char *__ivarName(Ivar v)
{
    return ivar_getName(v);
}
const char *__ivarTypeEncoding(Ivar v)
{
    return ivar_getTypeEncoding(v);
}

ptrdiff_t __ivarOffset(Ivar v)
{
    return ivar_getOffset(v);
}

/* Working with Instance Variables */






/* Working with Properties */

const char *__propertyName(objc_property_t property)
{
    return property_getName(property);
}

const char *__propertyAttributes(objc_property_t property)
{
    return property_getAttributes(property);
}
objc_property_attribute_t *__propertyCopyAttributeList(objc_property_t property, unsigned int *outCount)
{
    return property_copyAttributeList(property, outCount);
}

char *__propertyCopyAttributeValue(objc_property_t property, const char *attributeName)
{
    return property_copyAttributeValue(property, attributeName);
}

/* Working with Properties */




/* Working with Protocols */

Protocol *__objcProtocol(const char *name)
{
    return objc_getProtocol(name);
}

Protocol * __unsafe_unretained *__objcCopyProtocolList(unsigned int *outCount)
{
    return objc_copyProtocolList(outCount);
}
BOOL __protocolConformsToProtocol(Protocol *proto, Protocol *other)
{
    return protocol_conformsToProtocol(proto, other);
}
BOOL __protocolEqual(Protocol *proto, Protocol *other)
{
    return protocol_isEqual(proto, other);
}
const char *__protocolName(Protocol *p)
{
    return protocol_getName(p);
}
struct objc_method_description __protocolMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
    return protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod);
}
struct objc_method_description *__protocolCopyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
    return protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_property_t __protocolProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
    return protocol_getProperty(proto, name, isRequiredProperty, isInstanceProperty);
}
objc_property_t *__protocolCopyPropertyList(Protocol *proto, unsigned int *outCount)
{
    return protocol_copyPropertyList(proto, outCount);
}
Protocol *__unsafe_unretained *__protocolCopyProtocolList(Protocol *proto, unsigned int *outCount)
{
    return protocol_copyProtocolList(proto, outCount);
}
Protocol *__objcAllocateProtocol(const char *name)
{
    return objc_allocateProtocol(name);
}

void __objcRegisterProtocol(Protocol *proto)
{
    return objc_registerProtocol(proto);
}

void __protocolAddMethodDescription(Protocol *proto, SEL name, const char *types, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
    return protocol_addMethodDescription(proto, name, types, isRequiredMethod, isInstanceMethod);
}

void __protocolAddProtocol(Protocol *proto, Protocol *addition)
{
    return protocol_addProtocol(proto, addition);
}

void __protocolAddProperty(Protocol *proto, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
    return protocol_addProperty(proto, name, attributes, attributeCount, isRequiredProperty, isInstanceProperty);
}

/* Working with Protocols */



/* Working with Libraries */

const char **__objcCopyImageNames(unsigned int *outCount)
{
    return objc_copyImageNames(outCount);
}
const char *__clsImageName(Class cls)
{
    return class_getImageName(cls);
}
const char **__objcCopyClassNamesForImage(const char *image,
                                         unsigned int *outCount)
{
    return objc_copyClassNamesForImage(image, outCount);
}

/* Working with Libraries */



/* Working with Selectors */

const char *__selName(SEL sel)
{
    return sel_getName(sel);
}

SEL __selUid(const char *str)
{
    return sel_getUid(str);
}

SEL __selRegisterName(const char *str)
{
    return sel_registerName(str);
}

BOOL __selEqual(SEL lhs, SEL rhs)
{
    return sel_isEqual(lhs, rhs);
}

/* Working with Selectors */


/* Objective-C Language Features */

void __objcEnumerationMutation(id obj)
{
    return objc_enumerationMutation(obj);
}
void objcSetEnumerationMutationHandler(void (*handler)(id))
{
    objc_setEnumerationMutationHandler(handler);
}

IMP __impImplementationWithBlock(id block)
{
    return imp_implementationWithBlock(block);
}

id __impBlock(IMP anImp)
{
    return imp_getBlock(anImp);
}

BOOL __impRemoveBlock(IMP anImp)
{
    return imp_removeBlock(anImp);
}
id __objcLoadWeak(id *location)
{
    return objc_loadWeak(location);
}
id __objcStoreWeak(id *location, id obj)
{
    return objc_storeWeak(location, obj);
}

/* Objective-C Language Features */


/* Associative References */

void __objcSetAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
{
    return objc_setAssociatedObject(object, key, value, policy);
}

id __objcAssociatedObject(id object, const void *key)
{
    return objc_getAssociatedObject(object, key);
}
void __objcRemoveAssociatedObjects(id object)
{
    return objc_removeAssociatedObjects(object);
}

/* Associative References */

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
