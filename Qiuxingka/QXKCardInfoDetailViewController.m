//
//  QXKCardInfoDetailViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/31.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKCardInfoDetailViewController.h"
#import "QXKCardInfoTableViewCell.h"
#import "QXKCardCommentTableViewCell.h"
#import "QXKEditOrderViewController.h"
#import "QXKCardExchangeViewController.h"
#import "QXKGeneral.h"
@interface QXKCardInfoDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITextField *textFieldComment;
    UIView* viewTextBG;
    NSInteger selectIdx;
}
@end

@implementation QXKCardInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //data init
    self.arrayCommand=[[NSMutableArray alloc]init];
//    NSDictionary* dic=[[NSDictionary alloc]init];
//    [self.arrayCommand addObject:dic];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardCommentTableViewCell" ];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKCardInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKCardInfoTableViewCell" ];
    [self loadData];
    [self loadSellerData];
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    
    textFieldComment=[[UITextField alloc]initWithFrame:CGRectMake(10, 5, frameScreen.size.width-20, 44)];
    textFieldComment.borderStyle=UITextBorderStyleRoundedRect;
    textFieldComment.delegate=self;
    
    viewTextBG=[[UIView alloc]initWithFrame:CGRectMake(0, frameScreen.size.height+frameScreen.origin.y, frameScreen.size.width, 54)];
    viewTextBG.backgroundColor =[UIColor lightGrayColor];
   
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHide) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
//    UIControl *control1=[[UIControl alloc]init];
//    control1.frame=CGRectMake(0, 0, 320, 300);
//    [self.view addSubview:control1];
//    control1.backgroundColor=[UIColor clearColor];
//    //我们发现虽然control1是后加载的，但是貌似没有遮挡住之前加载的文本框
//    //而且就算我把control1弄到最上面，仍然不遮挡（在低版本中是遮挡的需要调整顺序），奇怪，智能了吗这是？
//    [self.view bringSubviewToFront:control1];
//    [control1 addTarget:self action:@selector(hideKeyboard) forControlEvents:UIControlEventTouchUpInside];
//    
    [viewTextBG addSubview:textFieldComment];
    [self.view addSubview:viewTextBG];
    
    self.buttonCollection.idCard=[self.dicPreInfo objectForKey:@"cardid"];
    self.buttonCollection.viewControllerfather=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)hideKeyboard{
    [textFieldComment resignFirstResponder];
}
//键盘显示的时候，按钮向上跑，不会被遮盖
-(void)keyboardShow{
    [textFieldComment becomeFirstResponder];
   // viewTextBG.frame=CGRectMake(0, 200, viewTextBG.frame.size.width,  viewTextBG.frame.size.height);
    
}
//键盘隐藏是，按钮向下回到原先的位置
//这里面尝试一个动画，和没有动画，直接确定位置是一个效果，差不多
-(void)keyboardHide{
    [UIView animateWithDuration:0.25 animations:^{
        ;
//        ; btn1.frame=CGRectMake(10, 500, 300, 30);
    }completion:^(BOOL finished){
        
    }];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect beginKeyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endKeyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat yOffset = endKeyboardRect.origin.y - beginKeyboardRect.origin.y;
    CGRect inputFieldRect;// = textFieldComment.frame;
    if(yOffset>0){
        
        inputFieldRect=CGRectMake(0, endKeyboardRect.origin.y+viewTextBG.frame.size.height, viewTextBG.frame.size.width, viewTextBG.frame.size.height);
        
    }else{
        inputFieldRect=CGRectMake(0, endKeyboardRect.origin.y-viewTextBG.frame.size.height, viewTextBG.frame.size.width, viewTextBG.frame.size.height);
        
    }

    [UIView animateWithDuration:duration animations:^{
        viewTextBG.frame = inputFieldRect;
        
    }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //取消第一响应者，就是结束输入病隐藏键盘
    [textField resignFirstResponder];
    
    
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/comment/addComment"];
    
    NSString*cardid=[self.dicPreInfo objectForKey:@"cardid"] ;
    NSString*userid=usrInfo.userId ;
    //    NSNumber*commentto=[NSNumber numberWithInteger:textField.tag] ;
    NSNumber*commentto;
    if (selectIdx==-1) {
        commentto=[NSNumber numberWithInteger:0] ;
    }
    else commentto=[NSNumber numberWithInteger:selectIdx] ;
    
    
    NSString*content=textField.text ;
    NSDictionary *parameters;
    
    parameters = @{@"cardid":cardid,@"userid":userid,@"commentto":commentto,@"content":content };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        if ([dic objectForKey:@"success"]!=nil)
        {
           
            [MBProgressHUD showHubWithTitle:@"评论成功" type:1 deleController:self];
            [self loadData];
            
        }
        else{
             [MBProgressHUD showHubWithTitle:@"评论失败,可能您已经被禁言" type:0 deleController:self];
        }
        //        else{
        //
        //            countCurrentPage--;
        //        }
        //
        //        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        //        self.tableViewMain.pullTableIsRefreshing = NO;
        //        self.tableViewMain.pullTableIsLoadingMore = NO;
        //
        //
        [self.tableViewMain reloadData];
        
        
        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //        countCurrentPage--;
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
    
    
    

    
    
    
    
    
    
    return YES;
}





-(void)loadData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/comment/getComment"];
    
    NSString*cardid=[self.dicPreInfo objectForKey:@"cardid"] ;
    
    
    
    NSDictionary *parameters;

    parameters = @{@"cardid":cardid };
    
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
            
            [self.arrayCommand addObjectsFromArray:dic];
            //        }
            //        else{
            //
            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
//        else{
//            
//            countCurrentPage--;
//        }
//        
//        self.tableViewMain.pullLastRefreshDate = [NSDate date];
//        self.tableViewMain.pullTableIsRefreshing = NO;
//        self.tableViewMain.pullTableIsLoadingMore = NO;
//        
//        
        [self.tableViewMain reloadData];
        
        
        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
//        countCurrentPage--;
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

-(void)loadSellerData{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/findUserById"];
    
    
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
#warning WRIONG
    NSString*cardid=usrInfo.userId ;
    
//    NSString*cardid=[self.dicPreInfo objectForKey:@"owner"] ;
    
    
    
    NSDictionary *parameters;
    
    parameters = @{@"userid":cardid };
    
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
            
            self.dicSellerInfo=dic;
            //        }
            //        else{
            //
            //            [MBProgressHUD showHubWithTitle:@"拉取信息出错" type:0 target:self];
            
            
        }
        //        else{
        //
        //            countCurrentPage--;
        //        }
        //
        //        self.tableViewMain.pullLastRefreshDate = [NSDate date];
        //        self.tableViewMain.pullTableIsRefreshing = NO;
        //        self.tableViewMain.pullTableIsLoadingMore = NO;
        //
        //
        [self.tableViewMain reloadData];
        
        
        
        
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //        countCurrentPage--;
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section==0) {
        QXKCardInfoTableViewCell* cell=(QXKCardInfoTableViewCell*)[self tableView:self.tableViewMain cellForRowAtIndexPath:indexPath];
    
    
        return cell.heightCell;
    
    }
    
    QXKCardCommentTableViewCell* cell=(QXKCardCommentTableViewCell*)[self tableView:self.tableViewMain cellForRowAtIndexPath:indexPath];
    return cell.heightCell;

    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 20;
    }
    return 44;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return self.arrayCommand.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        QXKCardInfoTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCardInfoTableViewCell"];
        NSString* pictures=[self.dicPreInfo objectForKey:@"pictures"];
        NSArray *array = [pictures componentsSeparatedByString:@","];
        if(self.dicSellerInfo==nil)
        {
            [ cell setCellDataWithName:@""  AuthorInfo:@"" CardName:[self.dicPreInfo objectForKey:@"title"] CardDiscription:[self.dicPreInfo objectForKey:@"describes"] Price:[self.dicPreInfo objectForKey:@"price"]  IsChangeable:[[self.dicPreInfo  objectForKey:@"exchange"] integerValue]==1  Origin:@"??" Images:array SellerProfile:nil];
        }else{
            NSNumber *buycnt=[self.dicSellerInfo objectForKey:@"buy_cnt"] ;
            NSNumber *sellcnt=[self.dicSellerInfo objectForKey:@"sell_cnt"] ;
            
            [ cell setCellDataWithName:[self.dicSellerInfo objectForKey:@"username"]  AuthorInfo:[NSString stringWithFormat:@"购入%@张,售出%@张",buycnt,sellcnt] CardName:[self.dicPreInfo objectForKey:@"title"] CardDiscription:[self.dicPreInfo objectForKey:@"describes"] Price:[self.dicPreInfo objectForKey:@"price"]  IsChangeable:[[self.dicPreInfo  objectForKey:@"exchange"] integerValue]==1  Origin:@"??" Images:array SellerProfile:[self.dicSellerInfo objectForKey:@"portrait"]];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    QXKCardCommentTableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKCardCommentTableViewCell"];
    [cell setCellDataWithName:@"没给名字" Comment:[self.arrayCommand[indexPath.row] objectForKey:@"content"] ProfileUrl:@""];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [textFieldComment resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        [textFieldComment resignFirstResponder];
    }
    else{
        [textFieldComment becomeFirstResponder];
        selectIdx=indexPath.row;
        
        
        
        
        
    }
    
    
    
    
    

}

- (IBAction)btnPushBuy:(id)sender {
    QXKEditOrderViewController* pushView=[[QXKEditOrderViewController alloc]init];
    pushView.dicDetail=self.dicDetail   ;
    pushView.dicPreInfo=self.dicPreInfo;
    pushView.dicSellerInfo=self.dicSellerInfo;
    [self.navigationController pushViewController:pushView animated:YES];
}


- (IBAction)btnPushComment:(id)sender {
    selectIdx=-1;
    [self keyboardShow];
}

- (IBAction)btnPushExchange:(id)sender {
    QXKCardExchangeViewController*pushView=[[QXKCardExchangeViewController alloc]init];
    pushView.dicPreInfo=self.dicPreInfo;
    
    
    
    
    
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
