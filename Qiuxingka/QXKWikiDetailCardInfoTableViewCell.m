//
//  QXKWikiDetailCardInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/10.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiDetailCardInfoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "QXKGeneral.h"
@implementation QXKWikiDetailCardInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellDataWithTItle:(NSString*)title subtitle:(NSString*)subtitle cardType:(NSString*)cardType factory:(NSString*)factory cardNumber:(NSString*)cardNumber series:(NSString*)series rareLevel:(NSString*)rareLevel imagePic:(NSString*)picUrl
{
    [NSString stringWithFormat:@"%@",picUrl];
    self.labelTitle.text=title;
    self.labelSubtitle.text=subtitle;
    self.labelType.text=[NSString stringWithFormat:@"类别：%@",cardType];;
    self.labelFactory.text=[NSString stringWithFormat:@"厂商：%@",factory];;
    self.labelSeries.text=[NSString stringWithFormat:@"系列：%@",series];
    self.labelCardNumber.text=[NSString stringWithFormat:@"编号：%@",cardNumber];;
    self.labelRareLevel.text=[NSString stringWithFormat:@"稀有度：%@",rareLevel];;
    self.labelTitle.text=title;
    picUrl=[NSString stringWithFormat:@"%@/%@",QXKURL,picUrl];
    [self.imageViewPic sd_setImageWithURL:[NSURL URLWithString:picUrl]];
    
    
}


@end
