//
//  ALAssetsLibrary+Helper.m
//  yeemiao
//
//  Created by 杜晓星 on 16/1/26.
//  Copyright © 2016年 Threegene. All rights reserved.
//

#import "ALAssetsLibrary+Helper.h"
#import "AssetsGroupSource.h"

@implementation ALAssetsLibrary (Helper)

+ (ALAssetsLibrary *)defaultAssetsLibrary;
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred,
                  ^{
                      library = [[ALAssetsLibrary alloc] init];
                  });
    return library;
}

- (void)enumerateGroupLibrary:(ALAssetsLibraryGroupsSourceEnumerationSuccessBlock)successBlock failure:(ALAssetsLibraryGroupsSourceEnumerationFailureBlock)failureMessage;
{
    __block NSMutableArray *resultMutableArray = [NSMutableArray array];
    
    [self enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            AssetsGroupSource *source = [[AssetsGroupSource alloc]initWithALAssetsGroup:group];
            [resultMutableArray addObject:source];
            NSLog(@"sourceName:%@",source.groupName);
        }
        else
        {
            if (resultMutableArray.count > 0) {
                NSArray *resultArray = [NSArray arrayWithArray:resultMutableArray];
                successBlock(resultArray);
            }
            else
            {
                failureMessage(@"未读取到相册");
            }
        }
    } failureBlock:^(NSError *error) {
        failureMessage(error.localizedDescription);
        
    }];
}

@end
