//
//  QXKWikiFilterView.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/24.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol QXKWikiFilterViewDelegate ;
@interface QXKWikiFilterView : UIView{
    BOOL isShow;
}

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrayBtnBrand;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrayBtnCategory;

@property(weak,nonatomic)id<QXKWikiFilterViewDelegate> delegate;
@end
@protocol QXKWikiFilterViewDelegate <NSObject>

-(void)wikiFilterView:(QXKWikiFilterView*)filter selectBrandIdx:(NSInteger)index;

-(void)wikiFilterView:(QXKWikiFilterView*)filter selectCategoryIdx:(NSInteger)index;

-(void)wikiFilterView:(QXKWikiFilterView*)filter selectCategoryIdx:(NSInteger)cindex selectBrandIdx:(NSInteger)bindex;

@end




