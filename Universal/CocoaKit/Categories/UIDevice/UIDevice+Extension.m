//
//  UIDevice+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIDevice+Extension.h"

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "NSString+Extension.h"


@interface UIDevice (private)

+ (NSString *)macAddress;

@end

@implementation UIDevice (Extension)
#pragma mark 国际化区域名称
+ (NSString*)deviceLocationModel {
    return [UIDevice currentDevice].localizedModel;
}
#pragma mark 系统名称
+ (NSString*)systemName {
    return [[UIDevice currentDevice] systemName];
}
#pragma mark 设备型号
+ (NSString*)deviceModel {
    return [[UIDevice currentDevice] model];
}

#pragma mark 用户定义设备名称
+ (NSString*)deviceName {
    return [[UIDevice currentDevice] name];
}

+ (BOOL)IPhone
{
    return [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

+ (float)systemVersion
{
    return [[UIDevice currentDevice].systemVersion floatValue];
}

+ (BOOL)IOS9
{
    return [self systemVersion] >= 9.0 && [self systemVersion] < 10.0;
}

+ (BOOL)IOS8
{
    return [self systemVersion] >= 8.0 && [self systemVersion] < 9.0;
}

+ (BOOL)IOS7
{
    return [self systemVersion] >= 7.0 && [self systemVersion] < 8.0 ;
}

+ (BOOL)IOS6
{
    return [self systemVersion] >= 6.0 && [self systemVersion] < 7.0;
}

+ (NSString *)macAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (NSString *)uniqueDeviceIdentifier
{
    NSString *macAddress = [UIDevice  macAddress];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *stringToHash = [NSString stringWithFormat:@"%@%@", macAddress, bundleIdentifier];
    NSString *uniqueIdentifier = [stringToHash MD5];
    
    return uniqueIdentifier;
}

+ (NSString *)uniqueGlobalDeviceIdentifier
{
    NSString *macAddress = [UIDevice  macAddress];
    
    NSString *uniqueGlobalIdentifier = [macAddress MD5];
    
    return uniqueGlobalIdentifier;
}


@end
