//
//  SelectedPhotoCollectionViewCellLayout.m
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "SelectedPhotoCollectionViewCellLayout.h"

#define kSelectedPhotoCollectionViewCellLWidth 50

@implementation SelectedPhotoCollectionViewCellLayout

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
            layoutAttributes.frame = CGRectMake(kSelectedPhotoCollectionViewCellLWidth*itemJ,0, kSelectedPhotoCollectionViewCellLWidth, kSelectedPhotoCollectionViewCellLWidth);
            [_allLayoutAttributesMutableArray addObject:layoutAttributes];
        }
    }
}

- (CGSize)collectionViewContentSize
{
    NSInteger totalCount = _allLayoutAttributesMutableArray.count;
    
    return CGSizeMake(totalCount*kSelectedPhotoCollectionViewCellLWidth, CGRectGetHeight(self.collectionView.bounds));
}

- (NSArray* )layoutAttributesForElementsInRect:(CGRect)rect {
    
    return _allLayoutAttributesMutableArray;
}

@end
