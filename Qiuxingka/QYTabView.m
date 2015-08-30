//
//  QYTabView.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QYTabView.h"

#import "QXKGeneral.h"
@implementation QYTabView


-(instancetype)init{
    self=[super init];
    self.buttons=[[NSMutableArray alloc]init];

    return self;
}




-(void)setTabTitleWithArray:(NSArray*)titles{
    UIView* lastView=self;
    for (int i=0; i<titles.count; i++) {
        UIButton*btn=[[UIButton alloc    ]init];
        [self.buttons addObject:btn];
        [self addSubview:btn];
        btn.tag=i;
        [btn addTarget:self action:@selector(btnPushTab:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitle:titles[i] forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        btn.translatesAutoresizingMaskIntoConstraints=NO;
        

        [self addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        
        if (i!=0) {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
        }else{
            [self addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
            
        }

        lastView=btn;
    }
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lastView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    self.idxTab=-1;
    
}




-(void)setIdxTab:(NSInteger)idxTab{
    _idxTab=idxTab;
    
    for (UIButton* button in self.buttons) {
        if (button.tag==self.idxTab) {
            button.backgroundColor=[UIColor QXKGreenDark];
        }else{
            button.backgroundColor=[UIColor QXKGreenLight];
            
        }
    }
    
    
}


-(void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    
    
}


- (void )btnPushTab:(id)sender {
    UIButton* btn=sender;
    
    if (self.canNoSelection) {
        if (btn.tag== self.idxTab) {
            self.idxTab=-1;
        }
        else{
            self.idxTab=btn.tag;
        }
    }else{
        self.idxTab=btn.tag;
    }
    
    
    
    [self.delegate tabView:self changeIdx:self.idxTab];

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
