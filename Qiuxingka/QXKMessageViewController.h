//
//  QXKMessageViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"
@interface QXKMessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet PullTableView *tableViewMain;
@property(strong,nonatomic)NSMutableArray* arrayMessage;
@end
