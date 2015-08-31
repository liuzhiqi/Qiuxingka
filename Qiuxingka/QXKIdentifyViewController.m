//
//  QXKIdentifyViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKIdentifyViewController.h"

@interface QXKIdentifyViewController ()<UIImagePickerControllerDelegate>
{
    NSInteger selectIdx;
}
@end

@implementation QXKIdentifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnPuthAdd:(id)sender {
    UIButton* btn=sender;
    
    UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
    imagePicker.delegate=self;
    //    imagePicker.view.frame=s
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
        
    }
    // imagePicker.allowsEditing=YES;
    //    [self.view addSubview:imagePicker.view];
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
    
    selectIdx=btn.tag;
    
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@",info);
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    if (selectIdx==0) {
        self.imageViewFront.image=image;
        
    }else{
        self.imageViewBack.image=image;
        
        
        
    }
    
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
