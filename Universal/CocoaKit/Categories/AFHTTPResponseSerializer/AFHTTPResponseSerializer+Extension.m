//
//  AFHTTPResponseSerializer+Extension.m
//  Universal
//
//  Created by 杜晓星 on 15/10/9.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "AFHTTPResponseSerializer+Extension.h"

@implementation AFHTTPResponseSerializer (Extension)

- (void)addAcceptableContentType:(NSString*)type
{
    NSMutableSet *mutSet = [NSMutableSet setWithSet:self.acceptableContentTypes];
    [mutSet addObject:type];
    self.acceptableContentTypes = mutSet ; 
}

@end
