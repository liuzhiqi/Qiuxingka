//
//  QXKWikiDetailViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiDetailViewController.h"
#import "QXKWikiDetailCardInfoTableViewCell.h"
#import "QXKWikiDetailCardDescriptionTableViewCell.h"
#import "QXKWikiDetailPriceTableViewCell.h"

@interface QXKWikiDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QXKWikiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKWikiDetailCardInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKWikiDetailCardInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKWikiDetailCardDescriptionTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKWikiDetailCardDescriptionTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKWikiDetailPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKWikiDetailPriceTableViewCell"];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            QXKWikiDetailCardInfoTableViewCell *cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKWikiDetailCardInfoTableViewCell"];
            return cell;
        }
            break;
        case 1:
        {
            QXKWikiDetailCardDescriptionTableViewCell *cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKWikiDetailCardDescriptionTableViewCell"];
            return cell;
        }
            break;
        case 2:
        {
            QXKWikiDetailPriceTableViewCell *cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKWikiDetailPriceTableViewCell"];
            return cell;
        }
            break;
        default:
            break;
    }
    
    UITableViewCell *cell=[[UITableViewCell alloc] init];
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
        case 0:
            return 200;
            break;
        case 1:
            return 100;
            
            break;
        case 2:
            return 70;
            break;
        default:
            break;
    }
    
    return 1;
    
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
