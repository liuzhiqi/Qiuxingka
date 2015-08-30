//
//  QXKWikiDetailViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKWikiDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property(strong,nonatomic) NSMutableDictionary* dicInfo;
@end
