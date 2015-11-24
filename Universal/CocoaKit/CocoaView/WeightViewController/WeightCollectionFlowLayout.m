//
//  WeightCollectionFlowLayout.m
//  Demo
//
//  Created by 杜晓星 on 15/11/24.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "WeightCollectionFlowLayout.h"

#define kWeightCollectionCellWidth 20

@implementation WeightCollectionFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.allLayoutAttributesMutableArray = [NSMutableArray array];
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    [_allLayoutAttributesMutableArray removeAllObjects];
    NSInteger sections = [self.collectionView numberOfSections];
    for (int sectionI = 0; sectionI < sections; sectionI++){
        NSInteger items = [self.collectionView numberOfItemsInSection:sectionI];
        for (int itemJ = 0; itemJ < items; itemJ++){
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:itemJ inSection:sectionI];
            UICollectionViewLayoutAttributes* layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            layoutAttributes.frame = CGRectMake(kWeightCollectionCellWidth*itemJ, 0, 10, 130);
            [_allLayoutAttributesMutableArray addObject:layoutAttributes];
        }
    }
}

- (CGSize)collectionViewContentSize
{
    NSInteger totalCount = _allLayoutAttributesMutableArray.count + 2;
    
    return CGSizeMake(totalCount*kWeightCollectionCellWidth, CGRectGetHeight(self.collectionView.bounds));
}

- (NSArray* )layoutAttributesForElementsInRect:(CGRect)rect {
    
    return _allLayoutAttributesMutableArray;
}

@end
