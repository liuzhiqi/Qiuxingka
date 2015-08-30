//
//  QXKOrderSelectCardNumTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderSelectCardNumTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *buttonSub;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(assign,nonatomic)NSInteger numOfCard;

@end
