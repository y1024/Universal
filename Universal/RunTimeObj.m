//
//  RunTimeObj.m
//  Universal
//
//  Created by 杜晓星 on 16/1/14.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "RunTimeObj.h"

@implementation RunTimeObj


- (instancetype)init
{
    self = [super init];
    if (self) {
        _ivarName = @"ivarName";
        ivarAge = 100;
    }
    return self;
}

@end
