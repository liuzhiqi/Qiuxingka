//
//  QXKEMessageExchangeViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/2.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKEMessageExchangeViewController.h"
#import "QXKGeneral.h"
#import "JZAlbumViewController.h"
#import "QXKMessageExchangeRefuseViewController.h"
@interface QXKEMessageExchangeViewController ()
{
    NSMutableArray*arrImgs;
}
@end

@implementation QXKEMessageExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.labelDescription.text=[self.dicDetailInfo objectForKey:@"describes"];
    self.labelDescription.text=@"asdasdkljdsfasdjf lasdf jlads jflads flads flsa dfjl asdlfj alsdkf jladskjf lskdjf alkdsjf alskjf aldskjf ladskjf lsadkj falskdjf alsdkjf lasdkfj alsdkf jlaskdfj lakdjf ladksjf alsdkj fladkjf alskdjf alkjf alksdjf ";
    NSString* pictures=[self.dicDetailInfo objectForKey:@"pictures"];
    NSArray *array = [pictures componentsSeparatedByString:@","];
    NSInteger count=self.arrImages.count;
    if(self.arrImages.count>array.count){
        count =array.count;
    }
    arrImgs=[[NSMutableArray alloc]init];
    for (int i=0; i<count; i++) {
        
        for (UIImageView* imgV in self.arrImages) {
            if (imgV.tag==i) {
                NSString* imgUrl=[QXKURL stringByAppendingString:@"/"];
                imgUrl=[imgUrl stringByAppendingString:array[i]];
                [arrImgs addObject:imgUrl];
                [imgV sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
            }
        }
        
        
        
    }
    [self loadBuyerInfo];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadBuyerInfo{
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/findUserById"];
    
    NSDictionary *parameters;
    parameters = @{@"userid":[self.dicDetailInfo objectForKey:@"buserid"]};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         NSError* error;
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                        options:kNilOptions
                                                          error:&error];
         if ( [dic objectForKey:@"error"]==nil&&dic!=nil )
         {
             self.dicBuyerInfo=[NSMutableDictionary dictionaryWithDictionary:dic];
             self.labelName.text=[dic objectForKey:@"username"];
             NSString* imgUrl=[QXKURL stringByAppendingString:@"/"];
             imgUrl=[imgUrl stringByAppendingString:[dic objectForKey:@"portrait"]];
             [self.imageViewProfile sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"卖家"]];
        }
         else{
             [MBProgressHUD showHubWithTitle:@"查询交换方信息出错" type:0 target:self];
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         [MBProgressHUD showHubWithTitle:@"网络连接出错" type:0 target:self];
         NSLog ( @"operation: %@" , operation. responseString );
         
         NSLog(@"Error: %@", error);
     }];

}

- (IBAction)btnPushAgree:(id)sender {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
- (IBAction)btnPushReject:(id)sender {
    
    
    QXKMessageExchangeRefuseViewController*pushView=[[QXKMessageExchangeRefuseViewController alloc]init];
    pushView.dicPreInfo=self.dicDetailInfo;
    [self.navigationController pushViewController:pushView animated:YES];
    
    
    
}
- (IBAction)btnPushContect:(id)sender {
    
}

- (IBAction)btnPushViewImage:(id)sender {
    
    JZAlbumViewController*pushView=[[JZAlbumViewController alloc]init];
    UIButton*button=sender;
    if (button.tag<arrImgs.count) {
    
    pushView.imgArr=[NSMutableArray arrayWithObjects:arrImgs[button.tag], nil];
        pushView.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
    [self presentViewController:pushView animated:YES completion:^{
        ;
    }];
    }
    
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
