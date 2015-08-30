//
//  QXKCardListTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/30.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKCardListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelCanChange;
@property (weak, nonatomic) IBOutlet UILabel *labelCardName;
@property (weak, nonatomic) IBOutlet UILabel *labelCardDescripTion;
@property (weak, nonatomic) IBOutlet UILabel *labelCardPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelCardSeller;

@property (weak, nonatomic) IBOutlet UIButton *buttonCollection;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCardImg;

-(void)setCellDataWithCardName:(NSString*)CardName DescripTion:(NSString*)DescripTion Price:(NSString*)Price Seller:(NSString*)Seller CardImgUrl:(NSString*)CardImgUrl IsChangeable:(NSInteger)IsChangeable;
@end
