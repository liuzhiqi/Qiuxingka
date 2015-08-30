//
//  QXKAddressInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKAddressInfoTableViewCell.h"

@implementation QXKAddressInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number Address:(NSString*)Address{
    
    self.labelName.text=[NSString stringWithFormat:@"收货人：%@",Name];
    self.labelAddress.text=[NSString stringWithFormat:@"收货人：%@",Address];
    self.labelNumber.text=Number;
    
    
}




@end
