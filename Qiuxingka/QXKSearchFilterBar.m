//
//  QXKSearchFilterBar.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/26.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKSearchFilterBar.h"
#import "QXKGeneral.h"
#define QXKSearchFilterBarSelectImageSelect @"下一步"
#define QXKSearchFilterBarSelectImageDeselect @"上一步"

@implementation QXKSearchFilterBar

-(void)awakeFromNib{
    
    [self.btnCity setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnCity  setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.btnOrder setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnOrder  setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.btnCity.tag=0;
    self.btnOrder.tag=1;
    
    self.imageViewCity.image=[UIImage imageNamed:QXKSearchFilterBarSelectImageDeselect];
    self.imageViewOrder.image=[UIImage imageNamed:QXKSearchFilterBarSelectImageDeselect];
    
    
}

-(void)button:(UIButton *)btn Select:(BOOL)isSelect{
    if (isSelect) {
        btn.backgroundColor=[UIColor QXKGreenLight];
    }else{
        btn.backgroundColor=[UIColor QXKGreenDark];
    }
    btn.selected=isSelect;
    
    if(btn.tag==0){
        self.imageViewCity.image=[UIImage imageNamed:(isSelect?QXKSearchFilterBarSelectImageSelect:QXKSearchFilterBarSelectImageDeselect)];
    }else{
        self.imageViewOrder.image=[UIImage imageNamed:(isSelect?QXKSearchFilterBarSelectImageSelect:QXKSearchFilterBarSelectImageDeselect)];
    }
}

- (IBAction)btnPushCity:(id)sender {
    
    [self button:self.btnCity Select:!self.btnCity.selected];
    [self button:self.btnOrder Select:NO];
    if (!((UIButton*)sender).selected) {
        [self.delegate searchFilterBar:self changeIdx:-1];
        return;
    }
    [self.delegate searchFilterBar:self changeIdx:0];
    
}

- (IBAction)btnPushOrder:(id)sender {
    
    [self button:self.btnOrder Select:!self.btnOrder.selected];
    [self button:self.btnCity Select:NO];
    if (!((UIButton*)sender).selected) {
        [self.delegate searchFilterBar:self changeIdx:-1];
        return;
    }
    [self.delegate searchFilterBar:self changeIdx:1];
    
}

-(void) deSelectAll{
    [self button:self.btnOrder Select:NO];
    [self button:self.btnCity Select:NO];
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
