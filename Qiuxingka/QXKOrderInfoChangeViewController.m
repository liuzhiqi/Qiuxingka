//
//  QXKOrderInfoChangeViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/5.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderInfoChangeViewController.h"
#import "QXKOrderGoodsInfoTableViewCell.h"
#import "QXKOrderSellerInfoTableViewCell.h"
#import "QXKAddressInfoTableViewCell.h"
#import "QXKOrderPriceTableViewCell.h"
#import "QXKOrderInfoTableViewCell.h"


#import "QXKExpressInfoSelectViewController.h"





#import "QXKGeneral.h"
@interface QXKOrderInfoChangeViewController ()<UIAlertViewDelegate>
{
    UILabel* labelHead;
    QXKOrderInfoTableViewCell *tableFootView;
    NSArray* btnTitles;
    
}
@end

@implementation QXKOrderInfoChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    UIView*tableHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    tableHeadView.backgroundColor=[UIColor QXKGreenLight];
    
    labelHead=[[UILabel alloc]init];
    labelHead.frame=CGRectMake(20, 0, frameScreen.size.width, 30);
    labelHead.textColor=[UIColor whiteColor];
    labelHead.text=self.strState;
    [tableHeadView addSubview:labelHead];
    self.tableViewMain.tableHeaderView=tableHeadView;
    
    NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:@"QXKOrderInfoTableViewCell"owner:self options:nil];
    tableFootView = [nibView objectAtIndex:0];
    tableFootView.frame=CGRectMake(0, 0, frameScreen.size.width, 75);
    
    [tableFootView setCellDataWithOrderId:@"????" OrderPaymentId:@"???" OrderDate:@"???"];
    self.tableViewMain.tableFooterView=tableFootView;
    
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSellerInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSellerInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKAddressInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKAddressInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderPriceTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderGoodsInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
    
    self.btn1.hidden=YES;
    self.btn2.hidden=YES;
    self.btn3.hidden=YES;
    
    if (![btnTitles[0] isEqual:@""]) {
        self.btn1.hidden=NO;
        [self.btn1 setTitle:btnTitles[0] forState:UIControlStateNormal];
        
    }
    if (![btnTitles[1] isEqual:@""]) {
        
        self.btn2.hidden=NO;
        [self.btn2 setTitle:btnTitles[1] forState:UIControlStateNormal];
        
    }
    if (![btnTitles[2] isEqual:@""]) {
        
        self.btn3.hidden=NO;
        [self.btn3 setTitle:btnTitles[2] forState:UIControlStateNormal];
        
    }
    
    [self loadSellerData];
    // Do any additional setup after loading the view from its nib.
}

