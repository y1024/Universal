//
//  CocoaButton.m
//  Universal
//
//  Created by 杜晓星 on 15/10/26.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "CocoaButton.h"

@implementation CocoaButton

- (void)setCocoaEnable:(BOOL)cocoaEnable
{
    self.enabled = cocoaEnable;
    self.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.6];
}

- (BOOL)cocoaEnable
{
    return self.cocoaEnable;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
