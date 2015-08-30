//
//  QXKCardListAfterSearchViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardListAfterSearchViewController.h"
#import "QXKSearchFilterBar.h"
#import "QXKSearchFilterView.h"
#import "QXKCardListTableViewCell.h"    
#import "QXKCardInfoDetailViewController.h"
@interface QXKCardListAfterSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,QXKSearchFilterBarDelegate,QXKSearchFilterViewDelegate,UIGestureRecognizerDelegate>
{

    UISearchBar* searchBar;
    UILabel *labelTitle;
    QXKSearchFilterBar * filterBar;
    QXKSearchFilterView* filterView;
    NSInteger searchType;
    NSInteger searchIdx;
}
@end

@implementation QXKCardListAfterSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [btn setImage:[UIImage imageNamed:@"消息图标"] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:@"收藏 有阴影按下"] forState:UIControlStateHighlighted];
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=btnItem;
    searchType=-1;
    searchIdx=-1;
    searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(20, 20, 180, 44)];
    searchBar.delegate=self ;
    self.navigationItem.titleView=searchBar;

    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardListTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardListTableViewCell"];

    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"QXKSearchFilterBar"owner:self options:nil];
    filterBar = [nib objectAtIndex:0];
    filterBar.frame=CGRectMake(0, 0, frameScreen.size.width, 30);

    filterBar.delegate=self;
    [self.viewHead addSubview:filterBar];
    
    
    //data init
    self.arrayCardInfo=[[NSMutableArray alloc]init];
    NSDictionary* dic=[[NSDictionary alloc]init];
    [self.arrayCardInfo addObject:dic];

    
    nib = [[NSBundle mainBundle]loadNibNamed:@"QXKSearchFilterView"owner:self options:nil];
    filterView=[nib objectAtIndex:0];
    CGFloat filterHeight=[filterView getTableHeight];
    filterView.frame=CGRectMake(0, filterBar.frame.size.height, frameScreen.size.width, filterHeight);
    filterView.delegate=self;
    [self.view addSubview:filterView];
    
   
    
    // Do any additional setup after loading the view from its nib.
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayCardInfo.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKCardListTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCardListTableViewCell"];
    
    
    return cell;
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"???_???");
    [filterBar deSelectAll];
    [filterView hideView];
    self.tableViewMain.alpha=1;
}
-(void)searchFilterBar:(QXKSearchFilterBar *)tabView changeIdx:(NSInteger)idx{
    if (idx<0){
        [filterView hideView];
        self.tableViewMain.alpha=1;
    }
    else{
        filterView.tableType=idx;
        [filterView showView];
        self.tableViewMain.alpha=0.5;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QXKCardInfoDetailViewController* push=[[QXKCardInfoDetailViewController alloc]init];
    [self.navigationController pushViewController:push animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"???_???");
}
-(void)searchFilterView:(QXKSearchFilterView *)searchFilterView selectIdx:(NSInteger)idx{
    searchIdx=idx;
    searchType=searchFilterView.tableType;
    
    self.tableViewMain.alpha=1;
    [filterBar deSelectAll];
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
