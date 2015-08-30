//
//  QXKOrderSellerInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderSellerInfoTableViewCell.h"

@implementation QXKOrderSellerInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number{
    
    self.labelName.text=[NSString stringWithFormat:@"出卡人：%@",Name];
    self.labelPhone.text=Number;
    
    
}

@end
