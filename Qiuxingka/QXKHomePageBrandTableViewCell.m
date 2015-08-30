//
//  QXKHomePageBrandTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKHomePageBrandTableViewCell.h"
#import "QXKCardListViewController.h"

@implementation QXKHomePageBrandTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnPushSelectBrand:(id)sender {
    
    UIButton* btn=sender;
    QXKCardListViewController *pushView=[[QXKCardListViewController alloc]init];
    pushView.typeView=-1;
    pushView.typeBrand=btn.tag;
    
    id object = self;
    while (![object isKindOfClass:[UIViewController class]] &&
           
           object != nil) {
        
        object = [object nextResponder];
        
    }
    
    UIViewController *uc=(UIViewController*)object;
    [uc.navigationController pushViewController:pushView animated:YES];

    
}





@end
