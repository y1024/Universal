//
//  NSBundle+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSBundle+Extension.h"

@implementation NSBundle (Extension)

+ (NSDictionary*)bundleInfo
{
    return [NSBundle mainBundle].infoDictionary;
}

+ (NSString*)APPName
{
    NSDictionary *appInfoDictionary = [self bundleInfo];
    
    return appInfoDictionary[@"CFBundleDisplayName"];
}

+ (NSString*)APPVersion
{
    NSDictionary *appInfoDictionary = [self bundleInfo];
    
    return appInfoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString*)APPBuildVersion
{
    NSDictionary *appInfoDictionary = [self bundleInfo];
    
    return appInfoDictionary[@"CFBundleVersion"];
}
@end
