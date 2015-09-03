//
//  QXKMyCardBuyViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/5.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMyCardDealInfoTableViewCell.h"
#import "QXKMyCardBuyViewController.h"
#import "QYTabView.h"
#import "QXKGeneral.h"
#import "QXKOrderInfoChangeViewController.h"
const NSInteger myCardSellCap=10;
@interface QXKMyCardBuyViewController ()<UITableViewDelegate,UITableViewDataSource,QYTabViewDelegate,PullTableViewDelegate>
{
    QYTabView* headView;
    NSInteger countCurrentPage;
    NSInteger tableType;
    UILabel* labelFoot;
}
@end

@implementation QXKMyCardBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;

    headView=[[QYTabView alloc]init];
    headView.frame=CGRectMake(0, 0, frameScreen.size.width, 30);
    headView.delegate=self;
    [self.viewHead addSubview:headView];
    [headView setTabTitleWithArray:@[@"待付款",@"待发货",@"待收货",@"已完成"]];
    headView.idxTab=0;
    headView.canNoSelection=NO;
    tableType=0;
    
    UIView*tableFootView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    labelFoot=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    labelFoot.text=@"没有更多订单了";
    labelFoot.textAlignment=NSTextAlignmentCenter;
    [tableFootView addSubview:labelFoot];
    labelFoot.textColor=[UIColor grayColor];

    
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKMyCardDealInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKMyCardDealInfoTableViewCell"];
    
    
    UIImage* img= [UIImage imageNamed:@"blackArrow"];
    self.tableViewMain.pullArrowImage = img;
    self.tableViewMain.pullBackgroundColor = [UIColor clearColor];
    self.tableViewMain.pullTextColor = [UIColor grayColor];
    
    self.tableViewMain.pullDelegate=self;
    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
    }
    self.tableViewMain.pullLastRefreshDate=nil;
    
    self.arrayDealInfo=[[NSMutableArray alloc]init];
    
    //data init
    
    // Do any additional setup after loading the view from its nib.
}



- (void) refreshTable
{
    
    countCurrentPage=0;
    [self.arrayDealInfo removeAllObjects];
     
#ifdef NO_NETWORK_CONNECTION
    NSDictionary* dic=[[NSDictionary alloc]init];
    [self.arrayDealInfo addObject:dic];
    self.tableViewMain.pullTableIsRefreshing = NO;
    self.tableViewMain.pullTableIsLoadingMore = NO;
    [self.tableViewMain reloadData];
#else
    [self performSelector:@selector(loadPartData) withObject:nil afterDelay:1];
//    [self loadPartData];
    
#endif
    
}

- (void) loadMoreDataToTable
{
    

#ifdef NO_NETWORK_CONNECTION

#else
    
    if((countCurrentPage+1)*myCardSellCap<self.arrayDealInfo.count)
    {
        countCurrentPage++;
    }
    
    
#endif
    self.tableViewMain.pullTableIsRefreshing = NO;
    self.tableViewMain.pullTableIsLoadingMore = NO;
    [self.tableViewMain reloadData];
    
}

//
//
//-(void)loadAllData{
//    
//    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
//    [postUrl appendString:@"/mycard/queryMyCard"];
//    QXKUserInfo* userInfo=[QXKUserInfo shareUserInfo];
//    
//    //    NSString*userid=userInfo.userId;
//    NSString*userid=@"787348d0-126b-11e5-a5da-0959cd299e41";
//    NSNumber*type=[NSNumber numberWithInt:2];
//    
//    NSDictionary *parameters;
//    
//    parameters = @{@"userid":userid ,@"type": type ,@"offset": [NSNumber numberWithInteger:countCurrentPage] ,@"capacity":[NSNumber numberWithInt:myCardBuyCap]};
// 
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        
//        NSError* error;
//        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                       options:kNilOptions
//                                                         error:&error];
//        if ([dic count]!=0)
//        {
//            NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                           options:kNilOptions
//                                                             error:&error];
//            
//            [self.arrayDealInfo addObjectsFromArray:dic];
//            //        }
//            //        else{
//            //
//            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
//            
//            
//        }
//        else{
//            
//            countCurrentPage--;
//        }
//        
//        self.tableViewMain.pullLastRefreshDate = [NSDate date];
//        self.tableViewMain.pullTableIsRefreshing = NO;
//        self.tableViewMain.pullTableIsLoadingMore = NO;
//        [self.tableViewMain reloadData];
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        countCurrentPage--;
//        self.tableViewMain.pullLastRefreshDate = [NSDate date];
//        self.tableViewMain.pullTableIsRefreshing = NO;
//        self.tableViewMain.pullTableIsLoadingMore = NO;
//        NSLog ( @"operation: %@" , operation. responseString );
//        
//        NSLog(@"Error: %@", error);
//    }];
//    
//}
//
//
//
//
-(void)loadPartData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/queryOrderList"];
    QXKUserInfo* userInfo=[QXKUserInfo shareUserInfo];
    
    NSString*userid=userInfo.userId;
    
