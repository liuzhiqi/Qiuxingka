//
//  QXKWikiDetailCardInfoTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/10.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKWikiDetailCardInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPic;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet UILabel *labelFactory;
@property (weak, nonatomic) IBOutlet UILabel *labelSeries;
@property (weak, nonatomic) IBOutlet UILabel *labelCardNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelRareLevel;


-(void)setCellDataWithTItle:(NSString*)title subtitle:(NSString*)subtitle cardType:(NSString*)cardType factory:(NSString*)factory cardNumber:(NSString*)cardNumber series:(NSString*)series rareLevel:(NSString*)rareLevel imagePic:(NSString*)picUrl;




@end
