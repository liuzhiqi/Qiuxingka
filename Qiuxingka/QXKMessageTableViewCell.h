//
//  QXKMessageTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKMessageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewMessageImg;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIView *viewBG;


-(void)setCellDataWithTitle:(NSString*)Title Subtitle:(NSString*)Subtitle Description:(NSString*)Description ImgUrl:(NSString*)ImgUrl ;




@end
