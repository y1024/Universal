//
//  RunTimeObj.h
//  Universal
//
//  Created by 杜晓星 on 16/1/14.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTimeObj : NSObject

{
    NSInteger   ivarAge;
    NSString    *_ivarName;
}

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;

@end
