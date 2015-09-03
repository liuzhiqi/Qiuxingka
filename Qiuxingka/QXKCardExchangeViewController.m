//
//  QXKCardExchangeViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/9/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardExchangeViewController.h"
#import "MSImagePickerController.h"
#import "AGIPCToolbarItem.h"
#import "AGImagePickerController.h"
#import "QXKGeneral.h"

#define QXKCardExchangePlaceHolder @"描述我的卡片"

@interface QXKCardExchangeViewController ()<UIActionSheetDelegate,MSImagePickerDelegate, UIImagePickerControllerDelegate>
{
    AGImagePickerController *imagePickerController;
    
    NSInteger IdxCurrentBtn;
    BOOL isCheck;
    bool isShowPlaceHolder;
}

@end

@implementation QXKCardExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;
    //    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    self.selectedPhotos=[[NSMutableArray alloc] init];
    IdxCurrentBtn=-1;
    for (int i=0; i<self.arrayButton.count; i++) {
        ((UIButton*) self.arrayButton[i]).hidden=YES;
    }
    isCheck=NO;
    self.viewVBG.layer.borderColor=[[UIColor QXKGreenLight]CGColor];
    self.viewVBG.layer.borderWidth=1;
    
    isShowPlaceHolder=YES;
    [self textView:self.textViewDescription setPlaceHolder:QXKCardExchangePlaceHolder];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    if(self.selectedPhotos.count>2){
        self.buttonAdd.hidden=YES;
        return;
        
    }
    CGRect frame=((UIButton*) self.arrayButton[self.selectedPhotos.count]).frame;
    self.constraintW.constant=frame.origin.x ;
    
    
    
    
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
//        [UIView beginAnimations:@"animation" context:nil];
//        [UIView setAnimationDuration:0.5f];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        
//        
//        CGRect frame=self.view.frame;
//        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y-50, frame.size.width, frame.size.height   );
//        
//        [UIView commitAnimations];
    
        
  
        
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    

//        [UIView beginAnimations:@"animation" context:nil];
//        [UIView setAnimationDuration:0.5f];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        
//        
//        
//        CGRect frame=self.view.frame;
//        self.view.frame=CGRectMake(frame.origin.x, frame.origin.y+50, frame.size.width, frame.size.height   );
//        [UIView commitAnimations];
//        
    
        if (textView.text.length!=0) {
            return;
        }
        [self textView:textView setPlaceHolder:QXKCardExchangePlaceHolder];
        isShowPlaceHolder=YES;

    
}




- (IBAction)pushTest:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"移除当前照片"
                                  otherButtonTitles:@"拍照",@"从手机相册选取",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag=((UIButton*)sender).tag;
    [actionSheet showInView:self.view];
    
    
    
    
}


- (IBAction)btnPushAddPic:(id)sender {
    
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"从手机相册选取",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag=-1;
    [actionSheet showInView:self.view];

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    IdxCurrentBtn=actionSheet.tag;
    if (actionSheet.tag<0) {
        if (buttonIndex == 0) {
            
            
            UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
            IdxCurrentBtn=-1;
            imagePicker.delegate=self;
            //    imagePicker.view.frame=s
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
                
            }
            // imagePicker.allowsEditing=YES;
            //    [self.view addSubview:imagePicker.view];
            [self presentViewController:imagePicker animated:YES completion:^{
                
            }];
            
            
        }else if (buttonIndex == 1) {
            MSImagePickerController* picker = [[MSImagePickerController alloc] init];
            picker.maxPicNum=3-self.selectedPhotos.count;
            IdxCurrentBtn=-1;
            picker.msDelegate = self;
            [self presentViewController:picker animated:true completion:^{
                NSLog(@"asd");
            }];
        }
        
        
    }else{
        
        
        if (buttonIndex == 1) {
            
            UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
            IdxCurrentBtn=actionSheet.tag;
            imagePicker.delegate=self;
            //    imagePicker.view.frame=s
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
                
            }
            // imagePicker.allowsEditing=YES;
            //    [self.view addSubview:imagePicker.view];
            [self presentViewController:imagePicker animated:YES completion:^{
                NSLog(@"asd");
            }];
            
            
        }else if (buttonIndex == 2) {
            MSImagePickerController* picker = [[MSImagePickerController alloc] init];
            picker.msDelegate = self;
            
            
            picker.maxPicNum=1;
            [self presentViewController:picker animated:true completion:nil];
        }else if(buttonIndex == 0) {
            [self.selectedPhotos removeObjectAtIndex:actionSheet.tag];
            
            [self updateButtonsImage];
            
            
        }
    }
    
}




