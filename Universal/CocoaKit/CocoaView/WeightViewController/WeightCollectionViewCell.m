//
//  WeightCollectionViewCell.m
//  Demo
//
//  Created by 杜晓星 on 15/11/24.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "WeightCollectionViewCell.h"


@implementation WeightCollectionViewCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.value = [NSNumber numberWithFloat:0.0];
    }
    return self;
}

@end

@implementation WeightCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configCell:(WeightCollectionViewCellModel*)model
{
 
    self.cellState = [self stateWithNumber:[model.value floatValue]];

    self.valueLabel.text = [NSString stringWithFormat:@"%@",model.value];
}

- (WeightCollectionViewCellWightViewState)stateWithNumber:(CGFloat)number
{
    NSNumber *numberVaule = [NSNumber numberWithFloat:number * 10];
    
    NSInteger tenMltiple = [numberVaule integerValue];
    
       NSLog(@"number:%@",[NSNumber numberWithFloat:number * 10]);
    if (tenMltiple % 10 == 0) {
        
        return WeightCollectionViewCellWightViewStateLong;
    }
    else
    {
        if (tenMltiple % 5 == 0) {
            
            return WeightCollectionViewCellWightViewStateMiddle;
        }
        else
        {
            return WeightCollectionViewCellWightViewStateShort;
        }
    }
}

- (void)setCellState:(WeightCollectionViewCellWightViewState)cellState
{
    _cellState = cellState;
    if (cellState == WeightCollectionViewCellWightViewStateLong) {
        self.valueLabel.hidden = NO;
        self.weightViewHeight.constant = 30;
    }
    else if (cellState == WeightCollectionViewCellWightViewStateMiddle)
    {
        self.valueLabel.hidden = YES;
        self.weightViewHeight.constant = 25;
    }
    else
    {
        self.valueLabel.hidden = YES;
        self.weightViewHeight.constant = 20;
    }
    
    
}


@end
