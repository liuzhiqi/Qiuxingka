//
//  QXKMessageCommentTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/29.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMessageCommentTableViewCell.h"

@implementation QXKMessageCommentTableViewCell

- (void)awakeFromNib {
    self.buttonBack.layer.borderColor=[[UIColor blackColor] CGColor];
    self.buttonBack.layer.cornerRadius=6;
    self.buttonBack.layer.borderWidth=1;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
