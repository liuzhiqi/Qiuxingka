//
//  QXKCardCommentTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKCardCommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelComment;

@property(assign,nonatomic)CGFloat heightCell;
-(void)setCellDataWithName:(NSString*)Name Comment:(NSString*)Comment ProfileUrl:(NSString*) ProfileUrl;

@end
