//
//  QXKMHomePageCardTypeTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMHomePageCardTypeTableViewCell.h"
#import "QXKCardListViewController.h"
#import "QXKGeneral.h"
@implementation QXKMHomePageCardTypeTableViewCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnPushSelcet:(id)sender {
    UIButton* btn=sender;
    QXKCardListViewController *pushView=[[QXKCardListViewController alloc]init];
    pushView.typeView=btn.tag;
    pushView.typeBrand=-1;
    
    id object = self;
    while (![object isKindOfClass:[UIViewController class]] &&
           
           object != nil) {
        
        object = [object nextResponder];
        
    }
    
    UIViewController *uc=(UIViewController*)object;
    [uc.navigationController pushViewController:pushView animated:YES];
    

    
}




@end
