//
//  QXKMyCollectionViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMyCollectionViewController.h"
#import "QXKCollectionCardTableViewCell.h"
#import "QXKCollectionWikiTableViewCell.h"
#import "QYTabView.h"
#import "QXKGeneral.h"
@interface QXKMyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate,QYTabViewDelegate,PullTableViewDelegate>
{
    QYTabView* headView;
    NSInteger tableType;
    NSInteger countCurrentPage;
}
@end

@implementation QXKMyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
   
    headView=[[QYTabView alloc]init];
    headView.frame=CGRectMake(0, 0, frameScreen.size.width, 30);
    headView.delegate=self;
    [self.viewHead addSubview:headView];
   
    [headView setTabTitleWithArray:@[@"卡片",@"百科"]];
    headView.idxTab=0;
    tableType=0;
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCollectionCardTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCollectionCardTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCollectionWikiTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCollectionWikiTableViewCell"];
    
    
    UIImage* img= [UIImage imageNamed:@"blackArrow"];
    self.tableViewMain.pullArrowImage = img;
    self.tableViewMain.pullBackgroundColor = [UIColor clearColor];
    self.tableViewMain.pullTextColor = [UIColor grayColor];
    
    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
    self.tableViewMain.pullLastRefreshDate=nil;
    self.tableViewMain.pullDelegate=self;
    
    
    
    
    
    
    //data init
    self.arrayCollectionInfo=[[NSMutableArray alloc]init];
    
    [self loadCardData];

    
    // Do any additional setup after loading the view from its nib.
}



#pragma mark - Refresh and load more methods

- (void) refreshTable
{
    
    countCurrentPage=0;
    
    [self.arrayCollectionInfo removeAllObjects];
    
    if (tableType==0) {
        [self loadCardData];
    }else{
        [self loadWikiData];
    }
    
   
    
    
}

- (void) loadMoreDataToTable
{
    
    countCurrentPage++;
    if (tableType==0) {
        [self loadCardData];
    }else{
        [self loadWikiData];
    }
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





-(void)loadCardData{
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/queryCollect"];
    QXKUserInfo*userInfo=[QXKUserInfo shareUserInfo];
    NSDictionary *parameters;
    // parameters = @{@"userid": userInfo.userId};
    parameters = @{@"userid": @"787348d0-126b-11e5-a5da-0959cd299e41"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        ;
        if ([dic objectForKey:@"error"]!=nil||[dic count]==0) {
            
            
            countCurrentPage--;

            
            
        }else{
            [self.arrayCollectionInfo addObjectsFromArray:dic];
        }
        
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        
        
        [self.tableViewMain reloadData];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        
        
        countCurrentPage--;

        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
    
    
    
    
    
}







-(void)loadWikiData{
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/queryCollect"];
    
    QXKUserInfo*userInfo=[QXKUserInfo shareUserInfo];
    
    NSDictionary *parameters;
    // parameters = @{@"userid": userInfo.userId};
    parameters = @{@"userid": @"787348d0-126b-11e5-a5da-0959cd299e41"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"error"]!=nil||[dic count]==0) {
            
            
            countCurrentPage--;
            
            
            
        }else{
            [self.arrayCollectionInfo addObjectsFromArray:dic];
        }
        
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        
        
        [self.tableViewMain reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        
        
        countCurrentPage--;

        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
    
    
    
    
    
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayCollectionInfo.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableType==0) {
        QXKCollectionCardTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCollectionCardTableViewCell"];
        
        [cell setCellDataWithName:[self.arrayCollectionInfo[indexPath.row] objectForKey:@"title"] DescripTion:[self.arrayCollectionInfo[indexPath.row] objectForKey:@"describes"] Price:[self.arrayCollectionInfo[indexPath.row] objectForKey:@"price"] Seller:[self.arrayCollectionInfo[indexPath.row] objectForKey:@"owner"] CardImg:[self.arrayCollectionInfo[indexPath.row] objectForKey:@"pictures"] CanChange:[self.arrayCollectionInfo[indexPath.row] objectForKey:@"exchange"]];
        return cell;
    }
    QXKCollectionWikiTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCollectionWikiTableViewCell"];
    
    
    return cell;
    
    
}
-(void)tabView:(QYTabView *)tabView changeIdx:(NSInteger)idx
{
    if (tableType==idx) {
        return;
    }
    
    [self.arrayCollectionInfo removeAllObjects];
    
    tableType=idx;
    
    if (idx==0) {
        [self loadCardData];
    }else{
        [self loadWikiData];

    }
    
    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ;
    
    
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
