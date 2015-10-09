//
//  UIColor+Extension.m
//  Universal
//
//  Created by emiaobao on 15/9/1.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "UIColor+Extension.h"
#import "PodHeaders.h"
@implementation UIColor (Extension)

+ (UIColor*)hexString:(NSString*)_HexString
{
    unsigned int    redColor = 0 ;
    unsigned int    greenColor = 0 ;
    unsigned int    blueColor = 0 ;
    
    UIColor *resultColor = nil ;
    
    
    if ([_HexString hasPrefix:@"#"]) {
        
        @try {
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(1, 2)]]scanHexInt:&redColor];
            
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(3, 2)]]scanHexInt:&greenColor];
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(5, 2)]]scanHexInt:&blueColor];
            
            
            resultColor = [self R:redColor G:greenColor B:blueColor];
            
            
            return resultColor;
            
        }
        @catch (NSException *exception) {
            
           NSLog(@"\n__FUNCTION__:%s\n__LINE__:%d\nException:%@",__FUNCTION__,__LINE__,exception);
            
            return [UIColor blueColor] ;
            
        }
        @finally {
        }
    }
    else
    {
        
        @try {
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(0, 2)]]scanHexInt:&redColor];
            
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(2, 2)]]scanHexInt:&greenColor];
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(4, 2)]]scanHexInt:&blueColor];
            
            
            resultColor = [self R:redColor G:greenColor B:blueColor];
            
            return resultColor;
            
        }
        @catch (NSException *exception) {
            
            NSLog(@"\n__FUNCTION__:%s\n__LINE__:%d\nException:%@",__FUNCTION__,__LINE__,exception);
            
            return [UIColor blueColor] ;
            
        }
        @finally {
            
        }
    }

}

+ (UIColor*)R:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B
{
    return [self R:_R G:_G B:_B A:1];
}

+ (UIColor*)R:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B A:(CGFloat)_A;

{
    UIColor *RGBColor = nil ;
    
    RGBColor = [UIColor colorWithRed:_R/255.0f green:_G/255.0f blue:_B/255.0f alpha:_A/1.0f];
    
    
    
    return RGBColor;
}

+ (UIColor*)hex:(NSInteger)hex
{
    CGFloat R = (hex >> 16) & 0xFF;
    CGFloat G = (hex >> 8) & 0xFF;
    CGFloat B = (hex) & 0xFF;
    return [self R:R G:G B:B];
}

@end
