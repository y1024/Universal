//
//  NSObject+Extension.h
//  Universal
//
//  Created by 杜晓星 on 15/10/15.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Extension)


/**
 *  类名
 *
 *  @param cls
 *
 *  @return
 */
char const* __clsName(Class cls);
/**
 *  父类
 *
 *  @param cls
 *
 *  @return
 */
Class __clsSuperClass(Class cls);
/**
 *  版本号
 *
 *  @param cls
 *
 *  @return 
 */
int __clsVersion(Class cls);
/**
 *  获取实例分配的空间
 *
 *  @param cls
 *
 *  @return
 */
size_t __clsInstanceSize(Class cls);

/**
 *  获取实例变量
 *
 *  @param cls
 *
 *  @return
 */

Ivar __clsInstanceVar(Class cls,NSString *key);

/**
 *  获取类变量
 *
 *  @param cls
 *
 *  @return
 */
Ivar __clsClassVar(Class cls,NSString *key);
/**
 *  获取 实例变量 列表
 *
 *  @param cls
 *  @param outCount
 *
 *  @return 
 */
Ivar* __clsCopyIVarList(Class cls, unsigned int *outCount);
/**
 *  获取 实例 类的实例方法
 *
 *  @param cls
 *  @param name
 *
 *  @return
 */
Method __clsInstanceMethod(Class cls, SEL name);
/**
 *  获取类方法
 *
 *  @param cls
 *  @param name
 *
 *  @return
 */
Method __clsClassMethod(Class cls, SEL name);
/**
 *  获取  类 方法的实现
 *
 *  @param cls
 *  @param name
 *
 *  @return
 */
IMP __clsMethodImplementation(Class cls, SEL name);
/**
 *  获取类的方法列表
 *
 *  @param cls
 *  @param outCount
 *
 *  @return
 */
Method *__clsCopyMethodList(Class cls, unsigned int *outCount);
/**
 *  能否响应某代理方法
 *
 *  @param cls
 *  @param protocol
 *
 *  @return
 */
BOOL __clsConformsToProtocol(Class cls, Protocol *protocol);
/**
 *  类能否响应 某方法
 *
 *  @param cls
 *  @param sel
 *
 *  @return
 */
BOOL __clsRespondsToSelector(Class cls, SEL sel);

/**
 *  获取类的 协议列表
 *
 *  @param cls
 *  @param outCount
 *
 *  @return
 */
Protocol * __unsafe_unretained *__clscopyProtocolList(Class cls, unsigned int *outCount);
/**
 *  类 是否是元
 *
 *  @param cls
 *
 *  @return 
 */
BOOL __clsIsMetaClass(Class cls);
/**
 *  获取类的属性
 *
 *  @param cls
 *  @param name
 *
 *  @return 
 */
objc_property_t __clsGetProperty(Class cls, const char *name);
/**
 *  获取类的属性列表
 *
 *  @param cls
 *  @param outCount
 *
 *  @return
 */
objc_property_t *__clsCopyPropertyList(Class cls, unsigned int *outCount);
/**
 *  获取 类 变量布局
 *
 *  @param cls
 *
 *  @return
 */
const uint8_t *__clsIvarLayout(Class cls);
/**
 *  获取类 弱引用变量 布局
 *
 *  @param cls
 *
 *  @return
 */
const uint8_t *__clsWeakIvarLayout(Class cls);
/**
 *  类增加方法
 *
 *  @param cls
 *  @param name
 *  @param imp
 *  @param types
 *
 *  @return 
 */
BOOL __clsAddMethod(Class cls, SEL name, IMP imp,
                    const char *types);
/**
 *  替换类 某个方法的实现
 *
 *  @param cls
 *  @param name
 *  @param imp
 *  @param types
 *
 *  @return
 */
IMP __clsReplaceMethod(Class cls, SEL name, IMP imp,
                       const char *types);
/**
 *  给 类 增加 变量
 *
 *  @param cls
 *  @param name
 *  @param size
 *  @param alignment
 *  @param types
 *
 *  @return 
 */
BOOL __clsAddIvar(Class cls, const char *name, size_t size,
                  uint8_t alignment, const char *types);
