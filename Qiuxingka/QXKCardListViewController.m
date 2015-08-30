//
//  QXKCardListViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/30.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardListViewController.h"
#import "QXKGeneral.h"
#import "QXKCardListTableViewCell.h"
#import "QXKCardInfoDetailViewController.h"
#import "QYTabView.h"
@interface QXKCardListViewController ()<QYTabViewDelegate,UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>
{
    QYTabView* headView;
    NSInteger countCurrentPage;
    NSInteger idxBrand;//!< -1 = nil, 0 = topps, 1 ＝ panini, 2 ＝ Futera) ;
    NSInteger idxCategory;//!< -1 = 品牌卡, 0 = 足球卡, 1 ＝ 篮球卡, 2 ＝ other) ;
}

@end

@implementation QXKCardListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
  
    headView=[[QYTabView alloc]init];
    headView.frame=CGRectMake(0, 0, frameScreen.size.width, 30);
    headView.delegate=self;
    [ self.viewHead addSubview:headView];
    
    idxCategory=self.typeView;
    idxBrand=self.typeBrand;
    
    //navigation init
    if (self.typeBrand==-1) {
        
        headView.idxTab=-1;
        [headView setTabTitleWithArray:@[@"topps",@"panini",@"Futera",@"其他品牌"]];
        
        switch (self.typeView) {
            case 0:
                self.title=@"足球卡";
                break;
            case 1:
                self.title=@"篮球卡";
                break;
            case 2:
                self.title=@"其他卡";
                break;
            default:
                break;
        }

    }else{
        headView.idxTab=-1;
        
        
        [headView setTabTitleWithArray:@[@"足球卡",@"篮球卡",@"其他卡"]];
        
        switch (self.typeBrand) {
            case 0:
                self.title=@"topps";
                break;
            case 1:
                self.title=@"panini";
                break;
            case 2:
                self.title=@"Futera";
                break;
            default:
                break;
        }

        
    }
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    self.tableViewMain.pullDelegate=self;
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardListTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardListTableViewCell"];
    UIImage* img= [UIImage imageNamed:@"blackArrow"];
    self.tableViewMain.pullArrowImage = img;
    self.tableViewMain.pullBackgroundColor = [UIColor clearColor];
    self.tableViewMain.pullTextColor = [UIColor grayColor];
    
    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
    self.tableViewMain.pullLastRefreshDate=nil;

    
    
    
    //data init
    self.arrayCardInfo=[[NSMutableArray alloc]init];
    [self loadData];
    
    
    // Do any additional setup after loading the view from its nib.
}



#pragma mark - Refresh and load more methods

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






-(void)loadData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/home/showList"];
    
    NSString*brand;
    NSString*category;
    
    
    
    NSDictionary *parameters;
    NSArray* arrBrand= @[@"topps",@"panini",@"Futera",@"其他品牌"];
    NSArray* arrCategory=  @[@"足球卡",@"篮球卡",@"其他卡"];
    
    if (idxBrand<0) {
        brand=@"";
    }else{
        brand=arrBrand[idxBrand];
    }

    if (idxCategory<0) {
        category=@"";
    }else{
        category=arrCategory[idxCategory];
    }
    
    
    
    
//    if (self.typeBrand==-1) {
//
//        parameters = @{@"category":category ,@"brand": brand ,@"offset":[NSNumber numberWithInteger:countCurrentPage] ,@"capacity": @"10" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
//        
//        
//    }else{
    
         parameters = @{@"category":category ,@"brand": brand ,@"offset": [NSNumber numberWithInteger:countCurrentPage] ,@"capacity": @"10" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
        
//    }
//    parameters = @{@"cond": @"" ,@"category":category  ,@"brand": brand ,@"offset": @"0" ,@"capacity": @"10" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
    
    
    
    
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    QXKCardListTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCardListTableViewCell"];
    NSString* pictures=[self.arrayCardInfo[indexPath.row] objectForKey:@"pictures"];
    NSArray *array = [pictures componentsSeparatedByString:@","];
    [cell setCellDataWithCardName:[self.arrayCardInfo[indexPath.row] objectForKey:@"title"] DescripTion:[self.arrayCardInfo[indexPath.row] objectForKey:@"describes"] Price:[self.arrayCardInfo[indexPath.row] objectForKey:@"price"] Seller:[self.arrayCardInfo[indexPath.row] objectForKey:@"owner"] CardImgUrl:[array objectAtIndex:0] IsChangeable:[[self.arrayCardInfo[indexPath.row] objectForKey:@"exchange"] intValue]];
    return cell;
    
}
-(void)tabView:(QYTabView *)tabView changeIdx:(NSInteger)idx
{
    if(self.typeView==-1){
        idxCategory=idx;
    }
    else{
        idxBrand=idx;
    }
    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
    self.tableViewMain.pullLastRefreshDate=nil;
    

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKCardInfoDetailViewController* push=[[QXKCardInfoDetailViewController alloc]init];
    push.dicPreInfo=self.arrayCardInfo[indexPath.row];
    [self.navigationController pushViewController:push animated:YES];
    
    
    
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
