//
//  QXKOrderInfoTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelOrderId;
@property (weak, nonatomic) IBOutlet UILabel *labelOrderPaymentId;
@property (weak, nonatomic) IBOutlet UILabel *labelOrderDate;

-(void)setCellDataWithOrderId:(NSString*)OrderId OrderPaymentId:(NSString*)OrderPaymentId OrderDate:(NSString*)OrderDate ;

@end
