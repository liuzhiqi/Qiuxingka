//
//  QXKWikiCollectionViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "QXKGeneral.h"


@implementation QXKWikiCollectionViewCell

- (void)awakeFromNib {
    self.contentView.layer.borderWidth =1;
    self.contentView.layer.borderColor=[[UIColor grayColor] CGColor];
    // Initialization code
}

-(void)setCellDataWithTitle:(NSString*)title subtitle:(NSString*)subtitle url:(NSString*)url  cardId:(NSString*)cardId targetVC:(UIViewController*) vc{
    
    self.labelTitle.text=title;
    self.labelSubtitle.text=subtitle;
    url=[NSString stringWithFormat:@"%@/%@",QXKURL,url];
    [self.imageViewProfile sd_setImageWithURL:[NSURL URLWithString:url]];

    self.btnCollection.viewControllerfather =vc;
    self.btnCollection.idCard=cardId;
    
    
}
@end
