//
//  QXKLoginViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKLoginViewController.h"
#import "QXKRegister1ViewController.h"
#import "QXKResetPassword1ViewController.h"
@interface QXKLoginViewController ()

@end

@implementation QXKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewTextViewBG.layer.borderWidth=1;
    self.viewTextViewBG.layer.borderColor=[[UIColor grayColor] CGColor];
    self.viewTextViewBG.layer.cornerRadius=18;
    
    
    self.viewTextViewBG2.layer.borderWidth=1;
    self.viewTextViewBG2.layer.borderColor=[[UIColor grayColor] CGColor];
    self.viewTextViewBG2.layer.cornerRadius=18;
    
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Event
- (IBAction)btnPushLogin:(id)sender {
    
}

- (IBAction)btnPushResetPassword:(id)sender {
    QXKResetPassword1ViewController *pushView=[[QXKResetPassword1ViewController alloc]init];
    pushView.title=@"找回密码";
    [self.navigationController pushViewController:pushView animated:YES];
    
}


- (IBAction)btnPushRegister:(id)sender {
    QXKRegister1ViewController *pushView=[[QXKRegister1ViewController alloc]init];
    pushView.title=@"注册";
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
