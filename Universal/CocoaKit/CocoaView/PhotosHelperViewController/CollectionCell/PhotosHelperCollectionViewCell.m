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
- (IBAction)delegateButtonClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(cellDeleteButtonClick:)]) {
        [_delegate cellDeleteButtonClick:_indexPath];
    }
}

- (void)setSource:(AssetSource *)source
{
    _source = source;
    self.photoImageView.image = source.thumbnailImage;
    self.cellSelected = source.selected;
}

- (void)setCellSelected:(BOOL)cellSelected
{
    _cellSelected = cellSelected;
    
    cellSelected ? (self.photoSelectedIconImageView.image = [UIImage imageNamed:@"btn_tick2_orange"]):(self.photoSelectedIconImageView.image = [UIImage imageNamed:@"btn_tick2_white"]);
    
}

- (void)cellWithSource:(AssetSource*)source
{
    self.photoImageView.image = source.thumbnailImage;
    self.cellSelected = source.selected;

}

@end
