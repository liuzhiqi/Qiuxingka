//
//  QXKRegister1ViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMComBoxView.h"
#import "LMContainsLMComboxScrollView.h"
@interface QXKRegister1ViewController : UIViewController{
    LMContainsLMComboxScrollView *bgScrollView;
}
@property (weak, nonatomic) IBOutlet UIButton *buttonCaptcha;

@property (weak, nonatomic) IBOutlet UIView *viewComBG;



@property (weak, nonatomic) IBOutlet UITextField *textFieldPhone;

@property (weak, nonatomic) IBOutlet UITextField *textFieldCaptcha;

@property (weak, nonatomic) IBOutlet LMComBoxView *comBoxView;

@end
