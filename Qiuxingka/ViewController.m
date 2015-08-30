//
//  ViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/14.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "ViewController.h"
#import "QXKCardListAfterSearchViewController.h"
#import "QXKMessageButton.h"
@interface ViewController ()<UITabBarControllerDelegate,UISearchBarDelegate>
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
    searchBar.delegate=self;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], UITextAttributeTextColor,
                                                                     [UIColor whiteColor], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     nil]];
    //设定返回按钮
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@""  style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:97.0/255 green:147.0/255.0 blue:52.0/255.0 alpha:100];
    
    
    QXKMessageButton *btn=[[QXKMessageButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
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
-(void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarResultsListButtonClicked");
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"searchBarTextDidEndEditing");

}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarSearchButtonClicked");
    QXKCardListAfterSearchViewController*pushView=[[QXKCardListAfterSearchViewController alloc]init];
    
    [self.navigationController pushViewController:pushView animated:YES];
}

@end
