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
 *  类 是否是元
 *
 *  @param cls
 *
 *  @return 
 */
BOOL __clsIsMetaClass(Class cls);


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

+ (BOOL)methodSwizzle:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;

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
