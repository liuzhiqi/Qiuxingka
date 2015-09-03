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
#import "QXKWikiFilterView.h"
#import "QXKGeneral.h"
#import "MJRefresh.h"
#define ratioH2W (225/172.0)
@interface QXKWikiMainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MJRefreshBaseViewDelegate,QXKWikiSearchBarDelegate,QXKWikiFilterViewDelegate>
{
    QXKWikiSearchBar *searchBar;
    QXKWikiFilterView *filterView;
    
    MJRefreshHeaderView *_header;
    MJRefreshFooterView *_footer;
    
    
    NSInteger idxBrand;
    NSInteger idxCategory;
    NSInteger countCurrentPage;
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
    searchBar.delegate=self;
    
    self.viewSearchHead .translatesAutoresizingMaskIntoConstraints=NO;
    [self.viewSearchHead  addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.viewSearchHead addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self.viewSearchHead addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self.viewSearchHead addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.viewSearchHead attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.viewSearchHead layoutSubviews];
     [self.collectionMain registerNib:[UINib nibWithNibName:@"QXKWikiCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"QXKWikiCollectionViewCell"];
    
    
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.collectionMain;
    header.delegate = self;
    // 自动刷新
    [header beginRefreshing];
    _header = header;
    
    // 3.2.上拉加载更多
    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
    footer.scrollView = self.collectionMain;
    footer.delegate = self;
    _footer = footer;

    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    
    filterView=[[[NSBundle mainBundle]loadNibNamed:@"QXKWikiFilterView" owner:self options:nil] objectAtIndex:0];
    filterView.frame=CGRectMake(0,  -frameScreen.size.height*0.6, frameScreen.size.width, frameScreen.size.height*0.6);
    filterView.delegate=self;
    [self.view addSubview:filterView];
    
    self.arrayCardInfo=[[NSMutableArray alloc]init];
    idxBrand=-1;
    idxCategory=-1;
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.arrayCardInfo.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QXKWikiCollectionViewCell* cell=[self.collectionMain dequeueReusableCellWithReuseIdentifier:@"QXKWikiCollectionViewCell" forIndexPath:indexPath];
    
    NSString *title=[self.arrayCardInfo[indexPath.row] objectForKey:@"wikiname"];
    NSString *subtitle=[self.arrayCardInfo[indexPath.row] objectForKey:@"english_name"];
    NSString *url=[self.arrayCardInfo[indexPath.row] objectForKey:@"picture"];
    NSString *wikiid=[self.arrayCardInfo[indexPath.row] objectForKey:@"wikiid"];

    [cell setCellDataWithTitle:title subtitle:subtitle url:url cardId:wikiid targetVC:self];
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
    pushView.dicInfo=[self.arrayCardInfo objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:pushView animated:YES];
    
    
    
}




- (void)doneWithView:(MJRefreshBaseView *)refreshView
{
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/wiki/queryList"];
    
    NSString*brand;
    NSString*category;
    
    
    
    NSDictionary *parameters;
    NSArray* arrBrand= @[@"topps",@"panini",@"Futera",@"其他品牌"];
    NSArray* arrCategory=  @[@"足球卡",@"篮球卡",@"其他卡"];
    
    if (idxBrand<0) {
        brand=@"";
    }else{
        brand=arrBrand[idxBrand];
    }
    
    if (idxCategory<0) {
        category=@"";
    }else{
        category=arrCategory[idxCategory];
    }
    
    
    parameters = @{@"category":category,@"brand": brand ,@"offset": [NSNumber numberWithInteger:countCurrentPage] , @"capacity": @"16"};// ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        if ([dic count]!=0)
        {
            NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                           options:kNilOptions
                                                             error:&error];
            
            [self.arrayCardInfo addObjectsFromArray:dic];
            
            
            
            
        }
        else{
            
            countCurrentPage--;
        }

        // 刷新表格
        [self.collectionMain  reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [refreshView endRefreshing];
        
        

        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        countCurrentPage--;
        
        // 刷新表格
        [self.collectionMain  reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [refreshView endRefreshing];
        
        

        
        //        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        //        self.tableViewMain.pullTableIsRefreshing = NO;
        //        self.tableViewMain.pullTableIsLoadingMore = NO;
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
    
    
    
    
    

}

#pragma mark - searchDelegate





#pragma mark - 刷新控件的代理方法
#pragma mark 开始进入刷新状态
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%@----开始进入刷新状态", refreshView.class);
    
    // 1.添加假数据
    
        if ([refreshView isKindOfClass:[MJRefreshHeaderView class]]) {
            
            [self.arrayCardInfo removeAllObjects];
            countCurrentPage=0;
            
            
            ;
        } else {
           countCurrentPage++ ;
        }
    
    
    // 2.2秒后刷新表格UI
    [self performSelector:@selector(doneWithView:) withObject:refreshView afterDelay:2.0];
}

#pragma mark 刷新完毕
- (void)refreshViewEndRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%@----刷新完毕", refreshView.class);
}

#pragma mark 监听刷新状态的改变
- (void)refreshView:(MJRefreshBaseView *)refreshView stateChange:(MJRefreshState)state
{
    switch (state) {
        case MJRefreshStateNormal:
            NSLog(@"%@----切换到：普通状态", refreshView.class);
            break;
            
        case MJRefreshStatePulling:
            NSLog(@"%@----切换到：松开即可刷新的状态", refreshView.class);
            break;
            
        case MJRefreshStateRefreshing:
            NSLog(@"%@----切换到：正在刷新状态", refreshView.class);
            break;
        default:
            break;
    }
}












-(void)loadWikiData
{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/wiki/queryList"];
    
    NSString*brand;
    NSString*category;
    
    
    
    NSDictionary *parameters;
    NSArray* arrBrand= @[@"topps",@"panini",@"Futera",@"其他品牌"];
    NSArray* arrCategory=  @[@"足球卡",@"篮球卡",@"其他卡"];
    
    if (idxBrand<0) {
        brand=@"";
    }else{
        brand=arrBrand[idxBrand];
    }
    
    if (idxCategory<0) {
        category=@"";
    }else{
        category=arrCategory[idxCategory];
    }
    

    parameters = @{@"category":category,@"brand": brand ,@"offset": [NSNumber numberWithInteger:countCurrentPage] , @"capacity": @"16" ,@"order": @"1" ,@"longitude":@"0",@"latitude":@"0"};
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        if ([dic count]!=0)
        {
            NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                           options:kNilOptions
                                                             error:&error];
            
            [self.arrayCardInfo addObjectsFromArray:dic];
            //        }
            //        else{
            //
            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
        else{
            
            countCurrentPage--;
        }
//        
//        self.tableViewMain.pullLastRefreshDate = [NSDate date];
//        self.tableViewMain.pullTableIsRefreshing = NO;
//        self.tableViewMain.pullTableIsLoadingMore = NO;
//        
//        
        [self.collectionMain reloadData];
        
        
        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        countCurrentPage--;
//        self.tableViewMain.pullLastRefreshDate = [NSDate date];
//        self.tableViewMain.pullTableIsRefreshing = NO;
//        self.tableViewMain.pullTableIsLoadingMore = NO;
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    //
    //    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
    //    QXKRegister3ViewController* pushVuew=[[QXKRegister3ViewController alloc]init];
    //    [self.navigationController pushViewController:pushVuew animated:YES];
    //
    
    
    
    
    
    
    

    
    
    
}





-(void)wikiSearchBar:(QXKWikiSearchBar *)searchBarT willShow:(BOOL)isShow{
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    CGRect rectNav = self.navigationController.navigationBar.frame;

    if (isShow) {
        filterView.frame=CGRectMake(0, rectNav.size.height+rectNav.origin.y + searchBarT.frame.size.height, frameScreen.size.width, frameScreen.size.height*0.6);
        
    }else{
        filterView.frame=CGRectMake(0,  -frameScreen.size.height*0.6, frameScreen.size.width, frameScreen.size.height*0.6);
        
    }
    
    
    
}

//
//-(void)wikiFilterView:(QXKWikiFilterView*)filter selectBrandIdx:(NSInteger)index{
//    idxBrand=index;
//    
//    
//}
//
//-(void)wikiFilterView:(QXKWikiFilterView*)filter selectCategoryIdx:(NSInteger)index{
//    idxCategory=index;
//    
//}
-(void)wikiFilterView:(QXKWikiFilterView*)filter selectCategoryIdx:(NSInteger)cindex selectBrandIdx:(NSInteger)bindex{
    
    idxBrand=bindex;
    idxCategory=cindex;
    [self wikiSearchBar:searchBar willShow:NO];
    
    
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
