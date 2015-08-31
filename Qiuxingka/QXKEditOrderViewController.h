//
//  QXKEditOrderViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKEditOrderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property(strong,nonatomic)NSDictionary *dicPreInfo;
@property(strong,nonatomic)NSDictionary *dicDetail;
@property(strong,nonatomic)NSDictionary *dicSellerInfo;
@end
