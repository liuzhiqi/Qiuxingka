//
//  QYCityAreaPicker.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/3.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#define PROVINCE_COMPONENT  0
#define CITY_COMPONENT      1
#define DISTRICT_COMPONENT  2
#import "QYCityAreaPicker.h"

@implementation QYCityAreaPicker

-(instancetype)init{

    
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"QYCityAreaPicker" owner:nil options:nil];
   return  [nibView objectAtIndex:0];
    
    
    
}
- (IBAction)btnPushFinish:(id)sender {
    self.hidden=YES;
    
    NSInteger provinceIndex = [self.picker selectedRowInComponent: PROVINCE_COMPONENT];
    NSInteger cityIndex = [self.picker selectedRowInComponent: CITY_COMPONENT];
    NSInteger districtIndex = [self.picker selectedRowInComponent: DISTRICT_COMPONENT];
    
    NSString *provinceStr = [province objectAtIndex: provinceIndex];
    NSString *cityStr = [city objectAtIndex: cityIndex];
    NSString *districtStr = [district objectAtIndex:districtIndex];
    
    if ([provinceStr isEqualToString: cityStr] && [cityStr isEqualToString: districtStr]) {
        cityStr = @"";
        districtStr = @"";
    }
    else if ([cityStr isEqualToString: districtStr]) {
        districtStr = @"";
    }
    
    NSString *showMsg = [NSString stringWithFormat: @"%@,%@,%@", provinceStr, cityStr, districtStr];

    [self.delegate QYCityAreaPicker:self selectArea:showMsg];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"area" ofType:@"plist"];
    areaDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *components = [areaDic allKeys];
    NSArray *sortedArray = [components sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableArray *provinceTmp = [[NSMutableArray alloc] init];
    for (int i=0; i<[sortedArray count]; i++) {
        NSString *index = [sortedArray objectAtIndex:i];
        NSArray *tmp = [[areaDic objectForKey: index] allKeys];
        [provinceTmp addObject: [tmp objectAtIndex:0]];
    }
    
    province = [[NSArray alloc] initWithArray: provinceTmp];
    
    NSString *index = [sortedArray objectAtIndex:0];
    NSString *selected = [province objectAtIndex:0];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [[areaDic objectForKey:index]objectForKey:selected]];
    
    NSArray *cityArray = [dic allKeys];
    NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
    city = [[NSArray alloc] initWithArray: [cityDic allKeys]];
    
    
    NSString *selectedCity = [city objectAtIndex: 0];
    district = [[NSArray alloc] initWithArray: [cityDic objectForKey: selectedCity]];
    

    self.picker.dataSource = self;
    self.picker.delegate = self;
    self.picker.showsSelectionIndicator = YES;
    [self.picker selectRow: 0 inComponent: 0 animated: YES];
    selectedProvince = [province objectAtIndex: 0];
    
    
    
    
}

#pragma mark- Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return [province count];
    }
    else if (component == CITY_COMPONENT) {
        return [city count];
    }
    else {
        return [district count];
    }
}


#pragma mark- Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return [province objectAtIndex: row];
    }
    else if (component == CITY_COMPONENT) {
        return [city objectAtIndex: row];
    }
    else {
        return [district objectAtIndex: row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        selectedProvince = [province objectAtIndex: row];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: [NSString stringWithFormat:@"%d", row]]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *cityArray = [dic allKeys];
        NSArray *sortedArray = [cityArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;//递减
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;//上升
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i=0; i<[sortedArray count]; i++) {
            NSString *index = [sortedArray objectAtIndex:i];
            NSArray *temp = [[dic objectForKey: index] allKeys];
            [array addObject: [temp objectAtIndex:0]];
        }

        city = [[NSArray alloc] initWithArray: array];

        NSDictionary *cityDic = [dic objectForKey: [sortedArray objectAtIndex: 0]];
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [city objectAtIndex: 0]]];
        [self.picker selectRow: 0 inComponent: CITY_COMPONENT animated: YES];
        [self.picker selectRow: 0 inComponent: DISTRICT_COMPONENT animated: YES];
        [self.picker reloadComponent: CITY_COMPONENT];
        [self.picker reloadComponent: DISTRICT_COMPONENT];
        
    }
    else if (component == CITY_COMPONENT) {
        NSString *provinceIndex = [NSString stringWithFormat: @"%d", [province indexOfObject: selectedProvince]];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: provinceIndex]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *dicKeyArray = [dic allKeys];
        NSArray *sortedArray = [dicKeyArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [sortedArray objectAtIndex: row]]];
        NSArray *cityKeyArray = [cityDic allKeys];
        
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [cityKeyArray objectAtIndex:0]]];
        [self.picker selectRow: 0 inComponent: DISTRICT_COMPONENT animated: YES];
        [self.picker reloadComponent: DISTRICT_COMPONENT];
    }
    
}


//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//    if (component == PROVINCE_COMPONENT) {
//        return 80;
//    }
//    else if (component == CITY_COMPONENT) {
//        return 100;
//    }
//    else {
//        return 115;
//    }
//}
//
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    UILabel *myView = nil;
//    CGRect frameScreen=[UIScreen mainScreen].applicationFrame ;
//    if (component == PROVINCE_COMPONENT) {
//        
////        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frameScreen.size.width/3, 30)];
//        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
//        myView.textAlignment = UITextAlignmentCenter;
//        myView.text = [province objectAtIndex:row];
//        myView.font = [UIFont systemFontOfSize:14];
//        myView.backgroundColor = [UIColor clearColor];
//    }
//    else if (component == CITY_COMPONENT) {
//        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 95, 30)] ;
//        myView.textAlignment = UITextAlignmentCenter;
//        myView.text = [city objectAtIndex:row];
//        myView.font = [UIFont systemFontOfSize:14];
//        myView.backgroundColor = [UIColor clearColor];
//    }
//    else {
//        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 110, 30)];
//        myView.textAlignment = UITextAlignmentCenter;
//        myView.text = [district objectAtIndex:row];
//        myView.font = [UIFont systemFontOfSize:14];
//        myView.backgroundColor = [UIColor clearColor];
//    }
//    
//    return myView;
//}
//






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
