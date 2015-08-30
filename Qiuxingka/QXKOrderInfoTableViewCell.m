//
//  QXKOrderInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderInfoTableViewCell.h"

@implementation QXKOrderInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setCellDataWithOrderId:(NSString*)OrderId OrderPaymentId:(NSString*)OrderPaymentId OrderDate:(NSString*)OrderDate {
    
    self.labelOrderPaymentId.text=[NSString stringWithFormat:@"支付宝订单号：%@",OrderPaymentId];
    self.labelOrderId.text=[NSString stringWithFormat:@"个人订单号：%@",OrderId];
    self.labelOrderDate.text=[NSString stringWithFormat:@"成交时间：%@",OrderDate];
    
    
    
}



@end
