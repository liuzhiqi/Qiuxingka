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
#import "QXKGeneral.h"
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
    
    
    searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(50, 20, 170, 44)];
    searchBar.delegate=self;
    searchBar.placeholder=@"Search";
    
    UIColor *color = [UIColor redColor];
//    searchBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: [UIColor QXKGreenLight]}];
    
    
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
    
    
    QXKMessageButton *btn=[[QXKMessageButton alloc] initWithFrame:CGRectMake(15, 0, 22, 22)];
    [btn setImage:[UIImage imageNamed:@"消息图标"] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:@"收藏 有阴影按下"] forState:UIControlStateHighlighted];
    UIView*viewR=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 37, 22)];
    [viewR addSubview:btn];
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc] initWithCustomView:viewR];
    
    
    
    self.navigationItem.rightBarButtonItem=btnItem;
    
    QXKMessageButton *btnF=[[QXKMessageButton alloc] initWithFrame:CGRectMake(0, 0, 37, 22)];
  
    UIBarButtonItem *btnItemF=[[UIBarButtonItem alloc] initWithCustomView:btnF];
    self.navigationItem.leftBarButtonItem=btnItemF;
    self.navigationItem.titleView=searchBar;

    UITabBar *tabbar = self.tabBar;
    
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    
    UITabBarItem *item4 = [tabbar.items objectAtIndex:3];
    
    NSArray*arr= tabbar.items;
    
    
    item1.selectedImage = [[UIImage imageNamed:@"首页icon green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item1.image = [[UIImage imageNamed:@"首页icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"出卡icon-green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.image = [[UIImage imageNamed:@"出卡icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.selectedImage = [[UIImage imageNamed:@"资料icon-green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.image = [[UIImage imageNamed:@"资料icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item4.selectedImage = [[UIImage imageNamed:@"我的icon green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item4.image = [[UIImage imageNamed:@"我的icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    
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
