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
#import "QXKGeneral.h"
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
    
    
    
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/login"];
    
    NSDictionary *parameters = @{@"username":self.textFieldAccount.text,@"password":self.textFieldPassword.text};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"userid"]!=nil)
        {
            
            QXKUserInfo* userInfo=  [QXKUserInfo shareUserInfo];
            userInfo.userId=[dic objectForKey:@"userid"];
            
            [userInfo loadUserInfo];
            [MBProgressHUD showHubWithTitle:@"登陆成功" type:1 target:self];
           
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            
            [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:0 target:self];
            
            
        }
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
