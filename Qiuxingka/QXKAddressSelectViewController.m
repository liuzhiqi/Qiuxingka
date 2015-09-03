//
//  QXKAddressSelectViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKAddressSelectViewController.h"
#import "QXKAddressSelectTableViewCell.h"
#import "QXKAddNewAddressViewController.h"
#import "QXKGeneral.h"

@interface QXKAddressSelectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger selectId;
}
@end

@implementation QXKAddressSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectId=0;
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKAddressSelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKAddressSelectTableViewCell"];
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    UIView* tableHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 60)];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake((frameScreen.size.width-150)/2, 15, 150, 30)];
    [tableHeadView addSubview:btn];
    self.tableViewMain.tableHeaderView=tableHeadView;
    [btn addTarget:self action:@selector(btnPushAddAddress) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius=6;
    [btn setTitle:@"＋ 添加新地址" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    btn.backgroundColor=[UIColor QXKGreenDark];
    
    self.arrayAddress=[[NSMutableArray alloc]init];
//    NSDictionary* dic=[[NSDictionary alloc]init];
//    [self.arrayAddress addObject:dic];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self loadAddressList];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return 110;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayAddress.count;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKAddressSelectTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKAddressSelectTableViewCell"];
    
    BOOL isSelect=indexPath.row==selectId;
    NSDictionary*dic=self.arrayAddress[indexPath.row];
    [cell setCellDataWithName:[dic objectForKey:@"consignee"] Number:[dic objectForKey:@"telephone"] Address:[NSString stringWithFormat:@"%@%@%@ %@",[dic objectForKey:@"province"],[dic objectForKey:@"city"],[dic objectForKey:@"district"],[dic objectForKey:@"address"]] isSelected:isSelect];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectId=indexPath.row;
    [self.tableViewMain reloadData];
}
-(void)btnPushAddAddress{
    QXKAddNewAddressViewController* pushView=[[QXKAddNewAddressViewController alloc]init];
    [self.navigationController pushViewController:pushView animated:YES];
    
    
}
-(void)loadAddressList{
    [self.arrayAddress  removeAllObjects];
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/queryAddrList"];
    
    NSString*userid=usrInfo.userId ;
    NSDictionary *parameters;
    
    parameters = @{@"userid":userid};
    
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

            [self.arrayAddress addObjectsFromArray:dic];

        }
       
        [self.tableViewMain reloadData];
        
        
        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //        countCurrentPage--;
        //        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        //        self.tableViewMain.pullTableIsRefreshing = NO;
        //        self.tableViewMain.pullTableIsLoadingMore = NO;
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
}
- (IBAction)btnPushFinish:(id)sender {
    
    
    NSDictionary* dic= self.arrayAddress[selectId];
    
    
    [self.delegate addressSelectWithName:[dic objectForKey:@"consignee"] phone:[dic objectForKey:@"telephone"] address:[NSString stringWithFormat:@"%@%@%@ %@",[dic objectForKey:@"province"],[dic objectForKey:@"city"],[dic objectForKey:@"district"],[dic objectForKey:@"address"]] addressId:[dic objectForKey:@"addr_id"]];
    
    [self.navigationController popViewControllerAnimated:YES];
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
