//
//  AssetSource.m
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import "AssetSource.h"

@implementation AssetSource


- (instancetype)initWithSource:(ALAsset*)source
{
    self = [super init];
    if (self) {
        self.assetSource = source;
    }
    return self;
}
- (UIImage*)thumbnailImage
{
    UIImage *img = [UIImage imageWithCGImage:_assetSource.thumbnail];
    
    return img;
}
//
//- (UIImage*)aspectRatioThumbnailImage
//{
//    UIImage *img = [UIImage imageWithCGImage:_sourceAsset.aspectRatioThumbnail];
//    
//    return img;
//}
//- (UIImage*)fullScreenImage
//{
//    ALAssetRepresentation *defaultRepresent = [_sourceAsset defaultRepresentation];
//    
//    UIImage *img = [UIImage imageWithCGImage:[defaultRepresent fullScreenImage]];
//    
//    return img;
//}
//
//- (UIImage*)fullResolutionImage
//{
//    ALAssetRepresentation *defaultRepresent = [_sourceAsset defaultRepresentation];
//    
//    UIImage *img = [UIImage imageWithCGImage:[defaultRepresent fullResolutionImage]];
//    
//    return img;
//}
//
- (NSURL*)locationURL
{
    ALAssetRepresentation *defaultRepresent = [_assetSource defaultRepresentation];
    return [defaultRepresent url];
}
- (NSString*)localURLString
{
    return [self.locationURL absoluteString];
}

- (NSString*)fileName
{
    ALAssetRepresentation *defaultRepresent = [_assetSource defaultRepresentation];
    return [defaultRepresent filename];
}

- (NSString*)takeLocation
{
    return [_assetSource valueForKey:ALAssetPropertyLocation];
}


@end
