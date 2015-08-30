//
//  QXKCardBrandTabView.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/30.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardBrandTabView.h"
#import "QXKGeneral.h"
@implementation QXKCardBrandTabView



-(void)setTypeBrand:(NSInteger)typeBrand{
    _typeBrand=typeBrand;
    
    for (UIButton* button in self.buttonsBrand) {
        if (button.tag==self.typeBrand) {
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)btnPushTab:(id)sender {
    UIButton* btn=sender;
    if (btn.tag== self.typeBrand) {
        
        self.typeBrand=-1;
    }
    else{
        self.typeBrand=btn.tag;
       
    }
    [self.delegate cardBrandTabView:self changeType:self.typeBrand];
}

@end