-(void)setBtnT1:(NSString*)btnT1 BtnT2:(NSString*)btnT2 BtnT3:(NSString*)btnT3{
    btnTitles=[[NSArray alloc] init];
    btnTitles=@[btnT1,btnT2,btnT3];




}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            return 100;
            
        }
            break;
        case 1:
        {
            return 80;
        }
            break;
        case 2:
        {
            
            return 120;
            
        }
            break;
        case 3:
        {
            
            return 70;
            
        }
            break;
        case 4:
        {
            
            return 44;
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    return 1;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadSellerData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/findUserById"];
    
    
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
#warning WRIONG
    NSString*cardid=usrInfo.userId ;
    
    //    NSString*cardid=[self.dicPreInfo objectForKey:@"owner"] ;
    
    
    
    NSDictionary *parameters;
    
    parameters = @{@"userid":cardid };
    
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
            
            self.dicSellerInfo=dic;
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    switch (indexPath.row) {
            
        case 0:
        {
            QXKAddressInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKAddressInfoTableViewCell"];
            [cell setCellDataWithName:@"tuotuo酱" Number:@"13291876886" Address:@"浙江省杭州市西湖区三墩镇浙江大学紫金港校区蒙民伟楼308室"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
        case 1:
        {
            QXKOrderSellerInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderSellerInfoTableViewCell"];
            [cell setCellDataWithName:[self.dicSellerInfo objectForKey:@"username"] Number:[self.dicSellerInfo objectForKey:@"telephone"]];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 2:
        {
            QXKOrderGoodsInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
           
            NSString* pictures=[self.dicPreInfo objectForKey:@"card_pic"];
            NSArray *array = [pictures componentsSeparatedByString:@","];
            [cell setCellDataWithName:[self.dicPreInfo objectForKey:@"card_name"]  Number:[self.dicPreInfo objectForKey:@"card_num"] Description:[self.dicPreInfo objectForKey:@"card_desc"] Price:[self.dicPreInfo objectForKey:@"card_price"] ProfileURL:[array objectAtIndex:0]];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
    
        }
            break;
        case 3:
        {
            QXKOrderPriceTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderPriceTableViewCell"];
            [cell setCellDataWithTotalPrice:[self.dicPreInfo objectForKey:@"card_price"]  TransExpense:[self.dicPreInfo objectForKey:@"logistic_price"] ];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    UITableViewCell* cell;
    
    return cell;
    
    
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    QXKCardInfoDetailViewController* push=[[QXKCardInfoDetailViewController alloc]init];
//    
//    
//    [self.navigationController pushViewController:push animated:YES];
//    
    
    
}
- (IBAction)btn1Push:(id)sender {
    if (self.typeController==13) {
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"延迟收货" message:@"是否确认延迟收获？(默认延迟一周)" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=1;
        [alertView show];
        
    }

}
- (IBAction)btn2Push:(id)sender {
    if (self.typeController==11) {

        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"取消订单" message:@"确认取消订单后将无法更改，是否确认取消" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=2;
//        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
        [alertView show];

        
        
        
    }
}
- (IBAction)btn3Push:(id)sender {
    if (self.typeController==1) {
        QXKExpressInfoSelectViewController* pushView=[[QXKExpressInfoSelectViewController alloc]init];
        [self.navigationController pushViewController:pushView animated:YES];
    }
    
    if (self.typeController==11) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"确认付款" message:[NSString stringWithFormat:@"您的订单总价为%@元，是否确认付款\n如需修改运费请与卖家联系", [NSNumber numberWithInt:14]] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=3;
        //        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
        [alertView show];
    }
    
    if (self.typeController==12) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"申请退款" message: @"是否确认申请退款？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=3;
        //        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
        [alertView show];
    }
    
    if (self.typeController==13) {
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"确认收货" message:@"确认收货后，您的付款将被打到卖家账户中\n是否确认？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=3;
        [alertView show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (alertView.tag) {
        case 1:
        {
            if (self.typeController==13) {
                
                if (buttonIndex==1) {
                    [self loadDelayTime];
                }
            }
        }
            break;
        case 2:
        {
            if (self.typeController==11) {
                
                [self loadDeleteOrder];
                
            }

        }
            break;
        case 3:
        {
//                if (self.typeController==11) {
//                UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"确认付款" message:[NSString stringWithFormat:@"您的订单总价为%@元，是否确认付款\n如需修改运费请与卖家联系", [NSNumber numberWithInt:14]] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//                alertView.tag=3;
//                //        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
//                [alertView show];
//            }
            
//            if (self.typeController==12) {
//                UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"申请退款" message: @"是否确认申请退款？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//                alertView.tag=3;
//                //        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
//                [alertView show];
//            }
            
//            if (self.typeController==13) {
//                
//                UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"确认收货" message:@"确认收货后，您的付款将被打到卖家账户中\n是否确认？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//                alertView.tag=3;
//                [alertView show];
//            }

        }
            break;
            
        default:
            break;
    }
    
    
    
}

-(void)loadDelayTime{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/receiveOrder"];
//    QXKUserInfo* userInfo=[QXKUserInfo shareUserInfo];
//    NSString*userid=userInfo.userId;
    NSDictionary *parameters;
    parameters = @{@"orderid":[self.dicPreInfo objectForKey:@"orderid"]};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        NSLog(@"Error: %@", error);
    }];
    
    
}

-(void)loadDeleteOrder{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/cancleOrder"];
    //    QXKUserInfo* userInfo=[QXKUserInfo shareUserInfo];
    //    NSString*userid=userInfo.userId;
    NSDictionary *parameters;
    parameters = @{@"orderid":[self.dicPreInfo objectForKey:@"orderid"]};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        
        [MBProgressHUD showHubWithTitle:@"取消订单成功" type:1 deleController:self];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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
