//
//  QXKWikiSearchBar.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QXKWikiSearchBarDelegate ;
@interface QXKWikiSearchBar : UIView<UISearchBarDelegate>
{
    BOOL isShow;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(weak,nonatomic)id<QXKWikiSearchBarDelegate> delegate;
@end
@protocol QXKWikiSearchBarDelegate <NSObject>

-(void)wikiSearchBar:(QXKWikiSearchBar*)searchBar willShow:(BOOL)isShow;

@end
