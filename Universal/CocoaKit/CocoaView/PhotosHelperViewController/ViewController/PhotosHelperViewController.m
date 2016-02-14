//
//  PhotosHelperViewController.m
//  Demo
//
//  Created by 杜晓星 on 15/12/1.
//  Copyright © 2015年 杜晓星. All rights reserved.
//

#import "PhotosHelperViewController.h"

#import "PhotosHelperCollectionViewCell.h"
#import "CameraCollectionViewCell.h"
#import "SelectedPhotoCollectionViewCellLayout.h"
#import "SelectedPhotoCollectionViewCell.h"
#import "UICollectionViewFlowLayout+PhotoSource.h"
#import "ALAssetsLibrary+Helper.h"

#import "AssetSource.h"



@interface PhotosHelperViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *selectedContentView;
@property (weak, nonatomic) IBOutlet UIButton *finishSeletedButton;

@property(nonatomic,strong) NSMutableArray  *assetSourceMutableArray;

@property (weak, nonatomic) IBOutlet UICollectionView *sourceCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionView *selectedCollectionView;

@property(nonatomic,strong)UIImagePickerController *cameraPickerController;

@property(nonatomic,assign)NSInteger photosTotalCount;

@property(nonatomic,strong)ALAssetsLibrary *assetsLibrary;

/**
 *  拍照存入本地后 重新刷新数据源
 */
@property(nonatomic,assign)BOOL autoRefreshSource;



@end

@implementation PhotosHelperViewController



- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_autoRefreshSource == YES) {
        [self readALAssetsLibrary];
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
 
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (_selectMax == 0) {
        _selectMax = 3 ;
    }
//    [self defaultNaviBarShowTitle:@"选择图片"];
    
    self.title = @"相机胶卷";
    
    _autoRefreshSource = NO;
    
    self.cameraPickerController = [self buildCameraPickerController];
    [_sourceCollectionView registerNib:[UINib nibWithNibName:@"CameraCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CameraCollectionViewCell"];
    [_sourceCollectionView registerNib:[UINib nibWithNibName:@"PhotosHelperCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotosHelperCollectionViewCell"];
    [_selectedCollectionView registerNib:[UINib nibWithNibName:@"SelectedPhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SelectedPhotoCollectionViewCell"];
    
    _sourceCollectionView.collectionViewLayout = [UICollectionViewFlowLayout photoSource];
    _selectedCollectionView.collectionViewLayout = [[SelectedPhotoCollectionViewCellLayout alloc]init];

    self.assetSourceMutableArray = [NSMutableArray array];
    
    [self readALAssetsLibrary];
    [self buildFinishButtonTitle];
    
    
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(libraryChange:) name:ALAssetsLibraryChangedNotification object:nil];
//    
    
    
}

//- (void)libraryChange:(NSNotification*)noti
//{
//    ALAssetsLibrary *notiObj = noti.object;
//    
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == _sourceCollectionView) {
        return _assetSourceMutableArray.count + 1;
    }
    else if(collectionView == _selectedCollectionView)
    {
        return _hasSelectedPhotosArray.count;
    }
    else
    {
        return 0 ;
    }
    
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *temCell = nil ;
    
    if (collectionView == _sourceCollectionView) {
        if (indexPath.row == 0) {
            CameraCollectionViewCell *cell = (CameraCollectionViewCell*)[self __collectionView:_sourceCollectionView cellWithIndex:indexPath];
            temCell = cell;
        }
        else
        {   PhotosHelperCollectionViewCell *cell = (PhotosHelperCollectionViewCell*)[self __collectionView:_sourceCollectionView cellWithIndex:indexPath];
            temCell = cell;

            AssetSource *source = _assetSourceMutableArray[indexPath.row - 1];
            [cell cellWithSource:source];

        }
    }
    else if (collectionView == _selectedCollectionView)
    {
        SelectedPhotoCollectionViewCell *cell = (SelectedPhotoCollectionViewCell*)[self __collectionView:_selectedCollectionView cellWithIndex:indexPath];
        temCell = cell;
        
         AssetSource *source = _hasSelectedPhotosArray[indexPath.row];
        cell.model = source;
    }
    else
    {
        return temCell;
    }
    
    return temCell ;
}

