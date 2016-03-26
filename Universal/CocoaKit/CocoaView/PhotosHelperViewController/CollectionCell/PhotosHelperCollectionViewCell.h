//
//  PhotosHelperCollectionViewCell.h
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "PhotosHelperCollectionViewCellModel.h"

#import "AssetSource.h"


#import <AssetsLibrary/AssetsLibrary.h>

@protocol PhotosHelperCollectionViewCellDelegate <NSObject>

- (void)cellDeleteButtonClick:(NSIndexPath*)index;



@end



@interface PhotosHelperCollectionViewCell : UICollectionViewCell
/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
/**
 *  选择标志
 */
@property (weak, nonatomic) IBOutlet UIImageView *photoSelectedIconImageView;

@property(nonatomic,strong)NSIndexPath *indexPath;

@property(nonatomic,assign)BOOL cellSelected;

@property(nonatomic,strong)AssetSource *source;

/**
 *  <#Description#>
 */
@property(nonatomic,assign)id               delegate;
@property(nonatomic,strong)ALAssetsLibrary *assetsLibrary;

- (void)cellWithSource:(AssetSource*)source;

@end
