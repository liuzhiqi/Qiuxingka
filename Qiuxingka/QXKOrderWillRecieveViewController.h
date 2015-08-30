//
//  QXKOrderWillRecieveViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/6.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKOrderWillRecieveViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property(assign,nonatomic)NSInteger typeController;
@property(strong,nonatomic)NSString*strState;

-(void)setBtnT1:(NSString*)btnT1 BtnT2:(NSString*)btnT2 BtnT3:(NSString*)btnT3;


@end
