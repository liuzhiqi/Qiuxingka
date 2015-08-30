//
//  QXKMyPageViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKMyPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelIsCertified;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDealInfo;


@property (weak, nonatomic) IBOutlet UIImageView *imageVIewProfile;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (weak, nonatomic) IBOutlet UIButton *buttonContectServes;
@property (weak, nonatomic) IBOutlet UIButton *buttonNotFinished;





@end
