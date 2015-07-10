//
//  QXKResetPassword1ViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKResetPassword1ViewController.h"
#import "QXKResetPassword2ViewController.h"
#import "QXKGeneral.h"
@interface QXKResetPassword1ViewController ()

@end

@implementation QXKResetPassword1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    // Do any additional setup after loading the view from its nib.
    
    self.textFieldPhone.layer.borderWidth=1;
    self.textFieldPhone.layer.borderColor=[[UIColor grayColor] CGColor];
    self.textFieldPhone.layer.cornerRadius=18;
    
    self.textFieldCaptcha.layer.borderWidth=1;
    self.textFieldCaptcha.layer.borderColor=[[UIColor grayColor] CGColor];
    self.textFieldCaptcha.layer.cornerRadius=18;
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPushNext:(id)sender {
    QXKResetPassword2ViewController* pushVuew=[[QXKResetPassword2ViewController alloc]init];
    [self.navigationController pushViewController:pushVuew animated:YES];
}


-(void)getCaptcha{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/retrieve"];
    
    NSDictionary *parameters = @{};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        [self.buttonCaptcha setTitle:[NSString stringWithFormat:@"%@",[dic objectForKey:@"captcha"] ]forState:UIControlStateNormal];
        
        
        NSLog(@"%@",dic)  ;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    
    
}


- (IBAction)changeCaptcha:(id)sender {
    [self getCaptcha];
}



- (IBAction)btnPushnext:(id)sender {
    
    
    
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/retrieve/getMsgCap"];
    
    NSDictionary *parameters = @{@"telephone":self.textFieldPhone.text,@"captcha": self.textFieldCaptcha.text};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"success"]!=nil)
        {
            [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
            QXKResetPassword2ViewController* pushVuew=[[QXKResetPassword2ViewController alloc]init];
            [self.navigationController pushViewController:pushVuew animated:YES];
        }
        else{
            
            [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:1 target:self];
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    

    
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
