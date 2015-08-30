//
//  QXKWikiSearchBar.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiSearchBar.h"
#import "QXKWikiSearchViewController.h"
@implementation QXKWikiSearchBar
-(void)awakeFromNib{
    
    self.searchBar.layer.cornerRadius=22;
    self.searchBar.backgroundImage=[UIImage alloc];
    self.searchBar.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    self.searchBar.layer.borderWidth=1;
    self.searchBar.delegate=self;
    
    isShow=NO;
    
}
- (IBAction)btnPushSearch:(id)sender {
    
    isShow=!isShow;
    [self.delegate wikiSearchBar:self willShow:!isShow];

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    QXKWikiSearchViewController* pushView=[[QXKWikiSearchViewController  alloc]init];
    
    pushView.strSearchKey=self.searchBar.text;
    id object = [self nextResponder];
    while (![object isKindOfClass:[UIViewController class]] &&
           
           object != nil) {
        
        object = [object nextResponder];
        
    }
    UIViewController *uc=(UIViewController*)object;
    [uc.navigationController pushViewController:pushView animated:YES];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
