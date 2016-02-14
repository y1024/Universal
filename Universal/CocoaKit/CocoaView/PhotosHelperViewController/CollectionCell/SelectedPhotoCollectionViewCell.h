//
//  SelectedPhotoCollectionViewCell.h
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssetSource.h"





@interface SelectedPhotoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;


@property(nonatomic,strong)AssetSource *model;


@end
