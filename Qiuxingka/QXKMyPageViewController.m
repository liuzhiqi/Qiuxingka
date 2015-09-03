//
//  QXKMyPageViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMyPageViewController.h"
#import "QXKAccountSettingViewController.h"
#import "QXKMyCollectionViewController.h"
#import "QXKGeneral.h"
#import "QXKMyScoreViewController.h"
#import "QXKMyCardBuyViewController.h"
#import "QXKWillExchangeViewController.h"
#import "QXKMyCardSellViewController.h"
#import "QXKIdentifyViewController.h"
@interface QXKMyPageViewController ()

@end

@implementation QXKMyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIButton* btn in self.buttons) {
        btn.layer.cornerRadius=6;
    }
    
    
    
    self.buttonNotFinished.layer.borderWidth=1;
    self.buttonNotFinished.layer.borderColor=[[UIColor QXKGreenLight]CGColor];
    self.buttonNotFinished.layer.cornerRadius=6;
    
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    self.labelName.text=usrInfo.userName;
   
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.buttonContectServes.titleLabel.text];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [self.buttonContectServes setAttributedTitle:str forState:UIControlStateNormal];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.imageVIewProfile.layer.cornerRadius=self.imageVIewProfile.bounds.size.width/2;
    self.imageVIewProfile.layer.masksToBounds=NO;
    self.imageVIewProfile.layer.borderColor=[[UIColor QXKGreenLight] CGColor];
    self.imageVIewProfile.layer.borderWidth=1;
    
    
     [self loadData];
}

-(void)loadData{
    QXKUserInfo*userInfo=[QXKUserInfo shareUserInfo];
    
    self.labelDealInfo.text=[NSString stringWithFormat:@"已购买%@张，已出售%@张",userInfo.numBuy,userInfo.numSell];
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPushAppSetting:(id)sender {
    QXKAccountSettingViewController*pushView=[[QXKAccountSettingViewController alloc]init];
    [self.navigationController pushViewController:pushView animated:YES];
    
}

- (IBAction)btnPushMyscore:(id)sender {
    QXKMyScoreViewController*pushView=[[QXKMyScoreViewController alloc]init];
    
    
    [self.navigationController pushViewController:pushView animated:YES];
}

- (IBAction)btnPushMyCollection:(id)sender {
    QXKMyCollectionViewController*pushView=[[QXKMyCollectionViewController alloc]init];
    
    
    [self.navigationController pushViewController:pushView animated:YES];

}

- (IBAction)btnPushSoldCard:(id)sender {
    QXKMyCardSellViewController*pushView=[[QXKMyCardSellViewController alloc]init];
    
    
    [self.navigationController pushViewController:pushView animated:YES];

}

- (IBAction)btnPushBoughtCard:(id)sender {
    QXKMyCardBuyViewController*pushView=[[QXKMyCardBuyViewController alloc]init];
    
    
    [self.navigationController pushViewController:pushView animated:YES];

}

- (IBAction)btnPushNotFinished:(id)sender {
    QXKWillExchangeViewController*pushView=[[QXKWillExchangeViewController alloc]init];
    [self.navigationController pushViewController:pushView animated:YES];
    
    
    
}

- (IBAction)btnPushIdentify:(id)sender {
    QXKIdentifyViewController*pushView=[[QXKIdentifyViewController alloc]init];
    
    [self.navigationController pushViewController:pushView animated:YES];
    
    
}

- (IBAction)btnPushConnectService:(id)sender {
}
- (IBAction)btnPushAccountSetting:(id)sender {
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
