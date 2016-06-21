//
//  SourceTableViewController.m
//  Universal
//
//  Created by 杜晓星 on 15/10/10.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "SourceTableViewController.h"

//#import "PodHeaders.h"

#import "NewViewController.h"

#import "RuleViewController.h"

#import "PhotosHelperViewController.h"

#import "ReplyViewController.h"
#import "CollectionCircleViewController.h"

#import "NSObject+Extension.h"

#import "RunTimeObj.h"

#import "GIFViewController.h"









@interface SourceTableViewController ()<RuleViewControllerRuleChangeDelegate>

{
    NSString *_name;
    
    NSInteger intName;
}

@property(nonatomic,strong)NewViewController *nextVC;

@property(nonatomic,strong)NSString *name;

@end

@implementation SourceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    UIImage *qrImage = [self QRCodeWithString:@"http://weibo.com/u/2255024877"];
    

    
//    @"6e4e39b8177043d6abe8c39da528f034";
    
    
//    YTKRequest *ytk = [[YTKRequest alloc]init];
//    ytk.requestUrl = @"https://api.heweather.com/x3/weather?cityid=城市ID&key=你的认证key"
//    [ytk startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//        
//    } failure:^(YTKBaseRequest *request) {
//        
//    }];
    
//    NSString *str = @"之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80";
//    
//    NSLog(@"%lf",[str selfWidthWithFont:18]);
    
//    Ivar ivarName = __clsInstanceVar([self class], @"_name");
    
    
//    _name = @"MyName";
//    intName = 5;
//    
//    Ivar var = __clsInstanceVar([self class], @"intName");
//    
//    NSLog(@"%@",__objGetIvar(self, __clsInstanceVar([self class], @"intName")));
////    NSArray *ay = [NSArray arrayWithObject:@"a"];
////
////    __objSetClass(ay, [NSMutableArray class]);
//    NSLog(@"%s",__clsName([NSArray class]));
//
//    NSMutableArray *muay = [NSMutableArray array];
//    
//    NSLog(@"%s",__objGetClassName(muay));
    
    [self runTime];
}

- (void)runTime
{
    RunTimeObj *obj = [[RunTimeObj alloc]init];
    Class cls = [RunTimeObj class];
    NSLog(@"RunTimeObj--类型:%s",__clsName(cls));
    NSLog(@"RunTimeObj--父类:%s",__clsName(__clsSuperClass(cls)));
    NSLog(@"RunTimeObj--版本：%d",__clsVersion(cls));
    NSLog(@"RunTimeObj--实例分配空间：%ld",__clsInstanceSize(cls));
    
    Class objClass = __objGetClass(obj);
    NSLog(@"obj--类型:%s",__clsName(objClass));
//    __objSetClass(obj, [NSObject class]);
//     NSLog(@"obj--类型:%s",__clsName(objClass));
    NSLog(@"obj--设置类型:%s",__objGetClassName(obj));
    NSLog(@"RunTimeObj--设置类型实例分配空间：%ld",__clsInstanceSize(cls));
    Ivar nameIvar = __clsInstanceVar([RunTimeObj class], @"_ivarName");
    NSLog(@"ivarName:%@",__objGetIvar(obj, nameIvar));
//#warning 由于变量是 基本变量 读取时候 会崩溃
//    Ivar ageIvar = __clsInstanceVar([RunTimeObj class], @"ivarAge");
//    NSLog(@"ivarAge:%@",__objGetIvar(obj, ageIvar));
    __objSetIvar(obj, nameIvar, @"newName");
    NSLog(@"ivarName:%@",__objGetIvar(obj, nameIvar));
    
    
    NSLog(@"objc:%@",__objcGetMetaClass(__clsName(objClass)));
    
//    NSLog(@"%@",objc_getClass((__bridge void *)[NSObject class]));
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
     cell.textLabel.text = @"方正像素15-2";
    cell.textLabel.font = [UIFont fontWithName:@"FZXS15--GB1-0" size:17];
    
//    __clsName([cell class]);
//    
//    __clsInstanceSize([cell class]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row ==1){
//        if (!self.nextVC) {
//            ReplyViewController *newVC = [[ReplyViewController alloc]init];
////            self.nextVC = newVC;
//            [self.view addSubview:newVC.view];
//             [self addChildViewController:newVC];
//        }
        CollectionCircleViewController *circleVC = [[CollectionCircleViewController alloc]init];
        circleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:circleVC animated:YES];
        
       
//        [self.view addSubview:_nextVC.view];
//        [self presentViewController:_nextVC animated:YES completion:nil];

//        [self.navigationController pushViewController:_nextVC animated:YES];
    }
    else if(indexPath.row == 1)
    {
//        NSLog(@"viewControll:%ld",self.navigationController.viewControllers.count);
        
//        RuleViewController *ruleVC = [[RuleViewController alloc]init];
//        ruleVC.ruleMin = 40;
//        ruleVC.ruleMax  = 100 ;
//        
//        ruleVC.delegate = self;
//        [self.navigationController pushViewController:ruleVC animated:YES];
        
        PhotosHelperViewController *ruleVC = [[PhotosHelperViewController alloc]init];
        
//        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:ruleVC];
        
        
        ruleVC.selectMax = 5;
        
        ruleVC.delegate = self;
        
//        [self presentViewController:nav animated:YES completion:^{
//            
//        }];
        
        [self.navigationController pushViewController:ruleVC animated:YES];
//        [tableView.layer shakeAnimation];
    }else {
        GIFViewController *GIFVC = [[GIFViewController alloc]init];
        [self.navigationController pushViewController:GIFVC animated:YES];
    }
}

- (void)ruleDidChange:(CGFloat)current
{
    NSLog(@"%s %lf",__FUNCTION__,current);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
