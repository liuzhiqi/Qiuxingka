//
//  QXKSearchFilterView.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/25.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QXKSearchFilterViewDelegate;
@interface QXKSearchFilterView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property(strong,nonatomic)NSMutableArray *arrayOrderTitle;
@property(strong,nonatomic)NSMutableArray *arrayCityTitle;
@property(assign,nonatomic)NSInteger tableType;
@property(strong,nonatomic)NSArray* arraySelectIdx;

@property (weak, nonatomic)  id<QXKSearchFilterViewDelegate> delegate;
-(CGFloat)getTableHeight;
-(void)showView;
-(void)hideView;
@end

@protocol QXKSearchFilterViewDelegate <NSObject>

-(void)searchFilterView:(QXKSearchFilterView*)searchFilterView selectIdx:(NSInteger)idx;

@end