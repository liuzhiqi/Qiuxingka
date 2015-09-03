//
//  QXKCollectionCardTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXKCollectionButton.h"
@interface QXKCollectionCardTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelCanChange;
@property (weak, nonatomic) IBOutlet UILabel *labelCardName;
@property (weak, nonatomic) IBOutlet UILabel *labelCardDescripTion;
@property (weak, nonatomic) IBOutlet UILabel *labelCardPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelCardSeller;

@property (weak, nonatomic) IBOutlet QXKCollectionButton *buttonCollection;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCardImg;
-(void)setCellDataWithName:(NSString*)Name DescripTion:(NSString*)DescripTion Price:(NSString*)Price Seller:(NSString*)Seller CardImg:(NSString*)CardImgUrl CanChange:(NSNumber*)CanChange ;



@end
