//
//  PhotosHelperCollectionViewCell.h
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PhotosHelperCollectionViewCellModel.h"


@interface PhotosHelperCollectionViewCell : UICollectionViewCell
/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
/**
 *  选择标志
 */
@property (weak, nonatomic) IBOutlet UIImageView *photoSelectedIconImageView;

@property(nonatomic,assign)BOOL cellSelected;

@property(nonatomic,strong)PhotosHelperCollectionViewCellModel *source;


- (void)cellWithSource:(PhotosHelperCollectionViewCellModel*)source;

@end
