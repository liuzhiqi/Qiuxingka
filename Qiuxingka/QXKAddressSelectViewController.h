//
//  QXKAddressSelectViewController.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QXKAddressSelectDelegate;
@interface QXKAddressSelectViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) id <QXKAddressSelectDelegate>delegate;

@property(strong,nonatomic)NSMutableArray *arrayAddress;

@end
@protocol QXKAddressSelectDelegate <NSObject>

-(void)addressSelectWithName:(NSString*)name phone:(NSString*)phone address:(NSString*) address addressId:(NSString*)addressId;

@end