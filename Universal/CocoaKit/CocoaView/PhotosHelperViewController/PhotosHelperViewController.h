//
//  PhotosHelperViewController.h
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotosHelperCollectionViewCellModel.h"


@protocol PhotosHelperViewControllerDelegate <NSObject>

- (void)didSelectedImageArray:(NSMutableArray*)array;


@end


@interface PhotosHelperViewController : UIViewController

/**
 *  支持最多选取几张
 */
@property(nonatomic,assign)NSInteger selectMax;


@property(nonatomic,assign)id delegate;
/**
 *  已选择
 */
@property(nonatomic,strong)NSMutableArray *hasSelectedPhotosArray;

@end
