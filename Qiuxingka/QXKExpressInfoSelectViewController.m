//
//  QXKExpressInfoSelectViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/29.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKExpressInfoSelectViewController.h"
#import "QXKOrderGoodsInfoTableViewCell.h"
#import "QXKOrderSellerInfoTableViewCell.h"
#import "QXKAddressInfoTableViewCell.h"
#import "QXKOrderPriceTableViewCell.h"
#import "QXKOrderInfoTableViewCell.h"
#import "QXKExpressInfoSelectTableViewCell.h"
#import "QXKGeneral.h"
@interface QXKExpressInfoSelectViewController ()

@end

@implementation QXKExpressInfoSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSellerInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSellerInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKAddressInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKAddressInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderPriceTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderGoodsInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKExpressInfoSelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKExpressInfoSelectTableViewCell"];
    
    
    
    // Do any additional setup after loading the view from its nib.
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            return 130;
            
        }
            break;
        case 1:
        {
            return 100;
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
            QXKExpressInfoSelectTableViewCell*cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKExpressInfoSelectTableViewCell"];
            return cell;
        }
            break;
        case 1:
        {
            QXKAddressInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKAddressInfoTableViewCell"];
            [cell setCellDataWithName:@"tuotuo酱" Number:@"13291876886" Address:@"浙江省杭州市西湖区三墩镇浙江大学紫金港校区蒙民伟楼308室"];
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
            [cell setCellDataWithTotalPrice:@"28" TransExpense:@"6"];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
