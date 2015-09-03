//
//  QXKMessageExchangeRefuseViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/3.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKMessageExchangeRefuseViewController.h"
#import "QXKGeneral.h"
@interface QXKMessageExchangeRefuseViewController ()
{
    NSString* placeHolder;
    bool isShowPlaceHolder;

}
@end

@implementation QXKMessageExchangeRefuseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;
    //    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;

    self.textViewMain.layer.borderColor=[[UIColor QXKGreenLight] CGColor];
    self.textViewMain.layer.borderWidth=1;
    placeHolder=@"抱歉，对方拒绝了您的换卡申请";
    isShowPlaceHolder=YES;
    self.textViewMain.delegate=self;
    [self textView:self.textViewMain setPlaceHolder:placeHolder];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPushEnter:(id)sender {
    
    
    
}

-(void)textView:(UITextView*)textView setPlaceHolder:(NSString*)placeHolder
{
    textView.text=placeHolder;
    [textView setTextColor:[UIColor lightGrayColor]];
}



-(void)textViewClearPlaceHolder:(UITextView*)textView  {
    textView.text=@"";
    [textView setTextColor:[UIColor blackColor]];
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    if (isShowPlaceHolder) {
        [self textViewClearPlaceHolder:textView];
        isShowPlaceHolder=NO;
    }
       
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text.length!=0) {
        return;
    }
    [self textView:textView setPlaceHolder:placeHolder];
    isShowPlaceHolder=YES;
    
    
}
- (IBAction)btnPushHidenText:(id)sender {
    [self.textViewMain resignFirstResponder];
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
