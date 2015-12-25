//
//  NSMutableAttributedString+CoreText.m
//  Universal
//
//  Created by 杜晓星 on 15/12/24.
//  Copyright © 2015年 emiaobao. All rights reserved.
//

#import "NSMutableAttributedString+CoreText.h"
#import <CoreText/CoreText.h>


@implementation NSMutableAttributedString (CoreText)

- (void)setTextColor:(UIColor*)color
{
    [self setTextColor:color range:NSMakeRange(0, [self length])];
}

- (void)setTextColor:(UIColor*)color range:(NSRange)range
{
    if (color.CGColor)
    {
        [self removeAttribute:(NSString *)kCTForegroundColorAttributeName range:range];
        
        [self addAttribute:(NSString *)kCTForegroundColorAttributeName
                     value:(id)color.CGColor
                     range:range];
    }
}


- (void)setFont:(UIFont*)font
{
    [self setFont:font range:NSMakeRange(0, [self length])];
}

- (void)setFont:(UIFont*)font range:(NSRange)range
{
    if (font)
    {
        [self removeAttribute:(NSString*)kCTFontAttributeName range:range];
        
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)font.fontName, font.pointSize, nil);
        if (nil != fontRef)
        {
            [self addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)fontRef range:range];
            CFRelease(fontRef);
        }
    }
}

- (void)setUnderlines:(NSInteger)lines
{
    [self setUnderlines:lines underlinesColor:nil];
}

- (void)setUnderlines:(NSInteger)lines underlinesColor:(UIColor*)underlinesColor
{
    [self setUnderlines:lines range:NSMakeRange(0, [self length]) underlinesColor:underlinesColor];
}

- (void)setUnderlines:(NSInteger)lines range:(NSRange)range;
{
    [self setUnderlines:lines range:range underlinesColor:nil];
}

- (void)setUnderlines:(NSInteger)lines range:(NSRange)range underlinesColor:(UIColor*)underlinesColor
{
    [self removeAttribute:(NSString *)kCTUnderlineColorAttributeName range:range];
    [self addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                 value:[NSNumber numberWithInteger:[self lines:lines]]
                 range:range];
    UIColor *underColor = underlinesColor;
    if (!underColor) {
        underColor = [UIColor blueColor];
    }
    [self addAttribute:(NSString*)kCTUnderlineColorAttributeName value:(id __nullable)underColor.CGColor range:range];
}


- (CTUnderlineStyle)lines:(NSInteger)lines
{
    if (lines == 0) {
        return kCTUnderlineStyleNone;
    }
    else if (lines == 1)
    {
        return kCTUnderlineStyleSingle;
    }
    else if (lines == 2)
    {
        return kCTUnderlineStyleDouble;
    }
    else
    {
        /**
         *  粗线
         */
        return kCTUnderlineStyleThick;
    }
}

@end
