//
//  QXKAddressSelectTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKAddressSelectTableViewCell.h"

@implementation QXKAddressSelectTableViewCell

- (void)awakeFromNib {
    self.viewBackgrand.layer.borderWidth=0.7;
    self.viewBackgrand.layer.borderColor=[[UIColor grayColor]CGColor];
    self.viewBackgrand.layer.shadowColor=[[UIColor lightGrayColor]CGColor];
    self.viewBackgrand.layer.shadowOffset=CGSizeMake(5, 5);
    self.viewBackgrand.layer.shadowRadius=5;
    self.viewBackgrand.layer.shadowOpacity=1;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number Address:(NSString*)Address isSelected:(BOOL)isSelect{
    
    self.labelName.text=[NSString stringWithFormat:@"收货人：%@",Name];
    self.labelAddress.text=[NSString stringWithFormat:@"收货人：%@",Address];
    self.labelNumber.text=Number;
    self.buttonIsSelected.highlighted=isSelect;

    
}
@end
