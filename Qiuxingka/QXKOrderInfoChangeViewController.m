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
@interface QXKOrderInfoChangeViewController ()
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
            
            return 44;
            
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
            [cell setCellDataWithName:@"刘致奇" Number:@"13291878888"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 2:
        {
            QXKOrderGoodsInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
            [cell setCellDataWithName:@"欧洲杯皇马限量卡" Number:@"1" Description:@"欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版，欧洲杯皇家马德里白金版" Price:@"123" ProfileURL:nil];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
        case 3:
        {
            QXKOrderPriceTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderPriceTableViewCell"];
            [cell setCellDataWithTotalPrice:nil TransExpense:@"12"];
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
    
}
- (IBAction)btn2Push:(id)sender {
    
}
- (IBAction)btn3Push:(id)sender {
    if (self.typeController==1) {
        QXKExpressInfoSelectViewController* pushView=[[QXKExpressInfoSelectViewController alloc]init];
        [self.navigationController pushViewController:pushView animated:YES];
    }
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
