
//
//  QXKUserInfo.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKUserInfo.h"
#import "QXKGeneral.h"
@implementation QXKUserInfo

static QXKUserInfo *shareInfo;

+(instancetype )shareUserInfo{
    
    
    
    static dispatch_once_t userInfoOnceToken;
    
    dispatch_once(&userInfoOnceToken, ^{
        
        shareInfo = [QXKUserInfo new];
        shareInfo.isLogin=0;
    });
    
    return shareInfo;
}

-(void)loadUserInfo{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/findUserById"];
    
    NSDictionary *parameters = @{@"userid":self.userId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"error"]) {
             [MBProgressHUD showHubWithTitle:@"拉取用户信息失败" type:0 target:self];
        }else{
            
            self.userName=[dic objectForKey:@"username"]==[NSNull null]?[dic objectForKey:@"portrait"]:@"";
            self.email=[dic objectForKey:@"email"]==[NSNull null]?[dic objectForKey:@"portrait"]:@"";
            
            if ([dic objectForKey:@"portrait"]==[NSNull null]) {
                self.profileUrl=[dic objectForKey:@"portrait"];
            }else{
                self.profileUrl=@"";

            }
            
            
            
            
            
            
            
            self.phoneNumber=[dic objectForKey:@"telephone"]==[NSNull null]?[dic objectForKey:@"portrait"]:@"";
            self.score=[dic objectForKey:@"score"];
            self.gender=[[dic objectForKey:@"gender"] integerValue];
            
            
            
            
        }
           
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    
}






@end