-(void)updateButtonsImage{
    
    for (int i=0; i<self.arrayButton.count; i++) {
        
        if (i<self.selectedPhotos.count) {
            UIImage* img=self.selectedPhotos[i];
            CGSize size=img.size;
            [((UIButton*) self.arrayButton[i]) setBackgroundImage:img forState:UIControlStateNormal];
            //            //          UIImage* img=[UIImage imageWithCGImage:set.aspectRatioThumbnail];
            //            [((UIButton*) self.arrayButton[i]) setImage:img forState:UIControlStateNormal];
            //
            //            [((UIButton*) self.arrayButton[i]) setImage:img forState:UIControlStateApplication];
            //
            //            [((UIButton*) self.arrayButton[i]) setImage:img forState:UIControlStateReserved];
            //
            //            [((UIButton*) self.arrayButton[i]) setImage:img forState:UIControlStateSelected];
            ((UIButton*) self.arrayButton[i]).hidden=NO;
            
        }else{
            
            ((UIButton*) self.arrayButton[i]).hidden=YES;
        }
        
    }
    
    if (self.selectedPhotos.count<self.arrayButton.count) {
        self.buttonAdd.hidden=NO;
        
        CGRect frame=((UIButton*) self.arrayButton[self.selectedPhotos.count]).frame;
        self.constraintW.constant=frame.origin.x ;
    }else{
        self.buttonAdd.hidden=YES;
    }
    
    
    
}


- (void)imagePickerController:(MSImagePickerController *)picker didFinishPickingImage:(NSArray *)images{
    
    
    if (IdxCurrentBtn==-1) {
        
        [self.selectedPhotos addObjectsFromArray: images];
        
    }else{
        
        [self.selectedPhotos replaceObjectAtIndex:IdxCurrentBtn withObject:images[0]];
        
        
        
    }
    
    
    
    
    
    [picker dismissViewControllerAnimated:true completion:^{
        ;
    }];
    
    [self updateButtonsImage];
    
}


- (void)imagePickerControllerDidCancel:(MSImagePickerController *)picker {
    [picker dismissViewControllerAnimated:true completion:nil];
    NSLog(@"do cancel");
}




- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
    
    
    if (IdxCurrentBtn==-1) {
        [self.selectedPhotos addObject:image];
        
        
    }else{
        
        [self.selectedPhotos replaceObjectAtIndex:IdxCurrentBtn withObject:image];
        
        
        
    }
    
    
    [self updateButtonsImage];
    
}





- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@",info);
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    if (IdxCurrentBtn==-1) {
        [self.selectedPhotos addObject:image];
        
        
    }else{
        
        [self.selectedPhotos replaceObjectAtIndex:IdxCurrentBtn withObject:image];
        
        
        
    }
    
    [self updateButtonsImage];
}

- (IBAction)btnPushNotice:(id)sender {
}

- (IBAction)btnPushCheck:(id)sender {
    
    isCheck=!isCheck;
    if (isCheck) {
        [self.btnCheck setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    }else
        [self.btnCheck setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    
    
    
}

- (IBAction)btnPushEnter:(id)sender {

    
        
        
        
    QXKUserInfo* userInfo= [QXKUserInfo shareUserInfo];
        
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/exchange"];
    NSDictionary*dic=self.dicPreInfo;
    NSString* pictures=[self.dicPreInfo objectForKey:@"pictures"];
    NSArray *array = [pictures componentsSeparatedByString:@","];
    

    
        NSDictionary *parameters = @{@"buserid":userInfo.userId,@"suserid":[self.dicPreInfo objectForKey:@"owner"],@"scardid":[self.dicPreInfo objectForKey:@"cardid"],@"card_name":[self.dicPreInfo objectForKey:@"title"],@"card_pic":[self.dicPreInfo objectForKey:@"pictures"],@"card_desc":[self.dicPreInfo objectForKey:@"describes"],@"describes":self.textViewDescription.text};
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [manager POST:postUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {

            for (int i = 0; i<self.selectedPhotos.count; i++) {
                UIImage *uploadImage = self.selectedPhotos[i];
                
                NSData *imageData = UIImageJPEGRepresentation(uploadImage,0.5);

                [formData appendPartWithFileData:imageData name:@"imgs" fileName:[NSString stringWithFormat:@"参数%d.jpg",i+1]  mimeType:@"image/jpg"];
            }
            
            
            
            
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            
            NSError* error;
            NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:kNilOptions
                                                                  error:&error];
            if ([dic objectForKey:@"success"]!=nil)
            {
                [MBProgressHUD showHubWithTitle:@"提交换卡申请成功，等待卖家审核" type:1 deleController:self];
                [self performSelector:@selector(popView) withObject:nil afterDelay:2];
               
            }
//
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [MBProgressHUD showHubWithTitle:@"头像上传失败" type:0 deleController:self];
            
            NSLog ( @"operation: %@" , operation. responseString );
            
            NSLog(@"Error: %@", error);
            
        }];
        
        
        
        
    
    

    
}







-(void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
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
