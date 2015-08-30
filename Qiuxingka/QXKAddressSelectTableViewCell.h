//
//  QXKAddressSelectTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKAddressSelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelAddress;
@property (weak, nonatomic) IBOutlet UIButton *buttonIsSelected;
@property (weak, nonatomic) IBOutlet UIView *viewBackgrand;
-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number Address:(NSString*)Address isSelected:(BOOL)isSelect;
@end
