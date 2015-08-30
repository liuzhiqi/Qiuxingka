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
#import "QXKWikiEditViewController.h"
@interface QXKWikiDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QXKWikiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    self.tableViewMain.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKWikiDetailCardInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKWikiDetailCardInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKWikiDetailCardDescriptionTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKWikiDetailCardDescriptionTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKWikiDetailPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKWikiDetailPriceTableViewCell"];
//    self.automaticallyAdjustsScrollViewInsets=YES;
//    self.extendedLayoutIncludesOpaqueBars = NO;
//    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
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
            NSString* title=[self.dicInfo objectForKey:@"wikiname"];
            NSString* subtitle=[self.dicInfo objectForKey:@"english_name"];
            NSString* cardType=[self.dicInfo objectForKey:@"category"];
            NSString* factory=[self.dicInfo objectForKey:@"manufacturer"];
            NSString* series=[self.dicInfo objectForKey:@"series"];
            NSString* cardNumber=[self.dicInfo objectForKey:@"serial_number"];
            NSString* rareLevel=[self.dicInfo objectForKey:@"rarity"];
            NSString* imagePic=[self.dicInfo objectForKey:@"picture"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            [cell setCellDataWithTItle:title subtitle:subtitle cardType:cardType factory:factory cardNumber:cardNumber series:series rareLevel:rareLevel imagePic:imagePic];
            return cell;
        }
            break;
        case 1:
        {
            QXKWikiDetailCardDescriptionTableViewCell *cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKWikiDetailCardDescriptionTableViewCell"];
            
            NSString* describes=[self.dicInfo objectForKey:@"describes"];
//            NSString* describes=@"asdajsdiaoifjasd哦埃及队佛爱的是佛啊第三风景奥迪风景嗷ID是风景哦爱死的风景哦 i 啊圣诞节佛 iAds 家佛 i 啊但是减肥哦爱睡觉地方哦爱死的分哦阿斯地方哦爱死的减肥哦爱睡觉地方哦埃及首都否啊大佛 i 啊是对佛 i 啊叫色佛 i 啊集散地佛 i 就阿萨德哦发 i 就啊的说哦份 i 就阿萨德哦发 i就阿斗 if 家啊谁都 if就啊谁都 if叫阿松ID减肥哦埃及第三佛 i 啊集散地佛 i 啊集散地哦发 i 家啊哦份 i 就啊的说哦份 i 家啊谁都 if 家啊谁都 if 家都 if嗷基地佛爱减肥哦爱的是减肥奥吉";
            
            [cell.buttonEdit addTarget:self action:@selector(editWiki) forControlEvents:UIControlEventTouchUpInside];
            
            NSString* contributor=[self.dicInfo objectForKey:@"contributor"];
            [cell setCellWithDiscription:describes name:contributor];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 2:
        {
            QXKWikiDetailPriceTableViewCell *cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKWikiDetailPriceTableViewCell"];
            
            
            
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
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
            return 190;
            break;
        case 1:
        {
            QXKWikiDetailCardDescriptionTableViewCell* cell=(QXKWikiDetailCardDescriptionTableViewCell* )[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
            return cell.cellHeight;
        }
            break;
        case 2:
            return 70;
            break;
        default:
            break;
    }
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(void)editWiki{
    QXKWikiEditViewController*pushView=[[QXKWikiEditViewController alloc]init];
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
