//
//  QXKCardInfoTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMBannerView.h"
@interface QXKCardInfoTableViewCell : UITableViewCell<HMBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelAuthorInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelCardName;
@property (weak, nonatomic) IBOutlet UILabel *labelCardDiscription;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelIsChangeable;
@property (weak, nonatomic) IBOutlet UILabel *labelOrigin;
@property (weak, nonatomic) IBOutlet UIView *viewImages;
@property (strong, nonatomic) HMBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSellerProfile;





@property(strong,nonatomic)NSMutableArray*arratBanner;





//@property (strong, nonatomic) HMBannerView *viewImages;


@property(assign,nonatomic)CGFloat heightCell;
-(void)setCellDataWithName:(NSString*)Name AuthorInfo:(NSString*)AuthorInfo CardName:(NSString*)CardName CardDiscription:(NSString*)CardDiscription Price:(NSString*)Price IsChangeable:(BOOL)IsChangeable Origin:(NSString*)Origin Images:(NSArray*) arrImages SellerProfile:(NSString*)SellerProfile;


@end
