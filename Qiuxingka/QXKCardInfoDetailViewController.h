//
//  QXKCardInfoDetailViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXKCollectionButton.h"
@interface QXKCardInfoDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) IBOutlet QXKCollectionButton *buttonCollection;

@property(strong,nonatomic)NSMutableArray *arrayCommand;
@property(strong,nonatomic)NSDictionary *dicPreInfo;
@property(strong,nonatomic)NSDictionary *dicDetail;
@property(strong,nonatomic)NSDictionary *dicSellerInfo;
@end
