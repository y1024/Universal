//
//  UITableView+Extension.m
//  Universal
//
//  Created by 杜晓星 on 15/10/10.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UITableView+Extension.h"
#import "PodHeaders.h"

@implementation UITableView (Extension)

- (void)reload:(BOOL)isRefresh sourceArray:(NSMutableArray*)source responseInoArray:(NSArray*)response class:(Class)sourceClass;
{
    if (isRefresh == YES) {
        [source removeAllObjects];
    }
    if ([response notNull]) {
        for (NSDictionary *modelInfo in response) {
            if ([modelInfo isKindOfClass:[NSDictionary class]]) {
                id  model  = [sourceClass objectWithKeyValues:modelInfo];
                [source addObject:model];
            }
            [self reloadData];
        }
    }
    
}

@end
