//
//  QXKOrderInfoChangeViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/5.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderInfoChangeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property(assign,nonatomic)NSInteger typeController;
@property(strong,nonatomic)NSString*strState;


@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

-(void)setBtnT1:(NSString*)btnT1 BtnT2:(NSString*)btnT2 BtnT3:(NSString*)btnT3;
    

@end
