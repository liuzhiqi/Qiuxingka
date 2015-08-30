//
//  QXKWikiDetailCardDescriptionTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/10.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiDetailCardDescriptionTableViewCell.h"

@implementation QXKWikiDetailCardDescriptionTableViewCell

- (void)awakeFromNib {
    self.viewBG.layer.cornerRadius=15;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellWithDiscription:(NSString* )description name:(NSString*)name{
    
    self.labelName.text=[NSString stringWithFormat:@"贡献者：%@",name];;
    self.labelDescription.text=description;
    self.cellHeight=140;
    UIFont *font = self.labelDescription.font;
    // 根据字体得到NSString的尺寸
    CGRect frameScreen=[UIScreen mainScreen ].applicationFrame;
    CGFloat contentW=frameScreen.size.width-40;
    CGRect rectLabel = [self.labelDescription.text boundingRectWithSize:CGSizeMake(contentW, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    CGFloat labelNameH = rectLabel.size.height;
    self.cellHeight+=labelNameH;
    
}
@end