- (void)readALAssetsLibrary
{
    self.assetsLibrary=[ALAssetsLibrary defaultAssetsLibrary];
//
//    [_assetsLibrary enumerateGroupLibrary:^(NSArray *groupsArray) {
//        
//    } failure:^(NSString *message) {
//       
//        
//        
//    }];
//    return;
    
//    NSArray *languages = [NSLocale preferredLanguages];
//    NSString *currentLanguage = [languages objectAtIndex:0];
//    NSLog( @"%@" , currentLanguage);
    
//    [UtilityUI showHUDLoading:self.view];
    
    __weak __typeof(self)safeSelf = self;
    
    [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        NSLog(@"[group valueForProperty:ALAssetsGroupPropertyName];:%@",[group valueForProperty:ALAssetsGroupPropertyName]);
        
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        
            if (!result) {
//                [UtilityUI dimissHUDView:self.view];
                return ;
            }
                @autoreleasepool {
                    AssetSource *model = [[AssetSource alloc]initWithSource:result];
//                    model.thumbnailImage = thumbnailImage;
                    if (safeSelf.autoRefreshSource == YES) {
                        
                        *stop = YES;
                        model.selected = YES;
                        
                        ALAssetRepresentation *represent = [result defaultRepresentation];
                        model.fullResolutionImage = [UIImage imageWithCGImage:[represent fullResolutionImage]];
                            [safeSelf.hasSelectedPhotosArray addObject:model];
                        [safeSelf.assetSourceMutableArray insertObject:model atIndex:0];
                        [safeSelf reloadCollectionView];
                        [safeSelf buildFinishButtonTitle];
//                        [UtilityUI dimissHUDView:safeSelf.view];
                    }
                    else
                    {
                        for (AssetSource *hasSelectedModel in _hasSelectedPhotosArray) {
                            if ([model.localURLString isEqualToString:hasSelectedModel.localURLString]) {
                                model = hasSelectedModel;
                                model.selected = YES;
                                ALAssetRepresentation *represent = [result defaultRepresentation];
                                model.fullResolutionImage = [UIImage imageWithCGImage:[represent fullResolutionImage]];
                                break ;
                            }
                            
                            else
                            {
                                model.selected = NO;
                            }
                        }
                        
                        [_assetSourceMutableArray addObject:model];
                    }
                }
                if (index == 0) {
//                    [UtilityUI dimissHUDView:self.view];
                    [self reloadCollectionView];
                }
//            }
        }];
        
    } failureBlock:^(NSError *error) {

//        [UtilityUI dimissHUDView:self.view];
    }];
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView == _sourceCollectionView) {
         _autoRefreshSource = NO;
        UICollectionViewCell *cell = [self __collectionView:collectionView cellWithIndex:indexPath];
        if ([cell isKindOfClass:[CameraCollectionViewCell class]]) {
 
//            BOOL access = [UtilityFunc checkCameraAccess];
//            if (!access) {
//                return;
//            }
            
            if ([self beyondLimted]) {

                return ;
            }
            else
            {
                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                }
                UIImagePickerController *imgPickerController = [[UIImagePickerController alloc] init];
                imgPickerController.delegate = self;
                imgPickerController.allowsEditing = YES;
                imgPickerController.sourceType = sourceType;
                
                [self presentViewController:imgPickerController animated:YES completion:nil];
            }
        }
        else
        {
            AssetSource *model = _assetSourceMutableArray[indexPath.row - 1];
            if ([self source:_hasSelectedPhotosArray isContainPhotosHelperCollectionViewCellModel:model]) {
                model.selected = !model.selected ;
                if (model.selected == NO) {
                    [_hasSelectedPhotosArray removeObject:model];
                    [self reloadCollectionView];
                    [self buildFinishButtonTitle];
                }
            }
            else
            {
                if ([self beyondLimted]) {
                    

                    PhotosHelperCollectionViewCell *cell = (PhotosHelperCollectionViewCell*)[self __collectionView:collectionView cellWithIndex:indexPath];
                    NSLog(@"high:%d",cell.photoImageView.highlighted);
                    
                    return ;
                }
                else
                {
                    
                    model.selected = !model.selected ;
                    [self.hasSelectedPhotosArray addObject:model];
                    [self reloadCollectionView];
                    [self buildFinishButtonTitle];
                }
            }
        }
    }
    else{}
}