//    NSString*userid=@"787348d0-126b-11e5-a5da-0959cd299e41";
    
    
    
    NSNumber*tag=[NSNumber numberWithInteger:(tableType)];
    
    
    NSDictionary *parameters;
    
    parameters = @{@"userid":userid ,@"tag": tag ,@"usertype":[NSNumber numberWithInt:1]};
    
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
                       [self.arrayDealInfo addObjectsFromArray:dic];
            
            
        }
//        else{
//            
//            countCurrentPage--;
//        }
        
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        [self.tableViewMain reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        NSLog ( @"operation: %@" , operation. responseString );
        NSLog(@"Error: %@", error);
    }];
    
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



















-(void)tabView:(QYTabView *)tabView changeIdx:(NSInteger)idx{
    tableType=idx;
//    if(!self.tableViewMain.pullTableIsRefreshing) {
        self.tableViewMain.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0];
//    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    
    

        if((countCurrentPage+1)*myCardSellCap>self.arrayDealInfo.count)
        {
           return self.arrayDealInfo.count;
        }
        else return (countCurrentPage+1)*myCardSellCap;

    
    return 0;
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    QXKMyCardDealInfoTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKMyCardDealInfoTableViewCell"];
    
    
    NSDictionary* dic=self.arrayDealInfo[indexPath.row];
    
    
    
    switch (tableType) {
        case 0:
            [cell setCellDataWithName:[dic objectForKey:@"card_name"] Number:[dic objectForKey:@"card_num"] Description:[dic objectForKey:@"card_desc"]  Price:  [dic objectForKey:@"card_price"]  ProfileURL:[dic objectForKey:@"card_pic"] TotalPrice:[NSNumber numberWithInteger:([[dic objectForKey:@"card_price"] intValue] +[[dic objectForKey:@"logistic_price"] intValue])] CardState:@"等待付款"];
            break;
        case 1:
            [cell setCellDataWithName:[dic objectForKey:@"card_name"] Number:[dic objectForKey:@"card_num"] Description:[dic objectForKey:@"card_desc"]  Price:  [dic objectForKey:@"card_price"]  ProfileURL:[dic objectForKey:@"card_pic"] TotalPrice:[NSNumber numberWithInteger:([[dic objectForKey:@"card_price"] intValue] +[[dic objectForKey:@"logistic_price"] intValue])]  CardState:@"买家已付款，等待发货"];
            break;
        case 2:
            [cell setCellDataWithName:[dic objectForKey:@"card_name"] Number:[dic objectForKey:@"card_num"] Description:[dic objectForKey:@"card_desc"]  Price:  [dic objectForKey:@"card_price"]  ProfileURL:[dic objectForKey:@"card_pic"] TotalPrice:[NSNumber numberWithInteger:([[dic objectForKey:@"card_price"] intValue] +[[dic objectForKey:@"logistic_price"] intValue])]  CardState:@"卖家已发货"];
            break;
        case 3:
            [cell setCellDataWithName:[dic objectForKey:@"card_name"] Number:[dic objectForKey:@"card_num"] Description:[dic objectForKey:@"card_desc"]  Price:  [dic objectForKey:@"card_price"]  ProfileURL:[dic objectForKey:@"card_pic"] TotalPrice:[NSNumber numberWithInteger:([[dic objectForKey:@"card_price"] intValue] +[[dic objectForKey:@"logistic_price"] intValue])]  CardState:@"交易已关闭"];
            break;
        default:
            break;
    }
    
    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKOrderInfoChangeViewController*pushView=[[QXKOrderInfoChangeViewController alloc]init];
    pushView.dicPreInfo=self.arrayDealInfo[indexPath.row];
    
    
    if (tableType==0) {
        pushView.strState=@"待付款";
        pushView.typeController=11;
        [pushView setBtnT1:@"" BtnT2:@"取消订单" BtnT3:@"付款"];
    }
    if (tableType==1) {
        
        
        pushView.strState=@"待发货";
        pushView.typeController=12;
        [pushView setBtnT1:@"" BtnT2:@"" BtnT3:@"申请退款"];
    }
    if (tableType==2) {
        
        
        pushView.strState=@"待收货";
        pushView.typeController=13;
        [pushView setBtnT1:@"延迟收货" BtnT2:@"" BtnT3:@"确认收货"];
    }
    if (tableType==3) {
        
        pushView.strState=@"交易关闭";
        pushView.typeController=14;
        [pushView setBtnT1:@"" BtnT2:@"" BtnT3:@""];
    }
    
    [self.navigationController pushViewController:pushView animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
