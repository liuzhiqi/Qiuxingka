//
//  QXKMessageViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMessageViewController.h"
#import "QXKMessageTableViewCell.h"
#import "QXKMessageCommentViewController.h"
#import "QXKGeneral.h"
#import "QXKEMessageExchangeViewController.h"
@interface QXKMessageViewController ()<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
{
    NSInteger maxPageCap;
    NSInteger countCurrentPage;
    NSDictionary*dicTempSelect;
    MBProgressHUD* HUD;
}
@end

@implementation QXKMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    maxPageCap=10;
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKMessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKMessageTableViewCell"];
    
    
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
    self.arrayMessage=[[NSMutableArray alloc]init];


    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) refreshTable
{
    
    countCurrentPage=0;
    
    [self.arrayMessage removeAllObjects];
    [self loadData];
    
    
}

- (void) loadMoreDataToTable
{
    
    countCurrentPage++;
    if (maxPageCap*countCurrentPage>=self.arrayMessage.count) {
        countCurrentPage--;
    }
    
    self.tableViewMain.pullLastRefreshDate = [NSDate date];
    self.tableViewMain.pullTableIsRefreshing = NO;
    self.tableViewMain.pullTableIsLoadingMore = NO;
    
    
    
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
    [postUrl appendString:@"/message/showAllMessages"];
    
    QXKUserInfo *userInfo=[QXKUserInfo shareUserInfo];
    
    NSDictionary *parameters;
    parameters = @{@"userid":userInfo.userId};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
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
            
            [self.arrayMessage addObjectsFromArray: dic];
            [self.tableViewMain reloadData];
        }
        else{
            
            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
        
        
        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        self.tableViewMain.pullTableIsRefreshing = NO;
        self.tableViewMain.pullTableIsLoadingMore = NO;
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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
    return 25;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    
    
    
    
    if (maxPageCap*(countCurrentPage+1)>=self.arrayMessage.count) {
        return self.arrayMessage.count;
    }

    return maxPageCap*(countCurrentPage+1);
    
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKMessageTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKMessageTableViewCell"];
    NSDictionary*dic=self.arrayMessage[indexPath.section];
    
    NSString*title;
    if ([[dic objectForKey:@"msg_type"] integerValue]==1) {
        title=@"评论消息";
    }
    if ([[dic objectForKey:@"msg_type"] integerValue]==2) {
        title=@"订单消息";
    }
    if ([[dic objectForKey:@"msg_type"] integerValue]==3) {
        title=@"系统消息";
    }
    if ([[dic objectForKey:@"msg_type"] integerValue]==4) {
        title=@"换卡消息";
    }
    
    NSString* pictures=[dic objectForKey:@"pictures"];
    NSArray *array = [pictures componentsSeparatedByString:@","];
    
    [cell setCellDataWithTitle:title Subtitle:[dic objectForKey:@"title"]  Description:[dic objectForKey:@"description"]  ImgUrl:[array objectAtIndex:0]  IsRead: [[dic objectForKey:@"status"] integerValue]==0];

    
    
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Loading";
   

    NSDictionary*dic=self.arrayMessage[indexPath.section];
    
    dicTempSelect=dic;
    if ([[dic objectForKey:@"msg_type"] integerValue]==1) {
        QXKMessageCommentViewController*pushView=[[QXKMessageCommentViewController alloc]init];
        pushView.dicPreInfo=dic;
        [self.navigationController pushViewController:pushView animated:YES];
        
    }
    if ([[dic objectForKey:@"msg_type"] integerValue]==2) {
        [self loadOrderInfo];
//        title=@"订单消息";
    }
    if ([[dic objectForKey:@"msg_type"] integerValue]==3) {
//        title=@"系统消息";
    }
    if ([[dic objectForKey:@"msg_type"] integerValue]==4) {
        
        [HUD showWhileExecuting:@selector(loadExchangeData) onTarget:self withObject:nil animated:YES];
        
        
        }
    

    
    
    
    
    }
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    UIView*tableHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    
    NSString *time=[self.arrayMessage[section] objectForKey:@"time"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyy-MM-dd HH:mm:ss.SSS"];
    
    time= [time stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    time= [time stringByReplacingOccurrencesOfString:@"Z" withString:@""];
    
    
    
    NSDate *dateTime = [formatter dateFromString:time];
    
    [formatter setDateFormat : @"yyyy-MM-dd HH:mm"];
    
   // NSLog(@"%@", [formatter stringFromDate:dateTime]);//打印2011年8月17日 16点26分
    
    label.text=[formatter stringFromDate:dateTime];
    label.textAlignment=NSTextAlignmentCenter;
    [tableHeadView addSubview:label];
    label.font=[UIFont systemFontOfSize:12];
    label.textColor=[UIColor grayColor];
    
    
    return tableHeadView;
    
    
    
}




-(void)loadExchangeData{
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/exchange/getExchangeInfoById"];
    
    QXKUserInfo *userInfo=[QXKUserInfo shareUserInfo];
    
    NSDictionary *parameters;
    parameters = @{@"id":[dicTempSelect objectForKey:@"event_id"]};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         NSError* error;
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:kNilOptions
                                                               error:&error];
         
         
         [HUD hide:YES];
         NSString*TT=[dic objectForKey:@"error"];
         if ( (TT==nil)&&(dic!=nil) )
         {
             if ([[dic objectForKey:@"status"] integerValue]==0)
             {
                 QXKEMessageExchangeViewController*pushView=[[QXKEMessageExchangeViewController alloc]init];
                 pushView.dicDetailInfo=[NSMutableDictionary dictionaryWithDictionary:dic];
                 pushView.dicPreInfo=dicTempSelect;
                 [self.navigationController pushViewController:pushView animated:YES];
                 
                 
             }
         }
         else{
             [MBProgressHUD showHubWithTitle:@"查询信息出错，可能是订单已被删除" type:0 target:self];
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         [HUD hide:YES];
         
         NSLog ( @"operation: %@" , operation. responseString );
         
         NSLog(@"Error: %@", error);
     }];
    
    
    
    
}



-(void)loadOrderInfo{
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/queryOrderByOrderid"];
    
    QXKUserInfo *userInfo=[QXKUserInfo shareUserInfo];
    
    NSDictionary *parameters;
    parameters = @{@"orderid":[dicTempSelect objectForKey:@"event_id"]};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         NSError* error;
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:kNilOptions
                                                               error:&error];
         
         [HUD hide:YES];
         NSString*TT=[dic objectForKey:@"error"];
         if ( (TT==nil)&&(dic!=nil) )
         {
             if ([[dic objectForKey:@"status"] integerValue]==0)
             {
                 
                 
                 
                 
                 
                 
                 
                 
//                 QXKEMessageExchangeViewController*pushView=[[QXKEMessageExchangeViewController alloc]init];
//                 pushView.dicDetailInfo=[NSMutableDictionary dictionaryWithDictionary:dic];
//                 pushView.dicPreInfo=dicTempSelect;
//                 [self.navigationController pushViewController:pushView animated:YES];
//                 
//                 
             }
         }
         else{
             [MBProgressHUD showHubWithTitle:@"查询信息出错，可能是订单已被删除" type:0 target:self];
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         [HUD hide:YES];
         
         NSLog ( @"operation: %@" , operation. responseString );
         
         NSLog(@"Error: %@", error);
     }];
    
    
    
    
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
