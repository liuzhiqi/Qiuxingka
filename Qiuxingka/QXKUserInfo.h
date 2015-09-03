//
//  QXKUserInfo.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface QXKUserInfo : NSObject<CLLocationManagerDelegate>

+(instancetype )shareUserInfo;

@property (nonatomic,strong)NSString *userId;
@property (nonatomic,strong)NSString *userName;
@property (nonatomic,strong)NSString *profileUrl;
@property (nonatomic,strong)NSString *phoneNumber;
@property (nonatomic,strong)NSString *email;

@property (nonatomic,strong)NSNumber *identificated;
@property (nonatomic,assign)NSNumber* score;
@property (nonatomic,assign)CGPoint loaction;//!< X = latitude, Y = longitude) ;
@property (nonatomic,assign)NSNumber* numBuy;
@property (nonatomic,assign)NSNumber* numSell;
@property (nonatomic,assign)NSInteger isLogin;
@property (nonatomic,strong)NSString *idCardNum;
@property (nonatomic,assign)NSInteger gender;
//-(void)setupUserInfo:(NSDictionary *)indoDic;
//-(void)setImagePrefix:(NSDictionary *)dic;
//-(void)uploadPrefix:(NSString *)url;

@property (nonatomic,strong)NSString *nickName;
@property (nonatomic,strong)NSString *nickWeiBo;
@property (nonatomic,strong)NSString *updateTime;
@property (nonatomic,strong)NSString *createTime;
@property (nonatomic,strong)NSString *selfDescription;
@property (nonatomic,strong)NSString *qqNumber;
@property (nonatomic,assign)NSUInteger userLevel;



@property (nonatomic, retain) CLLocationManager* locationMgr;
@property (nonatomic, retain) CLGeocoder* clGeocoder;// iso 5.0及5.0以上SDK版本使







-(void)loadUserInfo;
@end
