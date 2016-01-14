//
//  CALayer+Extension.m
//  Universal
//
//  Created by 杜晓星 on 16/1/11.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "CALayer+Extension.h"

@implementation CALayer (Extension)

/*
 *  摇动
 */
- (void)shakeAnimation
{
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 16;
    
    shakeAnimation.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    shakeAnimation.duration = .1f;
    
    //重复
    shakeAnimation.repeatCount =2;
    
    //移除
    shakeAnimation.removedOnCompletion = YES;
    
    [self addAnimation:shakeAnimation forKey:@"shakeAnimation"];
}

@end
