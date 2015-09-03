//
//  QXKCollectionButton.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/3.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
//tag＝0 card tag＝1 wiki
@interface QXKCollectionButton : UIButton
@property (strong,nonatomic)NSString* idCard;

@property (weak,nonatomic)UIViewController* viewControllerfather;


@end
