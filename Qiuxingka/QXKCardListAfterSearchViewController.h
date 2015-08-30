//
//  QXKCardListAfterSearchViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKCardListAfterSearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) IBOutlet UIView *viewHead;



@property(assign,nonatomic)NSInteger typeBrand;//!< -1 = nil, 0 = topps, 1 ＝ panini, 2 ＝ other) ;
@property(strong,nonatomic)NSMutableArray *arrayCardInfo;
@end
