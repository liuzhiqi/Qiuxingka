//
//  QXKMyCollectionViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"PullTableView.h"
@interface QXKMyCollectionViewController : UIViewController
@property (weak, nonatomic) IBOutlet PullTableView *tableViewMain;
@property(strong,nonatomic)NSMutableArray *arrayCollectionInfo;
@property (weak, nonatomic) IBOutlet UIView *viewHead;
@end
