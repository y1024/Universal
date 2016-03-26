//
//  ALAssetsLibrary+Helper.h
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>


typedef void(^ALAssetsLibraryGroupsSourceEnumerationSuccessBlock)(NSArray  *assetsGroupSourceArray);
typedef void(^ALAssetsLibraryGroupsSourceEnumerationFailureBlock)(NSString *message);
@interface ALAssetsLibrary (Helper)

+ (ALAssetsLibrary *)defaultAssetsLibrary;

- (void)enumerateGroupLibrary:(ALAssetsLibraryGroupsSourceEnumerationSuccessBlock)successBlock failure:(ALAssetsLibraryGroupsSourceEnumerationFailureBlock)failureMessage;


@end
