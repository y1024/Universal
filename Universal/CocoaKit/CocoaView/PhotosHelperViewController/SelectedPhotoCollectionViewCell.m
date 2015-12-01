//
//  SelectedPhotoCollectionViewCell.m
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "SelectedPhotoCollectionViewCell.h"

@implementation SelectedPhotoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(PhotosHelperCollectionViewCellModel *)model
{
    _model = model;
    _selectedImageView.image = model.image;

}

@end
