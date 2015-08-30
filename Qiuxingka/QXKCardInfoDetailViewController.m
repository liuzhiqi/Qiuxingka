//
//  QXKCardInfoDetailViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardInfoDetailViewController.h"
#import "QXKCardInfoTableViewCell.h"
#import "QXKCardCommentTableViewCell.h"
#import "QXKEditOrderViewController.h"
#import "QXKGeneral.h"
@interface QXKCardInfoDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation QXKCardInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //data init
    self.arrayCommand=[[NSMutableArray alloc]init];
    NSDictionary* dic=[[NSDictionary alloc]init];
    [self.arrayCommand addObject:dic];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardCommentTableViewCell" ];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardInfoTableViewCell" ];
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/comment/getComment"];
    
    NSString*cardid=[self.dicPreInfo objectForKey:@"cardid"] ;
    
    
    
    NSDictionary *parameters;

    parameters = @{@"cardid":cardid };
    
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
            
            [self.arrayCommand addObjectsFromArray:dic];
            //        }
            //        else{
            //
            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
//        else{
//            
//            countCurrentPage--;
//        }
//        
//        self.tableViewMain.pullLastRefreshDate = [NSDate date];
//        self.tableViewMain.pullTableIsRefreshing = NO;
//        self.tableViewMain.pullTableIsLoadingMore = NO;
//        
//        
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

-(void)loadSellerData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/comment/getComment"];
    
    NSString*cardid=[self.dicPreInfo objectForKey:@"cardid"] ;
    
    
    
    NSDictionary *parameters;
    
    parameters = @{@"cardid":cardid };
    
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
            
            [self.arrayCommand addObjectsFromArray:dic];
            //        }
            //        else{
            //
            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
        //        else{
        //
        //            countCurrentPage--;
        //        }
        //
        //        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        //        self.tableViewMain.pullTableIsRefreshing = NO;
        //        self.tableViewMain.pullTableIsLoadingMore = NO;
        //
        //
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section==0) {
        QXKCardInfoTableViewCell* cell=(QXKCardInfoTableViewCell*)[self tableView:self.tableViewMain cellForRowAtIndexPath:indexPath];
    
    
        return cell.heightCell;
    
    }
    
    QXKCardCommentTableViewCell* cell=(QXKCardCommentTableViewCell*)[self tableView:self.tableViewMain cellForRowAtIndexPath:indexPath];
    return cell.heightCell;

    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 20;
    }
    return 44;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return self.arrayCommand.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        QXKCardInfoTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCardInfoTableViewCell"];
        NSString* pictures=[self.dicPreInfo objectForKey:@"pictures"];
        NSArray *array = [pictures componentsSeparatedByString:@","];
        
        [ cell setCellDataWithName:[self.dicPreInfo objectForKey:@"owner"]  AuthorInfo:@"??" CardName:[self.dicPreInfo objectForKey:@"title"] CardDiscription:[self.dicPreInfo objectForKey:@"describes"] Price:[self.dicPreInfo objectForKey:@"price"]  IsChangeable:[[self.dicPreInfo  objectForKey:@"exchange"] integerValue]==1  Origin:@"??" Images:array SellerProfile:nil];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
    
    
    
    
    
    
    QXKCardCommentTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCardCommentTableViewCell"];
    [cell setCellDataWithName:@"坨坨的小号" Comment:@"真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？真的很好很好吗？" ProfileUrl:@""];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
- (IBAction)btnPushBuy:(id)sender {
    QXKEditOrderViewController* pushView=[[QXKEditOrderViewController alloc]init];
    [self.navigationController pushViewController:pushView animated:YES];
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
