//
//  QXKCardListTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/30.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardListTableViewCell.h"
#import "QXKGeneral.h"

@implementation QXKCardListTableViewCell

- (void)awakeFromNib {
    self.labelCanChange.layer.borderWidth=1;
    self.labelCanChange.layer.borderColor=[[UIColor  QXKGreenLight] CGColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellDataWithCardName:(NSString*)CardName DescripTion:(NSString*)DescripTion Price:(NSString*)Price Seller:(NSString*)Seller CardImgUrl:(NSString*)CardImgUrl IsChangeable:(NSInteger)IsChangeable cardId:(NSString*)cardId targetVC:(UIViewController*) vc{
    
    self.labelCardName.text=CardName;
    self.labelCardDescripTion.text=DescripTion;
    self.labelCardPrice.text=[NSString stringWithFormat:@"¥%@",Price] ;
    self.labelCardSeller.text=Seller;
    self.labelCanChange.hidden=IsChangeable==1;
    NSString* imgUrl=[QXKURL stringByAppendingString:@"/"];
    
    if (CardImgUrl==nil) {
        CardImgUrl=@"";
    }
    imgUrl=[imgUrl stringByAppendingString:CardImgUrl];
    [self.imageViewCardImg sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    self.buttonCollection.viewControllerfather =vc;
    self.buttonCollection.idCard=cardId;
    
    
}
@end
