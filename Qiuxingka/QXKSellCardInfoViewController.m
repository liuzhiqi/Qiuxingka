//
//  QXKSellCardInfoViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKSellCardInfoViewController.h"
#import "LMComBoxView.h"
//const NSString* placeHolderChange=@"我想要换什么样的卡";
//const NSString* placeHolderMyCard=@"描述我的卡片";
#import "QXKGeneral.h"
#define placeHolderMyCard @"描述我的卡片"

#define placeHolderChange @"我想要换什么样的卡"

@interface QXKSellCardInfoViewController ()<UITextFieldDelegate,UITextViewDelegate>
{
    bool isShowplaceHolderMycard;
    bool isShowPlaceHolderChange;
}
@end

@implementation QXKSellCardInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    self.textFieldTitle.layer.borderColor=[kBorderColor CGColor];
    self.textFieldTitle.layer.borderWidth=1;
    self.textViewChange.layer.borderColor=[kBorderColor CGColor];
    self.textViewChange.layer.borderWidth=1;
    self.textViewMycard.layer.borderColor=[kBorderColor CGColor];
    self.textViewMycard.layer.borderWidth=1;
    
    self.textViewMycard.delegate=self;
    self.textViewChange.delegate =self;
    isShowplaceHolderMycard=YES;
    isShowPlaceHolderChange=YES;
    [self textView:self.textViewChange setPlaceHolder:placeHolderChange];
    [self textView:self.textViewMycard setPlaceHolder:placeHolderMyCard];
    
    
    
    self.textViewChange.hidden=!self.needChange;
    // Do any additional setup after loading the view from its nib.
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





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPushLast:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnPushNext:(id)sender {
    
    
    
    
    QXKUserInfo* userInfo= [QXKUserInfo shareUserInfo];
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/publish"];
   
    NSDictionary *parameters = @{@"owner":userInfo.userId,@"ownername":userInfo.userName,@"title":self.textFieldTitle.text,@"logistic":@"0",@"longitude":[NSNumber numberWithFloat:userInfo.loaction.y],@"latitude":[NSNumber numberWithFloat:userInfo.loaction.x],@"describes":self.textViewMycard.text,@"exchange_desc":self.textViewChange.text};
    [self.dicPara setValuesForKeysWithDictionary:parameters];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:self.dicPara constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i = 0; i<_arrayImages.count; i++) {
            UIImage *uploadImage = _arrayImages[i];
            
            NSData *imageData = UIImageJPEGRepresentation(uploadImage,0.5);
            
            [formData appendPartWithFileData:imageData name:@"imgs" fileName:[NSString stringWithFormat:@"img%d.jpg",i+1]  mimeType:@"image/jpg"];
        }
        
        
        
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if([dic objectForKey:@"success"]!=nil){
            
             [MBProgressHUD showHubWithTitle:@"头像上传成功" type:1 deleController:self];
            [self performSelector:@selector(finishSellCard) withObject:nil afterDelay:2];
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showHubWithTitle:@"头像上传失败" type:0 deleController:self];
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
    
    
}
-(void)finishSellCard{
    [self.navigationController popToRootViewControllerAnimated:YES];
}



- (IBAction)btnPushHideKeyBoard:(id)sender {
    [self.textViewMycard resignFirstResponder];
    [self.textViewChange resignFirstResponder];
    [self.textFieldTitle resignFirstResponder];
    
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//   }
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if (textView.tag==0) {
        if (isShowplaceHolderMycard) {
            [self textViewClearPlaceHolder:textView];
            isShowplaceHolderMycard=NO;
        }
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        
        CGRect frame=self.view.frame;
        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y-50, frame.size.width, frame.size.height   );
        
        [UIView commitAnimations];
        
        
        
    }else{
        if (isShowPlaceHolderChange) {
            [self textViewClearPlaceHolder:textView];
            isShowPlaceHolderChange=NO;
        }
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.6f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        
        
        CGRect frame=self.view.frame;
        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y-150, frame.size.width, frame.size.height   );
        [UIView commitAnimations];
        
    }
    
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    

    
    if (textView.tag==0) {
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        
        
        CGRect frame=self.view.frame;
        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y+50, frame.size.width, frame.size.height   );
        [UIView commitAnimations];
        
        
        if (textView.text.length!=0) {
            return;
        }
            [self textView:textView setPlaceHolder:placeHolderMyCard];
            isShowplaceHolderMycard=YES;
        
    }else{
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        
        
        CGRect frame=self.view.frame;
        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y+150, frame.size.width, frame.size.height   );
        [UIView commitAnimations];
        
        
        if (textView.text.length!=0) {
            return;
        }
       
            isShowPlaceHolderChange=YES;
            [self textView:textView setPlaceHolder:placeHolderChange];
        
    }
    

    
    
}




-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSInteger idx=textView.tag;
    
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
