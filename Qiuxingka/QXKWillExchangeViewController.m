//
//  QXKWillExchangeViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWillExchangeViewController.h"
#import "QXKCardListTableViewCell.h"
@interface QXKWillExchangeViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UIView* headView;
}

@end

@implementation QXKWillExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    
    headView=[[UIView alloc]init];
    headView.frame=CGRectMake(0, 0, frameScreen.size.width, 30);
   
     self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardListTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardListTableViewCell"];
    
    
    
    
    
    //data init
    self.arrayCardInfo=[[NSMutableArray alloc]init];
    NSDictionary* dic=[[NSDictionary alloc]init];
    [self.arrayCardInfo addObject:dic];
    [self loadData];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)loadData{
    
//    
//    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
//    [postUrl appendString:@"/home/showList"];
//    
//    NSString*brand;
//    NSString*category;
//    
//    
//    
//    NSDictionary *parameters;
//    
//    if (self.typeBrand==-1) {
//        
//        
//        category=self.title;
//        brand=@"";
//        parameters = @{@"category":category ,@"offset": @"0" ,@"capacity": @"10" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
//        
//        
//        
//        
//        
//        
//        
//        
//    }else{
//        brand=self.title;
//        category=@"";
//        parameters = @{@"brand": brand ,@"offset": @"0" ,@"capacity": @"10" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
//        
//        
//        
//        
//    }
//    //    parameters = @{@"cond": @"" ,@"category":category  ,@"brand": brand ,@"offset": @"0" ,@"capacity": @"10" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
//    
//    
//    
//    
//    
//    
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    
//    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
//            self.arrayCardInfo=dic;
//            [self.tableViewMain reloadData];
//        }
//        else{
//            
//            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
//            
//            
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog ( @"operation: %@" , operation. responseString );
//        
//        NSLog(@"Error: %@", error);
//    }];
//    //
//    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
//    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
//    //    [self.navigationController pushViewController:pushVuew animated:YES];
//    //
//    
//    
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
    
    NSArray *array = [[self.arrayCardInfo[indexPath.row] objectForKey:@"pictures"] componentsSeparatedByString:@","];
    
    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    QXKCardInfoDetailViewController* push=[[QXKCardInfoDetailViewController alloc]init];
//    
//    [self.navigationController pushViewController:push animated:YES];
//    
    
    
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
