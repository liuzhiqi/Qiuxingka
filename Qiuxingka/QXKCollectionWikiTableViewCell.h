//
//  QXKCollectionWikiTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXKCollectionButton.h"
@interface QXKCollectionWikiTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelCardName;
@property (weak, nonatomic) IBOutlet UILabel *labelCardDescripTion;
@property (weak, nonatomic) IBOutlet UILabel *labelCardSeries;
@property (weak, nonatomic) IBOutlet UILabel *labelBrand;
@property (weak, nonatomic) IBOutlet UILabel *labelCardNum;

@property (weak, nonatomic) IBOutlet QXKCollectionButton *buttonCollection;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCardImg;

-(void)setCellDataWithTitle:(NSString*)title description:(NSString*)description series:(NSString*)series brand:(NSString*)brand cardNum:(NSString*)cardNum imageViewUrl:(NSString*)imageViewUrl cardId:(NSString*)cardId targetVC:(UIViewController*) vc;



@end
