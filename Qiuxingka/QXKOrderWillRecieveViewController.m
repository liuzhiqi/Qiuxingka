//
//  QXKOrderWillRecieveViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/6.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderWillRecieveViewController.h"
#import "QXKOrderGoodsInfoTableViewCell.h"
#import "QXKOrderSellerInfoTableViewCell.h"
#import "QXKAddressInfoTableViewCell.h"
#import "QXKOrderPriceTableViewCell.h"
#import "QXKOrderInfoTableViewCell.h"
@interface QXKOrderWillRecieveViewController ()
{
    UILabel* labelHead;
    QXKOrderInfoTableViewCell *tableFootView;
}
@end

@implementation QXKOrderWillRecieveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    UIView*tableHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 30)];
    labelHead=[[UILabel alloc]init];
    labelHead.frame=CGRectMake(0, 0, frameScreen.size.width, 30);
    labelHead.text=self.strState;
    [tableHeadView addSubview:labelHead];
    self.tableViewMain.tableHeaderView=tableHeadView;
    
    
    tableFootView=[[QXKOrderInfoTableViewCell alloc]initWithFrame:CGRectMake(0, 0, frameScreen.size.width, 75)];
    [tableFootView setCellDataWithOrderId:@"????" OrderPaymentId:@"???" OrderDate:@"???"];
    self.tableViewMain.tableFooterView=tableFootView;
    
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSellerInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSellerInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKAddressInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKAddressInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderPriceTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderGoodsInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderInfoTableViewCell"];
    
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
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
        case 4:
        {
            QXKOrderInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderInfoTableViewCell"];
            [cell setCellDataWithOrderId:@"123" OrderPaymentId:@"123" OrderDate:@"2012-00-00"];
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








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
