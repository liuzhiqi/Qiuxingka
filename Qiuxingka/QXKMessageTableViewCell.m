//
//  QXKMessageTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMessageTableViewCell.h"

@implementation QXKMessageTableViewCell

- (void)awakeFromNib {
//    self.viewBG.layer.masksToBounds=YES;
    self.viewBG.layer.shadowOffset=CGSizeMake(2, 2);
    self.viewBG.layer.shadowOpacity=1;
    self.viewBG.layer.shadowColor=[[UIColor grayColor]CGColor];
    self.viewBG.layer.shadowRadius=2;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setCellDataWithTitle:(NSString*)Title Subtitle:(NSString*)Subtitle Description:(NSString*)Description ImgUrl:(NSString*)ImgUrl {
    self.labelTitle.text=Title;
    self.labelSubtitle.text=Subtitle;
    self.labelDescription.text=Description;
    
    
    
    
    
}
@end
