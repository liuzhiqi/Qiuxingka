//
//  QXKCardCommentTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardCommentTableViewCell.h"

@implementation QXKCardCommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithName:(NSString*)Name Comment:(NSString*)Comment ProfileUrl:(NSString*) ProfileUrl{
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    self.heightCell=54+25;
    self.labelName.text=Name;
    self.labelComment.text=Comment;
    
    CGSize sizeLabel=[self.labelComment sizeThatFits:CGSizeMake(frameScreen.size.width-2*40,CGFLOAT_MAX)];
    self.heightCell+=sizeLabel.height;
    
    
}
@end
