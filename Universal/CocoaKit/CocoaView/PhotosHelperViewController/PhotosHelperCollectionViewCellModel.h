
//  PhotosHelperCollectionViewCellModel.h
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotosHelperCollectionViewCellModel : NSObject

@property(nonatomic,assign)CGFloat imageWidth;
@property(nonatomic,assign)CGFloat imageHeight;

/**
 *  缩略图
 */
@property(nonatomic,strong)UIImage *thumbnailImage;

/**
 *  大图
 */
@property(nonatomic,strong)UIImage               *fullResolutionImage;

@property(nonatomic,assign)BOOL    selected;

@property(nonatomic,strong)NSString *localURLString;

@property(nonatomic,strong)NSURL *url;


@end
