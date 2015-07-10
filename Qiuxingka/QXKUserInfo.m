
//
//  QXKUserInfo.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKUserInfo.h"

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
//
//-(void)setImagePrefix:(NSDictionary *)dic{
//    
//    
//}



@end
