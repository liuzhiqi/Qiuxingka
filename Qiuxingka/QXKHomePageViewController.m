//
//  QXKHomePageViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKHomePageViewController.h"
#import "QXKLoginViewController.h"
#import "HMBannerView.h"
#import "QXKHomePageBrandTableViewCell.h"
#import "QXKMHomePageCardTypeTableViewCell.h"
const float ratioBannerHW=0.6;
const float ratioCellSection0=0.36667;
@interface QXKHomePageViewController ()<UITableViewDataSource,UITableViewDelegate,HMBannerViewDelegate>
{
    NSMutableArray *arratBanner;
    UISearchBar* searchBar;
    
}

@property (nonatomic, strong) HMBannerView *bannerView;

@end

@implementation QXKHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QXKLoginViewController *pushView=[[QXKLoginViewController alloc]init];
    [self.navigationController pushViewController:pushView animated:YES];
    
    if (self.bannerView != nil)
    {
        [self.bannerView reloadBannerWithData:arratBanner];
    }
    else
    {
        
        CGRect frame=[UIScreen mainScreen].applicationFrame;
        self.bannerView = [[HMBannerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width*ratioBannerHW) scrollDirection:ScrollDirectionLandscape images:arratBanner];
        
        [self.bannerView setRollingDelayTime:4.0];
        [self.bannerView setDelegate:self];
        [self.bannerView setSquare:0];
        [self.bannerView setPageControlStyle:PageStyle_Right];
        [self.bannerView startDownloadImage];
        //[self.m_BannerView showClose:YES];
    }

    self.tableViewMain.tableHeaderView=self.bannerView;
    
    
    [self loadDataBanner];
    
    
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKHomePageBrandTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKHomePageBrandTableViewCell"];
    
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKMHomePageCardTypeTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKMHomePageCardTypeTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKHomePageNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKHomePageNewsTableViewCell"];
    
    
    
    
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    
    
    
    
    
    
    
    
    
    
       // Do any additional setup after loading the view from its nib.
}

-(void)loadDataBanner{
    
    arratBanner= [NSMutableArray arrayWithCapacity:0];
    NSDictionary *bannerDic = [NSDictionary dictionaryWithObjectsAndKeys:@"http://pic01.babytreeimg.com/foto3/photos/2014/0211/68/2/4170109a41ca935610bf8_b.png", @"img_url", nil];
    [arratBanner addObject:bannerDic];
    bannerDic = [NSDictionary dictionaryWithObjectsAndKeys:@"http://pic01.babytreeimg.com/foto3/photos/2014/0127/19/9/4170109a267ca641c41ebb_b.png", @"img_url", nil];
    [arratBanner addObject:bannerDic];
    bannerDic = [NSDictionary dictionaryWithObjectsAndKeys:@"http://pic02.babytreeimg.com/foto3/photos/2014/0207/59/4/4170109a17eca86465f8a4_b.jpg", @"img_url", nil];
    [arratBanner addObject:bannerDic];
    [self.bannerView reloadBannerWithData:arratBanner];

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        CGRect frame=[UIScreen mainScreen].applicationFrame;

        return frame.size.width*ratioCellSection0;
    }
    return 105;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==1) {
        return 0;
    }
    return 22;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 32;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    if (section==2) {
//        <#statements#>
//    }
    CGRect frame=[UIScreen mainScreen].applicationFrame;
//    self.bannerView = [[HMBannerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 225) scrollDirection:ScrollDirectionLandscape images:arratBanner];
    
    UIView* headView=[[UIView alloc] initWithFrame:CGRectMake(-2, 0, frame.size.width+4, 32)];
    headView.layer.borderWidth=1;
    headView.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    
    
    UILabel* labelHead=[[UILabel alloc]initWithFrame:CGRectMake(22, 0, frame.size.width, 32)];
    labelHead.text=@"新闻";
    [headView addSubview:labelHead];
    return headView;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[[UITableViewCell alloc] init];

    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKMHomePageCardTypeTableViewCell"];
        }
        if (indexPath.row==1) {
            cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKHomePageBrandTableViewCell"];
        }
        
    }
    else{
        cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKHomePageNewsTableViewCell"];

        
        
    }
    
    
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
