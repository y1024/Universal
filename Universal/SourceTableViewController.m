//
//  SourceTableViewController.m
//  Universal
//
//  Created by 杜晓星 on 15/10/10.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "SourceTableViewController.h"

#import "PodHeaders.h"

#import "NewViewController.h"

#import "RuleViewController.h"

#import "PhotosHelperViewController.h"




@interface SourceTableViewController ()<RuleViewControllerRuleChangeDelegate>

@property(nonatomic,strong)NewViewController *nextVC;


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
    
    NSString *str = @"之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80之前我们不是使用M80";
    
    NSLog(@"%lf",[str selfWidthWithFont:18]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
     cell.textLabel.text = @"方正像素15-2";
    cell.textLabel.font = [UIFont fontWithName:@"FZXS15--GB1-0" size:17];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row ==1){
        if (!self.nextVC) {
            NewViewController *newVC = [[NewViewController alloc]init];
            self.nextVC = newVC;
        }

        [self.navigationController pushViewController:_nextVC animated:YES];
    }
    else
    {
//        NSLog(@"viewControll:%ld",self.navigationController.viewControllers.count);
        
//        RuleViewController *ruleVC = [[RuleViewController alloc]init];
//        ruleVC.ruleMin = 40;
//        ruleVC.ruleMax  = 100 ;
//        
//        ruleVC.delegate = self;
//        [self.navigationController pushViewController:ruleVC animated:YES];
        
        PhotosHelperViewController *ruleVC = [[PhotosHelperViewController alloc]init];
        ruleVC.selectMax = 5;
        
        ruleVC.delegate = self;
        [self.navigationController pushViewController:ruleVC animated:YES];
        
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
