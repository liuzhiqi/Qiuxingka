//
//  QXKOrderSelectCardNumTableViewCell.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKOrderSelectCardNumTableViewCell.h"
#import "QXKGeneral.h"
@implementation QXKOrderSelectCardNumTableViewCell

- (void)awakeFromNib {
    
    self.numOfCard=1;
    [self setButton:self.buttonSub Enable:NO];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnPushSub:(id)sender {
    if (self.numOfCard==2) {
        [self setButton:self.buttonSub Enable:NO];
    }
    self.numOfCard--;
    self.textField.text=[NSString   stringWithFormat:@"%ld",self.numOfCard];

}
- (IBAction)btnPushAdd:(id)sender {
    
    if (self.numOfCard==1) {
           [self setButton:self.buttonSub Enable:YES];
    }
    self.numOfCard++;
    
    self.textField.text=[NSString   stringWithFormat:@"%ld",self.numOfCard];
}



-(void)setButton:(UIButton*)btn Enable:(BOOL)enable{
    
    btn.enabled=enable;
    if (enable) {
        btn.backgroundColor=[UIColor QXKGreenLight];
    }
    else {
        btn.backgroundColor=[UIColor grayColor];
    }
    
}



@end
