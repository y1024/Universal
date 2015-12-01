//
//  PhotosHelperCollectionViewCell.m
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "PhotosHelperCollectionViewCell.h"

@implementation PhotosHelperCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSource:(PhotosHelperCollectionViewCellModel *)source
{
    _source = source;
    self.photoImageView.image = source.image;
    self.cellSelected = source.selected;
}

- (void)setCellSelected:(BOOL)cellSelected
{
    _cellSelected = cellSelected;
    
    cellSelected ? (self.photoSelectedIconImageView.image = [UIImage imageNamed:@"btn_tick2_orange"]):(self.photoSelectedIconImageView.image = [UIImage imageNamed:@"btn_tick2_white"]);
    
}

- (void)cellWithSource:(PhotosHelperCollectionViewCellModel*)source
{
    self.photoImageView.image = source.image;
    if (source.selected == YES) {
        self.photoSelectedIconImageView.image = [UIImage imageNamed:@"btn_tick2_orange"];
    }
    else
    {
        self.photoSelectedIconImageView.image = [UIImage imageNamed:@"btn_tick2_white"];
    }
}

@end
