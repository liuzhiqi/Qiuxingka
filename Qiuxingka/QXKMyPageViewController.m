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
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/home/showTradeInfo"];
    
    QXKUserInfo*userInfo=[QXKUserInfo shareUserInfo];
    
    NSDictionary *parameters;
   // parameters = @{@"userid": userInfo.userId};
    parameters = @{@"userid": @"787348d0-126b-11e5-a5da-0959cd299e41"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        
        if ([dic objectForKey:@"error"]!=nil) {
            [MBProgressHUD showHubWithTitle:@"拉取交易信息失败" type:0 deleController:self];
        }else{

            QXKUserInfo*userInfo=[QXKUserInfo shareUserInfo];
            userInfo.numBuy=[[dic objectForKey:@"in_num"] integerValue];
            userInfo.numSell=[[dic objectForKey:@"out_num"] integerValue];
            self.labelDealInfo.text=[NSString stringWithFormat:@"已购买%ld张，已出售%ld张",(long)userInfo.numBuy,(long)userInfo.numSell];
            

        }
        
        
        
        
       //        if ([dic objectForKey:@"userid"]!=nil)
//        {
//            
//            QXKUserInfo* userInfo=  [QXKUserInfo shareUserInfo];
//            userInfo.userId=[dic objectForKey:@"userId"];
//            
//            
//            [MBProgressHUD showHubWithTitle:@"登陆成功" type:1 target:self];
//            
//            [self.navigationController popToRootViewControllerAnimated:YES];
//        }
//        else{
//            
//            [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:0 target:self];
//            
//            
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //

    
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
