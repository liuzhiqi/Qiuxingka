//
//  QXKExpressInfoSelectTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/29.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMComBoxView.h"
@interface QXKExpressInfoSelectTableViewCell : UITableViewCell<LMComBoxViewDelegate>
@property (weak, nonatomic) IBOutlet LMComBoxView *comBoxView;

@end
