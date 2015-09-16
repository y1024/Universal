//
//  UIImageView+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/16.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIImageView+Extension.h"

#import "CategoryHeaders.h"


@implementation UIImageView (Extension)

+ (instancetype)drawImaginarylineWithRect:(CGRect)rect
{
    UIImageView *line = [[UIImageView alloc]initWithFrame:rect];
    
    UIGraphicsBeginImageContext(rect.size);   //开始画线
    [line.image drawInRect:CGRectMake(0, 0,CGRectGetWidth(rect),CGRectGetHeight(rect))];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //设置线条终点形状
    
    CGFloat lengths[] = {lineW,intervalW};
    CGContextRef lineRef = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(lineRef, [UIColor R:187 G:187 B:187].CGColor);
    
    CGContextSetLineDash(lineRef, 0, lengths, 2);  //画虚线
    CGContextMoveToPoint(lineRef, 0.0, 0.0);    //开始画线
    CGContextAddLineToPoint(lineRef, CGRectGetWidth(rect), 0.0);
    CGContextStrokePath(lineRef);
    
    line.image = UIGraphicsGetImageFromCurrentImageContext();
    
    return line;
}

@end
