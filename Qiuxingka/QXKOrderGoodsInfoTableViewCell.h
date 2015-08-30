//
//  QXKOrderGoodsInfoTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderGoodsInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCardProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelNum;


-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number  Description:(NSString*)Description  Price:(NSString*)Price  ProfileURL:(NSString*)ProfileURL ;


@end
