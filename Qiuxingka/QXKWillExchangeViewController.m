//
//  QXKWillExchangeViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWillExchangeViewController.h"
#import "QXKCardListTableViewCell.h"
#import "QXKWillExchangeTableViewHeader.h"
#import "QXKGeneral.h"
@interface QXKWillExchangeViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    QXKWillExchangeTableViewHeader* viewHeader;
//    UIView* headView;
}

@end

@implementation QXKWillExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"QXKWillExchangeTableViewHeader"owner:self options:nil];
    viewHeader=[nib objectAtIndex:0];
//    viewHeader.frame=CGRectMake(0, 0, frameScreen.size.width, 50);
    [self.viewHead addSubview:viewHeader];
    self.viewHead .translatesAutoresizingMaskIntoConstraints=NO;
   viewHeader.translatesAutoresizingMaskIntoConstraints=NO;
    [self.viewHead  addConstraint:[NSLayoutConstraint constraintWithItem:viewHeader attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.viewHead attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.viewHead addConstraint:[NSLayoutConstraint constraintWithItem:viewHeader attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.viewHead attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.viewHead addConstraint:[NSLayoutConstraint constraintWithItem:viewHeader attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.viewHead attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.viewHead addConstraint:[NSLayoutConstraint constraintWithItem:viewHeader attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.viewHead attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    
    
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
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/home/showCardsOfOwner"];
    QXKUserInfo* userInfo=[QXKUserInfo shareUserInfo];
    NSDictionary *parameters;
    parameters = @{@"owner":userInfo.userId};
    
    
    
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
            self.arrayCardInfo=dic;
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
      [cell setCellDataWithCardName:[self.arrayCardInfo[indexPath.row] objectForKey:@"title"] DescripTion:[self.arrayCardInfo[indexPath.row] objectForKey:@"describes"] Price:[self.arrayCardInfo[indexPath.row] objectForKey:@"price"] Seller:[self.arrayCardInfo[indexPath.row] objectForKey:@"owner"] CardImgUrl:[array objectAtIndex:0] IsChangeable:[[self.arrayCardInfo[indexPath.row] objectForKey:@"exchange"] intValue] cardId:[self.arrayCardInfo[indexPath.row] objectForKey:@"cardid"]  targetVC:self];
    

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
