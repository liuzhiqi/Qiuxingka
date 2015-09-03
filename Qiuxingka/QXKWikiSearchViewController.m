//
//  QXKWikiSearchViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/28.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiSearchViewController.h"
#import "QXKGeneral.h"
#import "QXKCollectionWikiTableViewCell.h"
const NSInteger pageCap=10;
@interface QXKWikiSearchViewController ()<UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>
{
    
    NSInteger countCurrentPage;
    
}
@end

@implementation QXKWikiSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayCardInfo=[[NSMutableArray alloc]init];
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.hidden=NO;
    
    
    UIImage* img= [UIImage imageNamed:@"blackArrow"];
    self.tableViewMain.pullArrowImage = img;
    self.tableViewMain.pullBackgroundColor = [UIColor clearColor];
    self.tableViewMain.pullTextColor = [UIColor grayColor];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCollectionWikiTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCollectionWikiTableViewCell"];
    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
    self.tableViewMain.pullLastRefreshDate=nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) refreshTable
{
    
    countCurrentPage=0;
    
    [self.arrayCardInfo removeAllObjects];
    [self loadData];
    
    
}

- (void) loadMoreDataToTable
{
    
    countCurrentPage++;
    
    [self loadData];
}
#pragma mark - PullTableViewDelegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:0];
}






- (void)loadData
{
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/wiki/queryList"];
    
    NSString*brand;
    NSString*category;
    NSString*cond;
    
    NSDictionary *parameters;
    brand=@"";
    category=@"";
    cond=self.strSearchKey;
    parameters = @{@"cond":cond,@"category":category,@"brand": brand ,@"offset": [NSNumber numberWithInteger:countCurrentPage] , @"capacity": [NSNumber numberWithInt:pageCap]};// ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        if ([dic count]!=0)
        {
            NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                           options:kNilOptions
                                                             error:&error];
            
            [self.arrayCardInfo addObjectsFromArray:dic];
            //        }
            //        else{
            //
            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
        else{
            
            countCurrentPage--;
        }
        
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        
        
        [self.tableViewMain reloadData];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        countCurrentPage--;
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
    
    
    
    
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayCardInfo.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKCollectionWikiTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCollectionWikiTableViewCell"];
    
    NSDictionary*dic=self.arrayCardInfo[indexPath.row];
    NSString*title=[dic objectForKey:@"wikiname"];
    NSString*description=[dic objectForKey:@"describes"];
    NSString*series=[dic objectForKey:@"series"];
    NSString*brand=[dic objectForKey:@"manufacturer"];
    NSString*cardNum= [NSString stringWithFormat:@"%@",[dic objectForKey:@"serial_number"]];
    NSString*imageViewUrl=[dic objectForKey:@"picture"];
    
    
    
    
    cell.buttonCollection.tag=1;
    [cell setCellDataWithTitle:title description:description series:series brand:brand cardNum:cardNum imageViewUrl:imageViewUrl  cardId:[self.arrayCardInfo[indexPath.row] objectForKey:@"wikiid"]  targetVC:self];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 120;
}








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
