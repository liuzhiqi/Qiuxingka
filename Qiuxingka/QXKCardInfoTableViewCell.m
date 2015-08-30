
//
//  QXKCardInfoTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//
#import "QXKCardInfoTableViewCell.h"
#import "QXKGeneral.h"
const float QXKCardInfoTableViewCellBannerRatio =2.5;
@implementation QXKCardInfoTableViewCell
- (void)awakeFromNib {
    // Initialization code
    if (self.bannerView != nil)
    {
        [self.bannerView reloadBannerWithData:self.arratBanner];
    }
    else
    {
        
        CGRect frame=[UIScreen mainScreen].applicationFrame;
        self.bannerView = [[HMBannerView alloc] initWithFrame:CGRectMake(0, 0,( frame.size.width -20), ( frame.size.width -20)/QXKCardInfoTableViewCellBannerRatio) scrollDirection:ScrollDirectionLandscape images:self.arratBanner];
        
        [self.bannerView setRollingDelayTime:4.0];
        [self.bannerView setDelegate:self];
        [self.bannerView setSquare:0];
        [self.bannerView setPageControlStyle:PageStyle_Right];
        [self.bannerView startDownloadImage];
        //[self.m_BannerView showClose:YES];
    }
    
    [self.viewImages addSubview: self.bannerView];
    self.viewImages.layer.masksToBounds=YES;
    

    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellDataWithName:(NSString*)Name AuthorInfo:(NSString*)AuthorInfo CardName:(NSString*)CardName CardDiscription:(NSString*)CardDiscription Price:(NSString*)Price IsChangeable:(BOOL)IsChangeable Origin:(NSString*)Origin Images:(NSArray*) arrImages SellerProfile:(NSString*)SellerProfile
{
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    
    self.heightCell=54+frameScreen.size.width*8/15+5+21+5+60;
    self.labelName.text=Name;
    self.labelAuthorInfo.text=AuthorInfo;
    self.labelCardName.text=CardName;
    self.labelCardDiscription.text=CardDiscription;
    self.labelPrice.text=[NSString stringWithFormat:@"¥%@",Price];
    self.labelIsChangeable.hidden=!IsChangeable;
    self.labelOrigin.text=Origin;
    
    
    
    
    
    self.arratBanner=[[NSMutableArray alloc]init];
    [self.arratBanner removeAllObjects];
    for (int i=0; i<arrImages.count; i++) {
        NSString* imgUrl=[QXKURL stringByAppendingString:@"/"];
        imgUrl=[imgUrl stringByAppendingString:arrImages[i]];
        NSDictionary *bannerDic = [NSDictionary dictionaryWithObjectsAndKeys:imgUrl, @"img_url", nil];
        [self.arratBanner addObject:bannerDic];
    }
    
    [self.imageViewSellerProfile sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"卖家"]];
    
    
    [self loadDataBanner];
    
    
    
    
    
    CGSize sizeTitle=[self.labelCardDiscription sizeThatFits:CGSizeMake(frameScreen.size.width-2*28,CGFLOAT_MAX)];
    self.heightCell+=sizeTitle.height;
    
}

-(void)loadDataBanner{
    [self.bannerView reloadBannerWithData:self.arratBanner];
    
    
    
    
}
-(void)imageCachedDidFinish:(HMBannerView *)bannerView{
    
    
    
}
@end
