//
//  QXKSellOtherInfoViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKSellOtherInfoViewController.h"
#import "QXKSellCardInfoViewController.h"
@interface QXKSellOtherInfoViewController ()<LMComBoxViewDelegate,UITextFieldDelegate>
{
    BOOL needChange;
    BOOL isInitCombox;
}
@end

@implementation QXKSellOtherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    [self upDateButtonNeedChange];
    
    
    isInitCombox=NO;
    
    NSArray * arrayCBType=[NSArray arrayWithObjects:@"足球卡",@"篮球卡卡",@"其他卡",nil];
    NSArray * arrayCBBrand=[NSArray arrayWithObjects:@"Topps",@"Panini",@"Futera",nil];
    
    
    
    
    self.comBoxCadBrand.backgroundColor = [UIColor whiteColor];
    self.comBoxCadBrand.arrowImgName = @"down_dark.png";
    
    self.comBoxCadBrand.titlesList =[NSMutableArray arrayWithArray:arrayCBBrand] ;
    self.comBoxCadBrand.delegate = self;
    self.comBoxCadBrand.supView = self.view;
    
    
    self.comBoxCardTyoe.backgroundColor = [UIColor whiteColor];
    self.comBoxCardTyoe.arrowImgName = @"down_dark.png";
    
    self.comBoxCardTyoe.titlesList =[NSMutableArray arrayWithArray:arrayCBType] ;
    self.comBoxCardTyoe.delegate = self;
    self.comBoxCardTyoe.supView = self.view;
    
    self.textFieldCardNum.layer.borderColor=[kBorderColor CGColor];
    self.textFieldCardNum.layer.borderWidth=1;
    self.textFieldPrice.layer.borderColor=[kBorderColor CGColor];
    self.textFieldPrice.layer.borderWidth=1;
    
    self.textFieldCardNum.delegate=self;
    self.textFieldPrice.delegate=self;
    
    
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
//   CGRect frame= self.comBoxCardTyoe.frame;
//
//    NSLog(@"%d,%d",frame.size.height,frame.size.width);
//    
//    [self.comBoxCadBrand defaultSettings];
//    
//    
//    [self.comBoxCardTyoe defaultSettings];
    
    
}
-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
//    CGRect frame= self.comBoxCardTyoe.frame;
//    
//    NSLog(@"%d,%d",frame.size.height,frame.size.width);
//    
//    [self.comBoxCadBrand defaultSettings];
//    
//    
//        [self.comBoxCardTyoe defaultSettings];
    
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (isInitCombox) {
        return;
    }
    
    CGRect frame= self.comBoxCardTyoe.frame;
    
    NSLog(@"%d,%d",frame.size.height,frame.size.width);
    
    [self.comBoxCadBrand defaultSettings];
    
    
    [self.comBoxCardTyoe defaultSettings];
    
    isInitCombox=YES;
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
//    if (isInitCombox) {
//        return;
//    }
//    
//    CGRect frame= self.comBoxCardTyoe.frame;
//    
//    NSLog(@"%d,%d",frame.size.height,frame.size.width);
//    
//    [self.comBoxCadBrand defaultSettings];
//    
//    
//    [self.comBoxCardTyoe defaultSettings];
//    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPushLast:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)btnPushNext:(id)sender {
    QXKSellCardInfoViewController           *pushView=[[QXKSellCardInfoViewController alloc]init];
    pushView.needChange=needChange;
    
    [self.navigationController pushViewController:pushView animated:YES  ];
    
}

- (IBAction)btnPushNeedChange:(id)sender {
    needChange=YES;
    [self upDateButtonNeedChange];
}

- (IBAction)btnPushNotNeedChange:(id)sender {
    needChange=NO;
    [self upDateButtonNeedChange];
}

-(void)upDateButtonNeedChange{
    
    if (needChange) {
        [self.buttonNeedChange setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
        [self.buttonNotNeedChange setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    }else{
        
        [self.buttonNotNeedChange setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
        [self.buttonNeedChange setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
        
    }
    
    
    
    
    
}



-(void)selectAtIndex:(int)index inCombox:(LMComBoxView *)_combox{
    
    
}

- (IBAction)btnPushHideKeyBoard:(id)sender {
    
    [self.textFieldCardNum resignFirstResponder];
    [self.textFieldPrice resignFirstResponder];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   // NSInteger idx=textField.tag;
    
    return YES;
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
