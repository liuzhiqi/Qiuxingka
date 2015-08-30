//
//  QXKSearchFilterBar.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/26.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QXKSearchFilterBarDelegate;

@interface QXKSearchFilterBar : UIView

@property (weak, nonatomic) IBOutlet UIButton *btnCity;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCity;
@property (weak, nonatomic) IBOutlet UIButton *btnOrder;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOrder;
@property(weak,nonatomic)id<QXKSearchFilterBarDelegate>delegate;
-(void) deSelectAll;
@end

@protocol QXKSearchFilterBarDelegate <NSObject>

-(void)searchFilterBar:(QXKSearchFilterBar*)tabView changeIdx:(NSInteger)idx;
@end