/**
 *  给 类 增加协议
 *
 *  @param cls
 *  @param protocol
 *
 *  @return     
 */
BOOL __clsAddProtocol(Class cls, Protocol *protocol);

/**
 *  给 类 添加 属性
 *
 *  @param cls
 *  @param name
 *  @param attributes
 *  @param attributeCount
 *
 *  @return 
 */
BOOL __clsAddProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount);
/**
 *  替换类的属性
 *
 *  @param cls
 *  @param name
 *  @param attributes
 *  @param attributeCount 
 */
void __clsReplaceProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount);
/**
 *  设置 变量的 layout
 *
 *  @param cls
 *  @param layout   
 */
void __clsSetIvarLayout(Class cls, const uint8_t *layout);
/**
 *  设置 弱引用 变量的 layout
 *
 *  @param cls
 *  @param layout 
 */
void __clsSetWeakIvarLayout(Class cls, const uint8_t *layout);

/**** 实例方法 *******/

/**
 *  获取 实例类
 *
 *  @param obj
 *
 *  @return
 */
Class __objGetClass(id obj);

/**
 *  设置 实例 类
 *
 *  @param obj
 *  @param cls
 *
 *  @return
 */
Class __objSetClass(id obj,Class cls);

/**
 *  判断当前obj 是否是类
 *
 *  @param obj
 *
 *  @return
 */
BOOL __objIsClass(id obj);

/**
 *  获取当前 实例 类型
 *
 *  @param obj
 *
 *  @return
 */
const char *__objGetClassName(id obj);
/**
 *  获取 实例 变量指向内容 如果变量是 基本类型 会报错
 *
 *  @param obj
 *  @param ivar
 *
 *  @return
 */
id __objGetIvar(id obj,Ivar ivar);
/**
 *  设置 实例 变量
 *
 *  @param obj
 *  @param ivar
 *  @param value 
 */
void __objSetIvar(id obj, Ivar ivar, id value);
/**
 *  <#Description#>
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 */
Class __objcGetClass(const char *name);
Class __objcGetMetaClass(const char *name);

Class __objcAllocateClassPair(Class superclass, const char *name,
                              size_t extraBytes);
/**
 *  注册 一个类
 *
 *  @param cls
 */
void __objcRegisterClassPair(Class cls);
/**
 *  销毁 某个类 如果这个类的子类存在 不能去销毁这个类
 *
 *  @param cls 
 */
void __objcDisposeClassPair(Class cls);

/**
 *  获取 方法名字
 *
 *  @param m
 *
 *  @return 
 */
SEL __methodName(Method m);
/**
 *  获取方法的实现
 *
 *  @param m
 *
 *  @return 
 */
IMP __methodImplementation(Method m);
/**
 *  获取 方法返回类型
 *
 *  @param m
 *
 *  @return
 */
const char * __methodGetTypeEncoding(Method m);
/**
 *  返回方法参数个数
 *
 *  @param m
 *
 *  @return
 */
unsigned int __methodNumberOfArguments(Method m);
/**
 *  复制 方法返回 参数  
 *
 *  @param m
 *
 *  @return
 */
char *__methodCopyReturnType(Method m);
/**
 *  
 *
 *  @param m
 *  @param dst
 *  @param dst_len
 */
void __methodReturnType(Method m, char *dst, size_t dst_len);

/**
 *  设置 方法的实现
 *
 *  @param m
 *  @param imp
 *
 *  @return 
 */
IMP __methodSetImplementation(Method m, IMP imp);
/**
 *  交换方法
 *
 *  @param m1
 *  @param m2   
 */
void __methodExchangeImplementations(Method m1, Method m2);

/* Working with Methods */



/* Working with Instance Variables */
/**
 *  获取 ivar的名字
 *
 *  @param v
 *
 *  @return 
 */
const char *__ivarName(Ivar v);
/**
 *  变量的 编码格式
 *
 *  @param v
 *
 *  @return
 */
const char *__ivarTypeEncoding(Ivar v);
/**
 *  获取 变量的偏移量
 *
 *  @param v
 *
 *  @return
 */
ptrdiff_t __ivarOffset(Ivar v);


/* Working with Instance Variables */



