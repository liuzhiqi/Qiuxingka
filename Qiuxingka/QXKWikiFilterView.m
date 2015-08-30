//
//  QXKWikiFilterView.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/24.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiFilterView.h"
#import "QXKGeneral.h"
@implementation QXKWikiFilterView
-(void)awakeFromNib{
    for (UIButton*btn in self.arrayBtnBrand) {
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.layer.cornerRadius=15;
        
    }
    for (UIButton*btn in self.arrayBtnCategory) {
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.layer.cornerRadius=15;
    }
    
}
-(void)button:(UIButton*)btn select:(BOOL)isSelect{
    if (isSelect) {
        btn.selected=YES;
        btn.backgroundColor=[UIColor QXKGreenDark];
    }else{
        
        btn.selected=NO;
        btn.backgroundColor=[UIColor QXKLightLightGray];
    }
}


- (IBAction)btnPushBrand:(id)sender {
    
    for (UIButton*btn in self.arrayBtnBrand) {
        if (btn.tag!=((UIButton*)sender).tag) {
            [self button:btn select:NO];
        }
    }
    [self button:sender select:!((UIButton*)sender).selected];
//    if (((UIButton*)sender).selected) {
//        [self.delegate wikiFilterView:self selectBrandIdx:((UIButton*)sender).tag];
//    }else{
//        [self.delegate wikiFilterView:self selectBrandIdx:-1];
//    }
    
}


- (IBAction)btnPushCategory:(id)sender {
    for (UIButton*btn in self.arrayBtnCategory) {
        if (btn.tag!=((UIButton*)sender).tag) {
            [self button:btn select:NO];
        }
    }
    [self button:sender select:!((UIButton*)sender).selected];
//    if (((UIButton*)sender).selected) {
//        [self.delegate wikiFilterView:self selectCategoryIdx:((UIButton*)sender).tag];
//    }else{
//        [self.delegate wikiFilterView:self selectCategoryIdx:-1];
//    }
//
}


- (IBAction)btnPushReset:(id)sender {
    
    for (UIButton*btn in self.arrayBtnCategory) {
        [self button:btn select:NO];
    }
    for (UIButton*btn in self.arrayBtnBrand) {
        [self button:btn select:NO];
    }
    
    
}

- (IBAction)btnPushConfirm:(id)sender {
    
    NSInteger bindx=-1;
    NSInteger cindx=-1;
    
    for (UIButton*btn in self.arrayBtnCategory) {
        
        if (btn.selected) {
            bindx=btn.tag;
            break;
        }
    }
    for (UIButton*btn in self.arrayBtnBrand) {
        if (btn.selected) {
            cindx=btn.tag;
            break;
        }
    }



    [self.delegate wikiFilterView:self selectCategoryIdx:cindx selectBrandIdx:bindx];




}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
