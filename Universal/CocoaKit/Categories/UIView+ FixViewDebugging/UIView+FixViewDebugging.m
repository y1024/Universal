//
//  UIView+FixViewDebugging.m
//  Universal
//
//  Created by 杜晓星 on 16/6/17.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#ifdef DEBUG


/**
 *  -[UIWindow viewForFirstBaselineLayout]: unrecognized selector sent to instance
 *  用于DEBUG查看视图 iOS8问题
 *  @param FixViewDebugging
 *
 *  @return
 */

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation UIView (FixViewDebugging)

+ (void)load
{
    Method original = class_getInstanceMethod(self, @selector(viewForBaselineLayout));
    class_addMethod(self, @selector(viewForFirstBaselineLayout), method_getImplementation(original), method_getTypeEncoding(original));
    class_addMethod(self, @selector(viewForLastBaselineLayout), method_getImplementation(original), method_getTypeEncoding(original));
}

@end

#endif
