//
//  QXKCollectionButton.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/3.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCollectionButton.h"
#import "QXKGeneral.h"
@implementation QXKCollectionButton
-(void)awakeFromNib{
    
    [self addTarget:self action:@selector(btnPush) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)btnPush{
    
    
    if (self.viewControllerfather==nil) {
        NSLog(@"asdasd");
        return;
    }
    
    if (self.idCard==nil) {
        [MBProgressHUD showHubWithTitle:@"缺少cardId" type:0 target:self.viewControllerfather];
        return;
    }
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
    NSString*userid=usrInfo.userId ;
    NSDictionary *parameters;
    
    
    if (self.tag==0)
    {
        [postUrl appendString:@"/mycard/addCardCollect"];
        
        parameters = @{@"userid":userid,@"cardid":self.idCard};
        

    }
    if (self.tag==1)
    {
        [postUrl appendString:@"/mycard/addWikiCollect"];
        
        parameters = @{@"userid":userid,@"wikiid":self.idCard};

        
    }
    
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            
            NSError* error;
            NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                           options:kNilOptions
                                                             error:&error];
            
            if ([dic objectForKey:@"success"]!=nil) {
                [MBProgressHUD showHubWithTitle:@"收藏成功" type:1 deleController:self.viewControllerfather];
                
            }else{
                [MBProgressHUD showHubWithTitle:@"收藏失败" type:0 deleController:self.viewControllerfather];
                
            }
           
            
            
            
            
            
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog ( @"operation: %@" , operation. responseString );
            
            NSLog(@"Error: %@", error);
        }];
        
        

    
    
    
 
    
    
}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
