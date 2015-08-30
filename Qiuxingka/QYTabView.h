//
//  QYTabView.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QYTabViewDelegate;
@interface QYTabView : UIView

@property(weak,nonatomic)id<QYTabViewDelegate>delegate;
@property(assign,nonatomic)NSInteger idxTab;//!< -1 = noSelect;

@property(assign,nonatomic)BOOL canNoSelection;

@property (strong, nonatomic)  NSMutableArray *buttons;

-(void)setTabTitleWithArray:(NSArray*)titles;

@end


@protocol QYTabViewDelegate <NSObject>

-(void)tabView:(QYTabView*)tabView changeIdx:(NSInteger)idx;

@end