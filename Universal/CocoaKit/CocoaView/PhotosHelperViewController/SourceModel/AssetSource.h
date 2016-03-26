//
//  AssetSource.h
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

@interface AssetSource : NSObject


- (instancetype)initWithSource:(ALAsset*)source;

/**
 *  ALAsset
 */
@property(nonatomic,strong)ALAsset                                      *assetSource;

/**
 *  <#Description#>
 */
@property(nonatomic,assign)BOOL               selected;


/**
 *  thumbnail  照片缩略图
 */
@property(nonatomic,strong,readonly)UIImage                             *thumbnailImage;

/**
 *
 */
@property(nonatomic,strong)UIImage                             *aspectRatioThumbnailImage;
/**
 *  全屏图
 */
@property(nonatomic,strong)UIImage                             *fullScreenImage;
/**
 *  全尺寸图
 */
@property(nonatomic,strong)UIImage                             *fullResolutionImage;

/**
 *  url
 */
@property(nonatomic,strong,readonly)NSURL                               *locationURL;

/**
 *  urlString
 */
@property(nonatomic,strong,readonly)NSString                            *localURLString;

/**
 *  fileName
 */
@property(nonatomic,strong,readonly)NSString                            *fileName;

/**
 *  拍摄地点
 */
@property(nonatomic,strong,readonly)NSString               *takeLocation;

@end
