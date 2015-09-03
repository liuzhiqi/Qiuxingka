//
//  QXKWikiCollectionViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXKCollectionButton.h"
@interface QXKWikiCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet QXKCollectionButton *btnCollection;


-(void)setCellDataWithTitle:(NSString*)title subtitle:(NSString*)subtitle url:(NSString*)url cardId:(NSString*)cardId targetVC:(UIViewController*) vc;



@end
