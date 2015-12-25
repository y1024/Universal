//
//  CoreTextHeaders.h
//  Universal
//
//  Created by 杜晓星 on 15/12/24.
//  Copyright © 2015年 emiaobao. All rights reserved.
//

#ifndef CoreTextHeaders_h
#define CoreTextHeaders_h

typedef enum
{
    ImageAlignmentTop,
    ImageAlignmentCenter,
    ImageAlignmentBottom
} ImageAlignment;

@class CoreTextDisplayView;

@protocol AttributedLabelDelegate <NSObject>
- (void)attributedLabel:(CoreTextDisplayView *)label
             clickedOnLink:(id)linkData;

@end

typedef NSArray *(^AttributedLabelURLBlock)(NSString *text);
//如果文本长度小于这个值,直接在UI线程做Link检测,否则都dispatch到共享线程
#define MinAsyncDetectLinkLength 50

#endif /* CoreTextHeaders_h */
