//
//  QXKCardBrandTabView.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/30.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QXKCardBrandTabViewDelegate;

@interface QXKCardBrandTabView : UIView

@property(assign,nonatomic)NSInteger typeBrand;//!< -1 = nil, 0 = topps, 1 ＝ panini, 2 ＝ other) ;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonsBrand;

@property(weak,nonatomic)id<QXKCardBrandTabViewDelegate>delegate;

@end

@protocol QXKCardBrandTabViewDelegate <NSObject>

-(void)cardBrandTabView:(QXKCardBrandTabView*)cardBrandTabView changeType:(NSInteger)type;

@end