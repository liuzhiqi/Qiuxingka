//
//  QXKCollectionCardTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/4.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCollectionCardTableViewCell.h"
#import "QXKGeneral.h"
@implementation QXKCollectionCardTableViewCell

- (void)awakeFromNib {
    self.labelCanChange.layer.borderWidth=1;
    self.labelCanChange.layer.borderColor=[[UIColor  QXKGreenLight] CGColor];

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellDataWithName:(NSString*)Name DescripTion:(NSString*)DescripTion Price:(NSString*)Price Seller:(NSString*)Seller CardImg:(NSString*)CardImgUrl CanChange:(NSNumber*)CanChange {
    
    
    

    self.labelCardName.text=Name;
    self.labelCanChange.hidden=(CanChange==0);
    self.labelCardDescripTion.text=DescripTion;
    self.labelCardPrice.text=[NSString stringWithFormat:@"¥%@",Price];
    
    self.labelCardSeller.text=Seller;
    
    NSMutableString  *imgUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [imgUrl appendString:@"/" ];
    if (CardImgUrl!=[NSNull null]) {
        if (CardImgUrl!=nil) {
            [imgUrl appendString:CardImgUrl ];
        }
    }
    

    [self.imageViewCardImg sd_setImageWithURL:[NSURL URLWithString:imgUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        ;
    }];
    

    
    
    
    
}
@end
