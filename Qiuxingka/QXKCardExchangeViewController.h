//
//  QXKCardExchangeViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKCardExchangeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textViewDescription;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrayButton;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property(strong,nonatomic)NSDictionary *dicPreInfo;
@property(strong ,nonatomic)NSMutableArray* selectedPhotos;
@property (weak, nonatomic) IBOutlet UIView *viewVBG;

@property (weak, nonatomic) IBOutlet UIButton *btnCheck;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintW;


@end