- (void)reloadCollectionView
{
    if ([_delegate respondsToSelector:@selector(didSelectedImageArray:)]) {
        [_delegate didSelectedImageArray:_hasSelectedPhotosArray];
    }
    [_sourceCollectionView reloadData];
    [_selectedCollectionView reloadData];
}

- (BOOL)beyondLimted
{
    if (_hasSelectedPhotosArray.count >= _selectMax) {
        
        NSString *messageString = [NSString stringWithFormat:@"最多只能选择%ld张图片哦",_selectMax];
//        [UtilityFunc showNoticeText:messageString];
        
        return YES;
    }
    else
    {
        return NO ;
    }
}

- (UICollectionViewCell*)__collectionView:(UICollectionView*)collectionView cellWithIndex:(NSIndexPath*)indexPath
{
    if (collectionView == _sourceCollectionView) {
        if (indexPath.row == 0) {
             return [collectionView dequeueReusableCellWithReuseIdentifier:@"CameraCollectionViewCell" forIndexPath:indexPath];
        }
        else
        {
            return  [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotosHelperCollectionViewCell" forIndexPath:indexPath];
        }
    }
    else if (collectionView == _selectedCollectionView)
    {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"SelectedPhotoCollectionViewCell" forIndexPath:indexPath];
    }
    else
    {
        return nil;
    }
 
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *editImage = [info objectForKey:UIImagePickerControllerEditedImage];
//    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        UIImageWriteToSavedPhotosAlbum(editImage, nil, nil, nil);
    });
     _autoRefreshSource = YES;
    
//    [UtilityUI showHUDLoading:self.cameraPickerController.view];
    
    [self dismissCameraPickerViewControllerWithDelay:3];
//    [self.assetsLibrary writeImageToSavedPhotosAlbum:[originalImage CGImage]
//                                         orientation:(ALAssetOrientation)[originalImage imageOrientation]
//                                     completionBlock:^(NSURL *assetURL, NSError *error) {
//        
//    }];
    
    //保存到相册
    
//    [self.assetsLibrary writeImageToSavedPhotosAlbum:[editImage CGImage]
//                              orientation:(ALAssetOrientation)[editImage imageOrientation]
//                          completionBlock:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self dismissCameraPickerViewControllerWithDelay:0];
}

- (void)dismissCameraPickerViewControllerWithDelay:(NSTimeInterval)timer
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//         [UtilityUI dimissHUDView:self.cameraPickerController.view];
        [self.cameraPickerController dismissViewControllerAnimated:YES completion:nil];
     });
}

- (IBAction)finishButtonClick:(UIButton*)sender {
    
    if (_hasSelectedPhotosArray.count > 0) {
        if ([_delegate respondsToSelector:@selector(didSelectedImageArray:)]) {
            
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                @autoreleasepool {
                    for (AssetSource *model in _hasSelectedPhotosArray) {
                        if (!model.fullResolutionImage) {
                            model.fullResolutionImage = [UIImage imageWithCGImage:[[model.assetSource defaultRepresentation] fullResolutionImage]];
                        }
                    }
                }
            });
            [_delegate didSelectedImageArray:_hasSelectedPhotosArray];
        }
    }

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)buildFinishButtonTitle
{
    NSString *titleString = [NSString stringWithFormat:@"完成(%ld/%ld)",_hasSelectedPhotosArray.count,_selectMax];
    
    [_finishSeletedButton setTitle:titleString forState:normal];
}

- (BOOL)source:(NSMutableArray*)source isContainPhotosHelperCollectionViewCellModel:(AssetSource*)model
{

    BOOL flag = NO;
    
    for (AssetSource *exitModel in source) {
        if ([exitModel.localURLString isEqualToString:model.localURLString]) {
            flag = YES;
            
            break ;
        }
        else
        {
            flag = NO;
        }
    }
    return flag;
}
- (UIImagePickerController*)buildCameraPickerController
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController *imgPickerController = [[UIImagePickerController alloc] init];
    imgPickerController.delegate = self;
    imgPickerController.allowsEditing = YES;
    imgPickerController.sourceType = sourceType;
    
    return imgPickerController;
}
@end
