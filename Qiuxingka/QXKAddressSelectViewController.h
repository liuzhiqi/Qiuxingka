//
//  QXKAddressSelectViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKAddressSelectViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;

@property(strong,nonatomic)NSMutableArray *arrayAddress;
@end
