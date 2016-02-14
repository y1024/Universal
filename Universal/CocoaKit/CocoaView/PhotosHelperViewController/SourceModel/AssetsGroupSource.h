//
//  AssetsGroupSource.h
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

typedef void(^ALAssetsEnumerateGroupSuccessBlock)(NSArray  *assetSourceArray);
typedef void(^ALAssetsEnumerateGroupFailureBlock)(NSString *errorMessage);


@interface AssetsGroupSource : NSObject

/**
 *  ALAssetsGroup
 */
@property(nonatomic,strong)ALAssetsGroup                            *groupSource;
/**
 *  ALAssetsGroupPropertyName  相机胶卷  Camera Roll
 */
@property(nonatomic,strong,readonly)NSString                        *groupName;
/**
 *  ALAssetsGroupPropertyPersistentID
 */
@property(nonatomic,strong,readonly)NSString                         *groupPrsistentID;
/**
 *  ALAssetsGroupPropertyType
 */
@property(nonatomic,strong,readonly)NSString                         *groupType;
/**
 *  ALAssetsGroupPropertyURL
 */
@property(nonatomic,strong,readonly)NSURL                            *groupURL;
/**
 *   封面图片
 */
@property(nonatomic,strong,readonly)UIImage                         *posterImage;



/**
 *  照片数量
 */
@property(nonatomic,assign,readonly)NSInteger               numberOfAssets;


- (instancetype)initWithALAssetsGroup:(ALAssetsGroup*)group;

/**
 *  默认 默认按照时间倒序排列 最新的图片在前面
 *
 *  @param success
 *  @param message
 */
- (void)enumerateAssetsSuccss:(ALAssetsEnumerateGroupSuccessBlock)success failure:(ALAssetsEnumerateGroupFailureBlock)message;


@end
