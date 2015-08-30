//
//  QYCityAreaPicker.h
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/3.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QYCityAreaPickerDelegate;

@interface QYCityAreaPicker : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{
//    UIPickerView *picker;
    UIButton *button;
    
    NSDictionary *areaDic;
    NSArray *province;
    NSArray *city;
    NSArray *district;
    
    NSString *selectedProvince;
}


@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property(weak,nonatomic)id<QYCityAreaPickerDelegate> delegate;

@end
@protocol QYCityAreaPickerDelegate <NSObject>

-(void)QYCityAreaPicker:(QYCityAreaPicker*) picker selectArea:(NSString*) area;

@end