/* Working with Properties */
/**
 *  获取属性名字
 *
 *  @param 
 *
 *  @return
 */
const char *__propertyName(objc_property_t property);

const char *__propertyAttributes(objc_property_t property);

objc_property_attribute_t *__propertyCopyAttributeList(objc_property_t property, unsigned int *outCount);

char *__propertyCopyAttributeValue(objc_property_t property, const char *attributeName);


/* Working with Properties */




/* Working with Protocols */

/**
 *  获取 协议
 *
 *  @param name
 *
 *  @return
 */
Protocol *__objcProtocol(const char *name);

/**
 *  获取 协议数组
 *
 *  @param outCount
 *
 *  @return
 */
Protocol * __unsafe_unretained *__objcCopyProtocolList(unsigned int *outCount);

/**
 *  是否 依赖 另外一个协议
 *
 *  @param proto
 *  @param other
 *
 *  @return
 */
BOOL __protocolConformsToProtocol(Protocol *proto, Protocol *other);
/**
 *  判断 协议是否相同
 *
 *  @param proto
 *  @param other
 *
 *  @return
 */
BOOL __protocolEqual(Protocol *proto, Protocol *other);
/**
 *  获取协议名字
 *
 *  @param p
 *
 *  @return
 */
const char *__protocolName(Protocol *p);
/**
 *  获取 协议方法描述
 *
 *  @param p
 *  @param aSel
 *  @param isRequiredMethod
 *  @param isInstanceMethod
 *
 *  @return
 */
struct objc_method_description __protocolMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod);
/**
 *  复制 协议方法描述 数组
 *
 *  @param p
 *  @param isRequiredMethod
 *  @param isInstanceMethod
 *  @param outCount
 *
 *  @return
 */
struct objc_method_description *__protocolCopyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount);
/**
 *  获取 协议的 属性
 *
 *  @param proto
 *  @param name
 *  @param isRequiredProperty
 *  @param isInstanceProperty
 *
 *  @return
 */
objc_property_t __protocolProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty);
/**
 *  复制 协议的属性数组
 *
 *  @param proto
 *  @param outCount
 *
 *  @return
 */
objc_property_t *__protocolCopyPropertyList(Protocol *proto, unsigned int *outCount);
/**
 * 返回 一个协议里面的 协议数组
 *
 *  @param proto
 *  @param outCount
 *
 *  @return
 */
Protocol *__unsafe_unretained *__protocolCopyProtocolList(Protocol *proto, unsigned int *outCount);

/**
 *  初始化 一个 协议
 *
 *  @param name
 *
 *  @return
 */
Protocol *__objcAllocateProtocol(const char *name);
/**
 *  注册 一个 协议
 *
 *  @param proto
 */
void __objcRegisterProtocol(Protocol *proto);

/**
 *  给 协议增加 方法描述
 *
 *  @param proto
 *  @param name
 *  @param types
 *  @param isRequiredMethod
 *  @param isInstanceMethod
 */
void __protocolAddMethodDescription(Protocol *proto, SEL name, const char *types, BOOL isRequiredMethod, BOOL isInstanceMethod);
/**
 *  给协议 增加协议
 *
 *  @param proto
 *  @param addition
 */
void __protocolAddProtocol(Protocol *proto, Protocol *addition);

/**
 *  协议增加 属性
 *
 *  @param proto
 *  @param name
 *  @param attributes
 *  @param attributeCount
 *  @param isRequiredProperty
 *  @param isInstanceProperty
 */
void __protocolAddProperty(Protocol *proto, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount, BOOL isRequiredProperty, BOOL isInstanceProperty);
/* Working with Protocols */



/* Working with Libraries */

/**
 *  获取 动态加载的 framework
 *
 *  @param outCount <#outCount description#>
 *
 *  @return <#return value description#>
 */
const char **__objcCopyImageNames(unsigned int *outCount);

/**
 *  获取 包含 cls的 framework
 *
 *  @param cls
 *
 *  @return
 */
const char *__clsImageName(Class cls);

/**
 *  获取 framework 的所有 cls
 *
 *  @param image    <#image description#>
 *  @param outCount <#outCount description#>
 *
 *  @return <#return value description#>
 */
