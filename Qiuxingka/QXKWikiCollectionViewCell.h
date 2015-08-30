//
//  QXKWikiCollectionViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKWikiCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;


-(void)setCellDataWithTitle:(NSString*)title subtitle:(NSString*)subtitle url:(NSString*)url;



@end
