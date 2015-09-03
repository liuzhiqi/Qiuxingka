//
//  QXKEMessageExchangeViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/2.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKEMessageExchangeViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *arrImages;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@property (weak, nonatomic) IBOutlet UIButton *buttonAgree;
@property (weak, nonatomic) IBOutlet UIButton *buttonReject;
@property (weak, nonatomic) IBOutlet UIButton *buttonContact;

@property(strong,nonatomic)NSDictionary *dicPreInfo;
@property(strong,nonatomic)NSMutableDictionary *dicDetailInfo;

@property(strong,nonatomic)NSMutableDictionary *dicBuyerInfo;







@end