const char **__objcCopyClassNamesForImage(const char *image,
                                          unsigned int *outCount);



/* Working with Libraries */




/* Working with Selectors */

/**
 *  获取 SEL 名字
 *
 *  @param sel
 *
 *  @return
 */
const char *__selName(SEL sel);

/**
 *  通过名字 找到 SEL
 *
 *  @param str
 *
 *  @return
 */
SEL __selUid(const char *str);

/**
 *  注册 SEL
 *
 *  @param str
 *
 *  @return
 */
SEL __selRegisterName(const char *str);

/**
 *  比较 两个SEL 是否相同
 *
 *  @param lhs
 *  @param rhs
 *
 *  @return
 */
BOOL __selEqual(SEL lhs, SEL rhs);

/* Working with Selectors */



/* Associative References */

/**
 *  设置 关联 obj
 *
 *  @param object
 *  @param key
 *  @param value
 *  @param policy
 */
void __objcSetAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
/**
 *  取的关联 obj
 *
 *  @param object
 *  @param key
 *
 *  @return
 */
id __objcAssociatedObject(id object, const void *key);
/**
 *  移除 关联 obj
 *
 *  @param object
 */
void __objcRemoveAssociatedObjects(id object);

/* Associative References */


- (void)receiveTextFieldChangeNotificationWithObj:(id)obj action:(SEL)sel;

- (void)removeAllNotification;

- (NSDictionary*)mjInfo;

+ (instancetype)initWithMjInfo:(NSDictionary*)info;

- (BOOL)notNullArray;
- (BOOL)notNullString;
- (BOOL)notNullDictionary;

/**
 *  zh-Hans //简体汉字拼音
    en-US   //英文
    zh-Hans //简体手写
    zh-Hans //简体笔画
    zh-Hant //繁体手写
    zh-Hant //繁体仓颉
    zh-Hant //繁体笔画
    emoji   //表情
 *
 *  @param action
 *  @param obj
 */
- (void)obserCurrentInputModeWithAction:(SEL)action object:(id)obj;



/*
        typedef struct objc_class *Class;
        struct objc_class {

        Class isa  OBJC_ISA_AVAILABILITY;



        #if !__OBJC2__

        Class super_class                       OBJC2_UNAVAILABLE;  // 父类

        const char *name                        OBJC2_UNAVAILABLE;  // 类名

        long version                            OBJC2_UNAVAILABLE;  // 类的版本信息，默认为0

        long info                               OBJC2_UNAVAILABLE;  // 类信息，供运行期使用的一些位标识

        long instance_size                      OBJC2_UNAVAILABLE;  // 该类的实例变量大小

        struct objc_ivar_list *ivars            OBJC2_UNAVAILABLE;  // 该类的成员变量链表

        struct objc_method_list **methodLists   OBJC2_UNAVAILABLE;  // 方法定义的链表

        struct objc_cache *cache                OBJC2_UNAVAILABLE;  // 方法缓存

        struct objc_protocol_list *protocols    OBJC2_UNAVAILABLE;  // 协议链表

        #endif
        }
 OBJC2_UNAVAILABLE;
 
 
    

    objc_cache
 
        struct objc_cache {

        unsigned int mask // total = mask + 1                 OBJC2_UNAVAILABLE;

        unsigned int occupied                                    OBJC2_UNAVAILABLE;

        Method buckets[1]                                        OBJC2_UNAVAILABLE;

        };

 mask：一个整数，指定分配的缓存bucket的总数。在方法查找过程中，Objective-C runtime使用这个字段来确定开始线性查找数组的索引位置。指向方法selector的指针与该字段做一个AND位操作(index = (mask & selector))。这可以作为一个简单的hash散列算法。
 occupied：一个整数，指定实际占用的缓存bucket的总数。
 buckets：指向Method数据结构指针的数组。这个数组可能包含不超过mask+1个元素。需要注意的是，指针可能是NULL，表示这个缓存bucket没有被占用，另外被占用的bucket可能是不连续的。这个数组可能会随着时间而增长。
 
 
 
 
 
 

 
 
 
 
 
 
 
*/



@end
