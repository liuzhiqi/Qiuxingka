//
//  QXKWillExchangeViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKWillExchangeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property(strong,nonatomic)NSMutableArray*arrayCardInfo;
@property (weak, nonatomic) IBOutlet UIView *viewHead;

@end
