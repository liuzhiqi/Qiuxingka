//
//  QXKSellCardInfoViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKSellCardInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextView *textViewMycard;
@property (weak, nonatomic) IBOutlet UITextView *textViewChange;
@property(assign,nonatomic) BOOL needChange;
@end
