//
//  QXKMessageButton.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/17.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMessageButton.h"
#import "QXKMessageViewController.h"
@implementation QXKMessageButton
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    
    
    return self;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    
    
    [self addTarget:self action:@selector(btnPush) forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;


}

-(void)btnPush{
    
    
    QXKMessageViewController *pushView=[[QXKMessageViewController alloc]init];
    
    
    
    id object = [self nextResponder];
    while ((![object isKindOfClass:[UIViewController class]] && object != nil)&&(![object isKindOfClass:[UITabBarController class]] && object != nil)) {
        

        
        object = [object nextResponder];
        if ([object isKindOfClass:[UINavigationController class]]) {
            [object pushViewController:pushView animated:YES];
            return;
        }
    }
    
    
    UIViewController *uc=(UIViewController*)object;
    
    [uc.navigationController pushViewController:pushView animated:YES];
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
