//
//  QXKWillExchangeTableViewHeader.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWillExchangeTableViewHeader.h"
#import "QXKGeneral.h"
@implementation QXKWillExchangeTableViewHeader
-(void)awakeFromNib{
    QXKUserInfo* userInfo=[QXKUserInfo shareUserInfo];
    self.labelName.text=userInfo.userName;
    
    NSMutableString  *imgUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [imgUrl appendString:@"/" ];
    if (userInfo.profileUrl!=[NSNull null]) {
        if (userInfo.profileUrl!=nil) {
            [imgUrl appendString:userInfo.profileUrl ];
        }
    }
    
    [self.imageViewProfile sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"卖家"]];
    
    self.labelDescription.text=[NSString stringWithFormat:@"已售出%@张,已购入%@张",userInfo.numSell,userInfo.numBuy];
   
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
