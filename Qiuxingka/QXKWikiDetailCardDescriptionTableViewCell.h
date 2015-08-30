//
//  QXKWikiDetailCardDescriptionTableViewCell.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/10.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXKWikiDetailCardDescriptionTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property(assign,nonatomic) NSInteger cellHeight;
@property (weak, nonatomic) IBOutlet UIView *viewBG;
@property (weak, nonatomic) IBOutlet UIButton *buttonEdit;

-(void)setCellWithDiscription:(NSString* )description name:(NSString*)name;

@end
