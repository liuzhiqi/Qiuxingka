//
//  QXKOrderGoodsInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderGoodsInfoTableViewCell.h"
#import "QXKGeneral.h"
@implementation QXKOrderGoodsInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number  Description:(NSString*)Description  Price:(NSString*)Price  ProfileURL:(NSString*)ProfileURL {
    
    self.labelName.text=Name;
    self.labelNum.text=[NSString stringWithFormat:@"x%@",Number];
    self.labelDescription.text=Description;
    self.labelPrice.text=[NSString stringWithFormat:@"¥%@",Number];
   
    NSString* imgUrl=[QXKURL stringByAppendingString:@"/"];
    imgUrl=[imgUrl stringByAppendingString:ProfileURL];
    [self.imageViewCardProfile sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    
    
    
}



@end
