//
//  QXKEditOrderViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKEditOrderViewController.h"
#import "QXKOrderGoodsInfoTableViewCell.h"
#import "QXKOrderSelectCardNumTableViewCell.h"
#import "QXKAddressInfoTableViewCell.h"
#import "QXKOrderSellerInfoTableViewCell.h"
#import "QXKOrderPriceTableViewCell.h"
#import "QXKGeneral.h"
#import "QXKAddressSelectViewController.h"
@interface QXKEditOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *labelTotalPrice;

@property (weak, nonatomic) IBOutlet UIButton *buttonPay;

@end

@implementation QXKEditOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderGoodsInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSelectCardNumTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSelectCardNumTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKAddressInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKAddressInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSellerInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSellerInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderPriceTableViewCell"];
    
    
    self.buttonPay.layer.cornerRadius=6;
    self.labelTotalPrice.text=[NSString stringWithFormat:@"合计：¥%@",@"132"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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




-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
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
            QXKOrderSelectCardNumTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderSelectCardNumTableViewCell"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
        case 4:
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
    
    
    
    
    UITableViewCell* cell=[[UITableViewCell alloc]init];
    
    
    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        QXKAddressSelectViewController* pushView=[[QXKAddressSelectViewController alloc]init];
        
        [self.navigationController pushViewController:pushView animated:YES ];
    
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
