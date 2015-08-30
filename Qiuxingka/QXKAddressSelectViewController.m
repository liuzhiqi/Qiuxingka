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
    NSDictionary* dic=[[NSDictionary alloc]init];
    [self.arrayAddress addObject:dic];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [cell setCellDataWithName:@"tuotuo酱" Number:@"13291876886" Address:@"浙江省杭州市西湖区三墩镇浙江大学紫金港校区蒙民伟楼308室" isSelected:isSelect];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
