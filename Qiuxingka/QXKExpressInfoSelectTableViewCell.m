

//
//  QXKExpressInfoSelectTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/29.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKExpressInfoSelectTableViewCell.h"

@implementation QXKExpressInfoSelectTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
    
    NSArray * arrayCBBrand=[NSArray arrayWithObjects:@"Topps",@"Panini",@"Futera",nil];
    

    self.comBoxView.backgroundColor = [UIColor whiteColor];
    self.comBoxView.arrowImgName = @"down_dark.png";
    
    self.comBoxView.titlesList =[NSMutableArray arrayWithArray:arrayCBBrand] ;
    self.comBoxView.delegate = self;
    self.comBoxView.supView = self;
    
    
    
    
    CGRect frame= self.comBoxView.frame;
    NSLog(@"%f,%f",frame.origin.x,frame.origin.y);
    
    [self.comBoxView defaultSettings];

    
    
    
    
}
-(void)didMoveToSuperview{
    CGRect frame= self.comBoxView.frame;
    NSLog(@"%f,%f",frame.origin.x,frame.origin.y);
    
//    CGRect frame= self.comBoxView.frame;
//    NSLog(@"%f,%f",frame.size.height,frame.size.width);
//    
//    [self.comBoxView defaultSettings];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)selectAtIndex:(int)index inCombox:(LMComBoxView *)_combox{
    
    
}
@end
