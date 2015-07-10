//
//  QXKSellViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/8.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKSellViewController.h"
#import "QXKSellUploadPhotoViewController.h"
@interface QXKSellViewController (){
    BOOL isEntered;
}

@end

@implementation QXKSellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isEntered=NO;
        // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    if (isEntered) {
        self.tabBarController.selectedIndex=0;
        ;
    }else{
        QXKSellUploadPhotoViewController* pushView=[[QXKSellUploadPhotoViewController alloc]init];
        [self.navigationController pushViewController:pushView animated:YES];
    
    }
    isEntered=!isEntered;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
