//
//  QXKOrderPriceTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderPriceTableViewCell.h"

@implementation QXKOrderPriceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithTotalPrice:(NSString*)TotalPrice TransExpense:(NSString*)TransExpense {
    
    if (TotalPrice!=nil) {
        self.labelTotalPrice.hidden=NO;
        self.constraintVTTransCell.constant=40;
        self.labelTotalPrice.text=[NSString stringWithFormat:@"合计：¥%@",TotalPrice];
    }else{
        self.labelTotalPrice.hidden=YES;
        self.constraintVTTransCell.constant=15;
    }
    
    self.labelTransExpense.text=[NSString stringWithFormat:@"运费：¥%@",TransExpense];
    
        
}


@end
