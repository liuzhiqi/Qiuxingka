//
//  QXKMyCardDealInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/5.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMyCardDealInfoTableViewCell.h"
#import "QXKGeneral.h"
@implementation QXKMyCardDealInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number  Description:(NSString*)Description  Price:(NSString*)Price  ProfileURL:(NSString*)ProfileURL TotalPrice:(NSString*)TotalPrice CardState:(NSString*)CardState
{
    
    self.labelName.text=Name;
    self.labelDescription.text=Description;
    self.labelNum.text=[NSString stringWithFormat:@"x%@",Number];
    self.labelPrice.text=[NSString stringWithFormat:@"¥%@",Price];
    self.labelTotalPrice.text=[NSString stringWithFormat:@"¥%@",TotalPrice];
    self.labelCardState.text=CardState;
    NSString* imgUrl=[QXKURL stringByAppendingString:@"/"];
    if (ProfileURL==nil) {
        ProfileURL=@"";
    }
    imgUrl=[imgUrl stringByAppendingString:ProfileURL];
    [self.imageViewCardProfile sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    
}

@end
