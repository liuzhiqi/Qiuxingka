//
//  QXKAddNewAddressViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKAddNewAddressViewController.h"   

#define placeHolderAddress @"描述我的卡片"



@interface QXKAddNewAddressViewController ()<UITextFieldDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,QYCityAreaPickerDelegate>{
    NSArray *arrayPlaceHolder;
    NSArray* arrayTextField;
    UITextView * textViewAddress;
    UILabel* labelAddress;
    bool isShowplaceHolder;
//    bool isShowedPicker;
}

@end

@implementation QXKAddNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    arrayPlaceHolder=[NSArray arrayWithObjects:@"收货人姓名",@"手机号码",@"邮政编码", nil];
    arrayTextField=[NSArray arrayWithObjects:[[UITextField alloc]initWithFrame:CGRectMake(25, 0, frameScreen.size.width-50, 44)], [[UITextField alloc]initWithFrame:CGRectMake(25, 0, frameScreen.size.width-50, 44)], [[UITextField alloc]initWithFrame:CGRectMake(25, 0, frameScreen.size.width-50, 44)], nil];
    
    self.areaPicker=[[QYCityAreaPicker alloc]init];
    self.areaPicker.frame=CGRectMake(0, frameScreen.size.height-270, frameScreen.size.width, 270);
    self.areaPicker.hidden=YES;
    [self.view addSubview:self.areaPicker];
    self.areaPicker.delegate=self;
    self.areaPicker.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.areaPicker attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.areaPicker attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.areaPicker attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.areaPicker attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:270]];
    
    
    
    
    textViewAddress=[[UITextView alloc]initWithFrame:CGRectMake(25, 0, frameScreen.size.width-50, 88)];
    textViewAddress.delegate=self;
    isShowplaceHolder=YES;
    
//    isShowedPicker=NO;
    [self textView:textViewAddress setPlaceHolder:placeHolderAddress];
    labelAddress=[[UILabel alloc]initWithFrame:CGRectMake(150, 0, frameScreen.size.width-150, 44)];
    labelAddress.textColor=[UIColor grayColor];
    labelAddress.font=[UIFont systemFontOfSize:13];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    
    UITableViewCell*cell =[[UITableViewCell alloc]init];
    if (indexPath.row<3) {
        UITextField* textfield=arrayTextField[indexPath.row];
        textfield.tag=indexPath.row;
        textfield.delegate=self;
        textfield.placeholder=arrayPlaceHolder[indexPath.row];
        [cell addSubview:textfield];
    }
    if (indexPath.row==3) {
        UILabel* labelAddressTitle=[[UILabel alloc]initWithFrame:CGRectMake(25, 0,100, 44)];
        labelAddressTitle.text=@"省、市、区";
        [cell addSubview:labelAddress];
        [cell addSubview:labelAddressTitle];
        
    }
    if (indexPath.row==4) {
        
        [cell addSubview:textViewAddress ];
    }
    
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==4) {
        return 88;
    }else return 44;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==3) {
        if (self.areaPicker.hidden) {
            self.areaPicker.hidden=NO;
        }
    }
}




-(void)textView:(UITextView*)textView setPlaceHolder:(NSString*)placeHolder
{
    textView.text=placeHolder;
    textView.font=[UIFont systemFontOfSize:15];
    [textView setTextColor:[UIColor lightGrayColor]];
}



-(void)textViewClearPlaceHolder:(UITextView*)textView  {
    textView.text=@"";
    [textView setTextColor:[UIColor blackColor]];
}




- (IBAction)btnPushHideKeyBoard:(id)sender {
//    [self.textViewMycard resignFirstResponder];
//    [self.textViewChange resignFirstResponder];
//    [self.textFieldTitle resignFirstResponder];
    
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//   }




-(void)textViewDidBeginEditing:(UITextView *)textView{

        if (isShowplaceHolder) {
            [self textViewClearPlaceHolder:textView];
            isShowplaceHolder=NO;
        }
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.6f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        
        
        CGRect frame=self.view.frame;
        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y-150, frame.size.width, frame.size.height   );
        [UIView commitAnimations];
        

    
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    

        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        
        
        CGRect frame=self.view.frame;
        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y+150, frame.size.width, frame.size.height   );
        [UIView commitAnimations];
        
        
        if (textView.text.length!=0) {
            return;
        }
        
        isShowplaceHolder=YES;
        [self textView:textView setPlaceHolder:placeHolderAddress];
        
    
    
    
    
    
}



-(void)QYCityAreaPicker:(QYCityAreaPicker *)picker selectArea:(NSString *)area{
    labelAddress.text=area;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
