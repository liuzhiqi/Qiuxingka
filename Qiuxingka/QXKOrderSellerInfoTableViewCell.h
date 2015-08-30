//
//  QXKOrderSellerInfoTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderSellerInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPhone;

-(void)setCellDataWithName:(NSString*)Name Number:(NSString*)Number ;
@end
