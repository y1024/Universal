//
//  AssetsGroupSource.m
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import "AssetsGroupSource.h"

@implementation AssetsGroupSource

- (instancetype)initWithALAssetsGroup:(ALAssetsGroup*)group;
{
    self = [super init];
    if (self) {
        self.groupSource = group;
    }
    return self;
}

- (NSString*)groupName
{
    return [_groupSource valueForProperty:ALAssetsGroupPropertyName];
}

- (NSURL*)groupURL
{
    return [_groupSource valueForProperty:ALAssetsGroupPropertyURL];
}
- (NSString*)groupType
{
    return [_groupSource valueForProperty:ALAssetsGroupPropertyType];
}

- (UIImage*)posterImage
{
    return [UIImage imageWithCGImage:_groupSource.posterImage];
}

- (NSString*)groupPrsistentID
{
    return [_groupSource valueForProperty:ALAssetsGroupPropertyPersistentID];
}

- (NSInteger)numberOfAssets
{
    return _groupSource.numberOfAssets;
}


- (void)enumerateAssetsSuccss:(ALAssetsEnumerateGroupSuccessBlock)success failure:(ALAssetsEnumerateGroupFailureBlock)message
{
    __block NSMutableArray *resultArray = [NSMutableArray array];
    
    [_groupSource enumerateAssetsWithOptions:ALAssetsGroupSavedPhotos usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        
        if (result) {
            
        }
    }];
}

@end
