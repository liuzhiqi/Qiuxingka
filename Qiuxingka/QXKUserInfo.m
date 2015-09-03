
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
    
    if( self.locationMgr==nil)
    {
        self.locationMgr = [[CLLocationManager alloc] init];
    
        //设置代理
        self.locationMgr.delegate = self;
    
    // 设置定位精度
    // kCLLocationAccuracyNearestTenMeters:精度10米
    // kCLLocationAccuracyHundredMeters:精度100 米
    // kCLLocationAccuracyKilometer:精度1000 米
    // kCLLocationAccuracyThreeKilometers:精度3000米
    // kCLLocationAccuracyBest:设备使用电池供电时候最高的精度
    // kCLLocationAccuracyBestForNavigation:导航情况下最高精度，一般要有外接电源时才能使用
        self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
        

        
        [self.locationMgr requestAlwaysAuthorization];
    // distanceFilter是距离过滤器，为了减少对定位装置的轮询次数，位置的改变不会每次都去通知委托，而是在移动了足够的距离时才通知委托程序
    // 它的单位是米，这里设置为至少移动1000再通知委托处理更新;
        self.locationMgr.distanceFilter = 1000.0f;
    }
    
    //开始定位
    [self.locationMgr startUpdatingLocation];
    

    
    
    
    
    
    
    
    
    
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
            
            self.userName=[dic objectForKey:@"username"]!=[NSNull null]?[dic objectForKey:@"username"]:@"";
            
            if ([dic objectForKey:@"portrait"]!=[NSNull null]) {
                self.profileUrl=[dic objectForKey:@"portrait"];
            }else{
                self.profileUrl=@"";

            }
            
            
            self.identificated=[dic objectForKey:@"identificated"];
            
            self.numBuy=[dic objectForKey:@"sell_cnt"];
            self.numSell=[dic objectForKey:@"buy_cnt"];
            
            self.email=[dic objectForKey:@"email"]!=[NSNull null]?[dic objectForKey:@"email"]:@"";
            self.phoneNumber=[dic objectForKey:@"telephone"]!=[NSNull null]?[dic objectForKey:@"telephone"]:@"";
            self.score=[dic objectForKey:@"score"];
            self.gender=[[dic objectForKey:@"gender"] integerValue];
            
            
            
            
        }
           
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *cl = [locations objectAtIndex:0];
    self.loaction=CGPointMake(cl.coordinate.latitude, cl.coordinate.longitude);
    
    NSLog(@"纬度--%f",cl.coordinate.latitude);
    NSLog(@"经度--%f",cl.coordinate.longitude);
    
}


//获取定位失败回调方法
#pragma mark - location Delegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Location error!");
}


-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
   
//    NSLog(@"纬度--%f",cl.coordinate.latitude);
//    NSLog(@"经度--%f",cl.coordinate.longitude);

}



@end
