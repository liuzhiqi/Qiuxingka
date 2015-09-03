//
//  QXKGeneral.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/16.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#ifndef Qiuxingka_QXKGeneral_h
#define Qiuxingka_QXKGeneral_h

//#define NO_NETWORK_CONNECTION 1
#define QXKURL @"http://121.40.55.207:3000"
#define QXKGreenDark colorWithRed:97.0/255 green:147.0/255  blue:52.0/255  alpha:1
#define QXKGreenLight colorWithRed:128.0/255 green:185.0/255  blue:91.0/255  alpha:1
#define QXKLightLightGray colorWithRed:222/255.0 green:222/255.0  blue:222/255.0  alpha:1

#import "QXKUserInfo.h"
#import "MBProgressHUD.h"   
#import "AFNetworking.h"
#import <UIImageView+WebCache.h>

@interface MBProgressHUD (selfDesign)

+(void )showHubWithTitle:(NSString*) title type:(NSInteger) type target:(UIViewController*) target ;
    
    
@end


@implementation MBProgressHUD(selfDesign)



+(void )showHubWithTitle:(NSString*) title type:(NSInteger) type target:(id) target {
    
    
    
    id object = target;
    while (![object isKindOfClass:[UIViewController class]] &&
           
           object != nil) {
        
        object = [object nextResponder];
        
    }

    UIViewController *uc=(UIViewController*)object;
    
    
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:uc.navigationController.view];
    
    
    [uc.navigationController.view addSubview:HUD];
    
    if (type==0) {
        UIImageView * imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hubWrongNormal0"]] ;
        imageView.frame=CGRectMake(0 , 0, 60, 60);
        HUD.customView = imageView;
        
    }
    else if (type==1){
        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hubRightNormal0"]] ;
    }
    //    //
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    HUD.delegate = target;
    HUD.labelText = title;
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:3];
}

@end




// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.

//#import "MBProgressHUD.h"
//
#endif
