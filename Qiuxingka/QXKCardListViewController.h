//
//  QXKCardListViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/30.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"
@interface QXKCardListViewController : UIViewController
@property (weak, nonatomic) IBOutlet PullTableView *tableViewMain;
@property(assign,nonatomic)NSInteger typeBrand;//!< -1 = nil, 0 = topps, 1 ＝ panini, 2 ＝ Futera) ;
@property(assign,nonatomic)NSInteger typeView;//!< -1 = 品牌卡, 0 = 足球卡, 1 ＝ 篮球卡, 2 ＝ other) ;
@property(assign,nonatomic)NSInteger typeCategory;//!< -1 = 品牌卡, 0 = 足球卡, 1 ＝ 篮球卡, 2 ＝ other) ;
@property(strong,nonatomic)NSMutableArray *arrayCardInfo;
@property (weak, nonatomic) IBOutlet UIView *viewHead;

@end
