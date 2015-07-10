//
//  QXKWikiMainViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/9.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiMainViewController.h"
#import "QXKWikiCollectionViewCell.h"
#import "QXKWikiDetailViewController.h"
#import "QXKWikiSearchBar.h"
#define ratioH2W (225/172.0)
@interface QXKWikiMainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    QXKWikiSearchBar *searchBar;
}

@end

@implementation QXKWikiMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    self.collectionMain.delegate=self;
    self.collectionMain.dataSource=self;
    
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"QXKWikiSearchBar"owner:self options:nil];

    searchBar=[nib objectAtIndex:0];
    
    
    [searchBar updateConstraints];
    [self.viewSearchHead addSubview:searchBar];
    searchBar.translatesAutoresizingMaskIntoConstraints=NO;
    self.viewSearchHead .translatesAutoresizingMaskIntoConstraints=NO;
    [self.viewSearchHead  addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.viewSearchHead addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.viewSearchHead addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.viewSearchHead addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    
    
    
    [self.viewSearchHead layoutSubviews];
     [self.collectionMain registerNib:[UINib nibWithNibName:@"QXKWikiCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"QXKWikiCollectionViewCell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QXKWikiCollectionViewCell* cell=[self.collectionMain dequeueReusableCellWithReuseIdentifier:@"QXKWikiCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
    
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect frame=[UIScreen mainScreen].applicationFrame;
    CGFloat weight=(frame.size.width -30 )/2.0;
    CGFloat height=weight *ratioH2W;
    
    
    return CGSizeMake(weight, height);

}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(10, 10, 10, 10);

    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    QXKWikiDetailViewController* pushView=[[QXKWikiDetailViewController alloc]init];
    
    [self.navigationController pushViewController:pushView animated:YES];
    
    
    
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
