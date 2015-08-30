//
//  QXKMessageCommentViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/29.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMessageCommentViewController.h"
#import "QXKMessageCommentTableViewCell.h"
#import "QXKMessageCommentCardInfoTableViewCell.h"
@interface QXKMessageCommentViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QXKMessageCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKMessageCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKMessageCommentTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKMessageCommentCardInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKMessageCommentCardInfoTableViewCell"];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 140;
    }else{
        return 140;
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[[UITableViewCell alloc]init];
    
    
    if (indexPath.row==0) {
        QXKMessageCommentTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKMessageCommentTableViewCell"];
        return cell;
    }
    if (indexPath.row==1) {
        QXKMessageCommentCardInfoTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKMessageCommentCardInfoTableViewCell"];
        return cell;

    }
    if (indexPath.row==2) {
       
    }

    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    QXKCardInfoDetailViewController* push=[[QXKCardInfoDetailViewController alloc]init];








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
