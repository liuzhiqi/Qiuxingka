//
//  QXKUserInfo.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QXKUserInfo : NSObject

+(instancetype )shareUserInfo;

@property (nonatomic,strong)NSString *userId;
@property (nonatomic,strong)NSString *userName;
@property (nonatomic,strong)NSString *profileUrl;
@property (nonatomic,strong)NSString *nickName;
@property (nonatomic,strong)NSString *phoneNumber;
@property (nonatomic,strong)NSString *nickWeiXin;
@property (nonatomic,strong)NSString *nickWeiBo;
@property (nonatomic,strong)NSString *updateTime;
@property (nonatomic,strong)NSString *createTime;
@property (nonatomic,assign)NSUInteger cash;
@property (nonatomic,strong)NSString *selfDescription;
@property (nonatomic,strong)NSString *qqNumber;
@property (nonatomic,assign)NSUInteger userLevel;
@property (nonatomic,strong)NSString *email;

@property (nonatomic,assign)CGPoint loaction;//!< X = latitude, Y = longitude) ;
@property (nonatomic,assign)NSInteger isLogin;

//-(void)setupUserInfo:(NSDictionary *)indoDic;
//-(void)setImagePrefix:(NSDictionary *)dic;
//-(void)uploadPrefix:(NSString *)url;

@end
