//
//  ViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/14.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>
{
    UISearchBar* searchBar;
    
    UILabel *labelTitle;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.delegate=self;
    
    labelTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    labelTitle.textAlignment=NSTextAlignmentCenter;
    labelTitle.textColor=[UIColor whiteColor];
    
    
    searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(20, 20, 180, 44)];
    
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:124.0/255 green:177/255.0 blue:41/255.0 alpha:100];
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [btn setImage:[UIImage imageNamed:@"消息图标"] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:@"收藏 有阴影按下"] forState:UIControlStateHighlighted];
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=btnItem;
    self.navigationItem.titleView=searchBar;

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSInteger index = tabBarController.selectedIndex;
    NSString *title;
    switch (index) {
        case 0:
        {
            self.navigationItem.titleView=searchBar;
            
        }

            break;
        case 1:
           
            break;
        case 2:
        {
            labelTitle.text=@"卡牌资料";
            self.navigationItem.titleView=labelTitle;
            
            
        }
            
            
            break;
        case 3:
            labelTitle.text=@"我的资料";
            self.navigationItem.titleView=labelTitle;
            
            
            break;
    }
    
    
}


@end
