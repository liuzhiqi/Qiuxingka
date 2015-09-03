//
//  QXKSellOtherInfoViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMComBoxView.h"

@interface QXKSellOtherInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonNeedChange;

@property (weak, nonatomic) IBOutlet UIButton *buttonNotNeedChange;

@property (weak, nonatomic) IBOutlet UITextField *textFieldPrice;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCardNum;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNum;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLogisticPrice;

@property (weak, nonatomic) IBOutlet LMComBoxView *comBoxCardTyoe;

@property (weak, nonatomic) IBOutlet LMComBoxView *comBoxCadBrand;
@property(strong,nonatomic) NSArray* arrayImages;


@end
