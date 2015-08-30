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
@interface QXKMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QXKMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKMessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKMessageTableViewCell"];
    
    
    
    
    
    //data init
    self.arrayMessage=[[NSMutableArray alloc]init];
    NSDictionary* dic=[[NSDictionary alloc]init];
    [self.arrayMessage addObject:dic];
    dic=[[NSDictionary alloc]init];
    [self.arrayMessage addObject:dic];
    dic=[[NSDictionary alloc]init];
    [self.arrayMessage addObject:dic];
    //[self loadData];
    

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            
            self.arrayMessage=dic;
            [self.tableViewMain reloadData];
        }
        else{
            
            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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
    return self.arrayMessage.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKMessageTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKMessageTableViewCell"];
    
    
    if (indexPath.row==0) {
        [cell setCellDataWithTitle:@"评论消息" Subtitle:@"测试Subtitle" Description:@"测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription" ImgUrl:nil];
        
    }
    if (indexPath.row==1) {
        [cell setCellDataWithTitle:@"已付款，待发货" Subtitle:@"测试Subtitle" Description:@"测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription" ImgUrl:nil];
        
    }
    if (indexPath.row==2) {
        [cell setCellDataWithTitle:@"换卡消息" Subtitle:@"测试Subtitle" Description:@"测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription测试discription" ImgUrl:nil];
        
    }
    
    
    
    
    
    
    
    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    QXKCardInfoDetailViewController* push=[[QXKCardInfoDetailViewController alloc]init];
    if (indexPath.row==0) {
        QXKMessageCommentViewController*pushView=[[QXKMessageCommentViewController alloc]init];
        
        [self.navigationController pushViewController:pushView animated:YES];
        
        
    }
    if (indexPath.row==1) {
        QXKMessageCommentViewController*pushView=[[QXKMessageCommentViewController alloc]init];
        
        [self.navigationController pushViewController:pushView animated:YES];
        

        
    }
    if (indexPath.row==2) {
        QXKMessageCommentViewController*pushView=[[QXKMessageCommentViewController alloc]init];
        
        [self.navigationController pushViewController:pushView animated:YES];
        

    
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    UIView*tableHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    label.text=@"11:11PM";
    label.textAlignment=NSTextAlignmentCenter;
    [tableHeadView addSubview:label];
    label.font=[UIFont systemFontOfSize:12];
    label.textColor=[UIColor grayColor];
    
    
    return tableHeadView;
    
    
    
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
