//
//  QXKRegister3ViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKRegister3ViewController.h"
#import "QXKGeneral.h"
@interface QXKRegister3ViewController ()

@end

@implementation QXKRegister3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPushSubmiit:(id)sender {
    
    
        NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
        [postUrl appendString:@"/register/setInfo"];
    
        NSDictionary *parameters = @{@"username":self.textFieldNickName.text,@"password":self.textFieldPassword.text,@"passwordRep":self.textFieldPassword2.text,@"idCardNo":self.textFieldID.text};
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        UIImage *img=[UIImage imageNamed:@"卖家"];
    
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
        manager.requestSerializer = [AFJSONRequestSerializer serializer];

    [manager POST:postUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *imageData = UIImageJPEGRepresentation(img,0.5);
        [formData appendPartWithFileData:imageData name:@"imgs" fileName:@"abc.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"success"]!=nil)
        {
            [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
            
            [self.navigationController  popToRootViewControllerAnimated:YES];
        }
        else{
            
            [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:0 target:self];
            
            
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);

    }];
    
    
    
//    
//        [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
//    
//            NSError* error;
//            NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                                options:kNilOptions
//                                                                  error:&error];
//            if ([dic objectForKey:@"success"]!=nil)
//            {
//                [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
//               
//                [self.navigationController  popToRootViewControllerAnimated:YES];
//            }
//            else{
//    
//                [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:0 target:self];
//    
//    
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//            NSLog ( @"operation: %@" , operation. responseString );
//            
//            NSLog(@"Error: %@", error);
//        }];
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
