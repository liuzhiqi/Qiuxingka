//
//  QXKRegister2ViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKRegister2ViewController.h"
#import "QXKRegister3ViewController.h"
#import "QXKGeneral.h"
@interface QXKRegister2ViewController ()

@end

@implementation QXKRegister2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    self.textField.layer.borderWidth=1;
    self.textField.layer.borderColor=[[UIColor grayColor] CGColor];
    self.textField.layer.cornerRadius=18;
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPushNext:(id)sender {
    
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/register/vertifyMsg"];
    
    NSDictionary *parameters = @{@"messageCaptcha":self.textField.text};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    //
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    ////    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain; charset=utf-8"];
    //    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    //
    
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"success"]!=nil)
        {
            [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
            QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
            [self.navigationController pushViewController:pushVuew animated:YES];
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
//    
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
