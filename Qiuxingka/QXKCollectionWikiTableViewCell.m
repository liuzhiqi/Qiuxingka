//
//  QXKCollectionWikiTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCollectionWikiTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "QXKGeneral.h"
@implementation QXKCollectionWikiTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithTitle:(NSString*)title description:(NSString*)description series:(NSString*)series brand:(NSString*)brand cardNum:(NSString*)cardNum imageViewUrl:(NSString*)imageViewUrl{
    
    self.labelCardName.text=title;
    self.labelCardDescripTion.text=description;
    self.labelCardSeries.text=series;
    self.labelBrand.text=brand;
    self.labelCardNum.text=cardNum;
    imageViewUrl=[NSString stringWithFormat:@"%@/%@",QXKURL,imageViewUrl];
    [self.imageViewCardImg sd_setImageWithURL:[NSURL URLWithString:imageViewUrl]];
    
    
    
}


@end
