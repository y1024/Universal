//
//  UIImageView+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/16.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIImageView+Extension.h"

#import "UIColor+Extension.h"

#import <UIImageView+WebCache.h>

#import "UIImage+Extension.h"

#import "UIView+Extension.h"

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

- (void)placeHolderImage:(NSString*)imageName urlImage:(NSString*)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName]];
}

- (void)setFrame:(CGRect)frame QRCodeImageWithQRString:(NSString*)qrString
{
    self.frame = frame;
    self.image = [UIImage QRCodeImageWithString:qrString imageWeight:[self __ldx_width] imageHeight:[self __ldx_height]];
}

@end
