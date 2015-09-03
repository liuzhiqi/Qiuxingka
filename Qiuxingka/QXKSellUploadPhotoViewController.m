//
//  QXKSellUploadPhotoViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/7.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKSellUploadPhotoViewController.h"
#import "QXKSellOtherInfoViewController.h"
#import "MSImagePickerController.h"
#import "AGIPCToolbarItem.h"
#import "MBProgressHUD.h"
@interface QXKSellUploadPhotoViewController ()<UIActionSheetDelegate,MSImagePickerDelegate, UIImagePickerControllerDelegate>
{
    AGImagePickerController *imagePickerController;
    NSMutableArray* arrayImage;
    NSInteger IdxCurrentBtn;
    
    
}
@property(strong)NSMutableArray* selectedPhotos;
@end

@implementation QXKSellUploadPhotoViewController

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
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if(self.selectedPhotos.count>8){
        self.buttonAdd.hidden=YES;
        return;
        
    }
    CGRect frame=((UIButton*) self.arrayButton[self.selectedPhotos.count]).frame;
    self.constraintH.constant=frame.origin.y;
    self.constraintW.constant=frame.origin.x ;

    
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPushNext:(id)sender {
    QXKSellOtherInfoViewController *pushView=[[QXKSellOtherInfoViewController alloc]init];
    pushView.arrayImages=self.selectedPhotos;
    [self.navigationController pushViewController:pushView animated:YES];
    
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


- (IBAction)btnPushAdd:(id)sender {
   
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
            picker.maxPicNum=9-self.selectedPhotos.count;
            IdxCurrentBtn=-1;
            picker.msDelegate = self;
            [self presentViewController:picker animated:true completion:nil];
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
        self.constraintH.constant=frame.origin.y;
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
