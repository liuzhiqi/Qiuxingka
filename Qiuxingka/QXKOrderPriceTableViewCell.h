//
//  QXKOrderPriceTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderPriceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTotalPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelTransExpense;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintVTTransCell;
-(void)setCellDataWithTotalPrice:(NSString*)TotalPrice TransExpense:(NSString*)TransExpense ;


@end
