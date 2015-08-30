//
//  QXKWikiSearchViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/28.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"
@interface QXKWikiSearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet PullTableView *tableViewMain;
@property(strong,nonatomic)NSMutableArray *arrayCardInfo;
@property(strong,nonatomic)NSString *strSearchKey;

@end
