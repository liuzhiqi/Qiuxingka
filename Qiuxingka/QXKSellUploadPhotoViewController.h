//
//  QXKSellUploadPhotoViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGImagePickerController.h"
@interface QXKSellUploadPhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewPhotoContainer;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrayButton;

@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintW;




@end
