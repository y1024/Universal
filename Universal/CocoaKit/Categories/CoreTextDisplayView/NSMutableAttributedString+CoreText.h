//
//  NSMutableAttributedString+CoreText.h
//  Universal
//
//  Created by 杜晓星 on 15/12/24.
//  Copyright © 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (CoreText)

- (void)setTextColor:(UIColor*)color;
- (void)setTextColor:(UIColor*)color range:(NSRange)range;

- (void)setFont:(UIFont*)font;
- (void)setFont:(UIFont*)font range:(NSRange)range;

- (void)setUnderlines:(NSInteger)lines;
- (void)setUnderlines:(NSInteger)lines range:(NSRange)range;
- (void)setUnderlines:(NSInteger)lines underlinesColor:(UIColor*)underlinesColor;
- (void)setUnderlines:(NSInteger)lines range:(NSRange)range underlinesColor:(UIColor*)underlinesColor;

@end
