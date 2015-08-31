//
//  QXKAddNewAddressViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKAddNewAddressViewController.h"   
#import "QXKGeneral.h"
#define placeHolderAddress @"添加详细地址"



@interface QXKAddNewAddressViewController ()<UITextFieldDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,QYCityAreaPickerDelegate>{
    NSArray *arrayPlaceHolder;
    NSArray* arrayTextField;
    UITextView * textViewAddress;
    UILabel* labelAddress;
    NSString* strName;
    NSString* strPhone;
    NSString* strCode;
    NSString* strAddressDetial;
    NSArray* arrArea;
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
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
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
    textViewAddress.tag=4;
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
-(void)done{
    for (UITextField*textField in arrayTextField) {

        
        [textField resignFirstResponder];
    }
    [textViewAddress resignFirstResponder];
    
    
    
    if ([strName isEqual:@""]){
        [MBProgressHUD showHubWithTitle:@"请填写收件人姓名" type:0 deleController:self];
        return;
    }
    if ([strPhone isEqual:@""]){
        [MBProgressHUD showHubWithTitle:@"请填写收件人联系方式" type:0 deleController:self];
        return;
    }
    if (strCode.length!=6){
        [MBProgressHUD showHubWithTitle:@"请填写六位邮政编码" type:0 deleController:self];
        return;
    }
    if ([strAddressDetial isEqual:@""]){
        [MBProgressHUD showHubWithTitle:@"请填写收件人详细地址" type:0 deleController:self];
        return;
    }
    
    if ([labelAddress.text isEqual:@""]){
        [MBProgressHUD showHubWithTitle:@"请选择收件人地址" type:0 deleController:self];
        return;
    }
    
    

    
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/addNewAddr"];
    
    NSString*userid=usrInfo.userId ;
    NSDictionary *parameters;
    
    parameters = @{@"userid":userid,@"province":arrArea[0],@"city":arrArea[1],@"district":arrArea[2],@"postcode":strCode,@"address":strAddressDetial,@"telephone":strPhone,@"consignee":strName};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        if ([dic objectForKey:@"success"]!=nil) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        
        
        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //        countCurrentPage--;
        //        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        //        self.tableViewMain.pullTableIsRefreshing = NO;
        //        self.tableViewMain.pullTableIsLoadingMore = NO;
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
    

    
    
    
    
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
        for (UITextField*textField in arrayTextField) {
            
            
            [textField resignFirstResponder];
        }
        
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

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
        return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag==0) {
        strName=textField.text;
    }
    if (textField.tag==1) {
        strPhone=textField.text;
    }
    if (textField.tag==2) {
        strCode=textField.text;
    }
    

}

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
             strAddressDetial=textView.text;
            return;
        }
        
        isShowplaceHolder=YES;
        [self textView:textView setPlaceHolder:placeHolderAddress];
    

    
    
    
    
}



-(void)QYCityAreaPicker:(QYCityAreaPicker *)picker selectArea:(NSString *)area{
    labelAddress.text=area;
    arrArea = [area componentsSeparatedByString:@","];

    

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
