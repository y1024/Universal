//
//  WeightCollectionViewCell.h
//  Demo
//
//  Created by 杜晓星 on 15/11/24.
//  Copyright © 2015年 杜晓星. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface WeightCollectionViewCellModel : NSObject

@property(nonatomic,assign)CGFloat value;


@end


typedef NS_ENUM(NSUInteger,WeightCollectionViewCellWightViewState) {
    WeightCollectionViewCellWightViewStateShort,
    WeightCollectionViewCellWightViewStateMiddle,
    WeightCollectionViewCellWightViewStateLong,
};


@interface WeightCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightViewHeight;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property(nonatomic,assign)WeightCollectionViewCellWightViewState cellState;
- (void)configCell:(WeightCollectionViewCellModel*)model;

@end
