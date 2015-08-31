//
//  QXKEditOrderViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKEditOrderViewController.h"
#import "QXKOrderGoodsInfoTableViewCell.h"
#import "QXKOrderSelectCardNumTableViewCell.h"
#import "QXKAddressInfoTableViewCell.h"
#import "QXKOrderSellerInfoTableViewCell.h"
#import "QXKOrderPriceTableViewCell.h"
#import "QXKGeneral.h"
#import "QXKAddressSelectViewController.h"
@interface QXKEditOrderViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,QXKAddressSelectDelegate,QXKOrderSelectCardNumTableViewCellDelegate>{
    NSMutableDictionary*mdicAddress;
    NSInteger numOfBuy;
}
@property (weak, nonatomic) IBOutlet UILabel *labelTotalPrice;

@property (weak, nonatomic) IBOutlet UIButton *buttonPay;

@end

@implementation QXKEditOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    mdicAddress=[[NSMutableDictionary alloc]init];
    
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderGoodsInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSelectCardNumTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSelectCardNumTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKAddressInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKAddressInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderSellerInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderSellerInfoTableViewCell"];
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKOrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKOrderPriceTableViewCell"];
    
    
    self.buttonPay.layer.cornerRadius=6;
    self.labelTotalPrice.text=[NSString stringWithFormat:@"合计：¥%@",@"132"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableViewMain reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            return 100;
            
        }
            break;
        case 1:
        {
            return 80;
        }
            break;
        case 2:
        {

            return 120;
            
        }
            break;
        case 3:
        {
           
            return 44;
            
        }
            break;
        case 4:
        {

            return 44;
            
        }
            break;
            
        default:
            break;
    }
    
    
    

    return 1;
    

    
}




-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            QXKAddressInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKAddressInfoTableViewCell"];
            if (mdicAddress!=nil) {
                [cell setCellDataWithName:[mdicAddress objectForKey:@"name"] Number:[mdicAddress objectForKey:@"phone"] Address:[mdicAddress objectForKey:@"address"]];
            }else{
                [cell setCellDataWithName:@"tuotuo酱" Number:@"13291876886" Address:@"浙江省杭州市西湖区三墩镇浙江大学紫金港校区蒙民伟楼308室"];
            }
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
        case 1:
        {
            QXKOrderSellerInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderSellerInfoTableViewCell"];
            [cell setCellDataWithName:[self.dicSellerInfo objectForKey:@"username"] Number:[self.dicSellerInfo objectForKey:@"telephone"]];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 2:
        {
            QXKOrderGoodsInfoTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderGoodsInfoTableViewCell"];
            
            
            
            [self.dicPreInfo objectForKey:@"username"];
            NSString* pictures=[self.dicPreInfo objectForKey:@"pictures"];
            NSArray *array = [pictures componentsSeparatedByString:@","];
            [cell setCellDataWithName:[self.dicPreInfo objectForKey:@"title"]  Number:[self.dicPreInfo objectForKey:@"amount"] Description:[self.dicPreInfo objectForKey:@"describes"] Price:[self.dicPreInfo objectForKey:@"price"] ProfileURL:[array objectAtIndex:0]];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;

        }
            break;
        case 3:
        {
            QXKOrderSelectCardNumTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderSelectCardNumTableViewCell"];
            cell.delegate=self;
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
        case 4:
        {
            QXKOrderPriceTableViewCell* cell =[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKOrderPriceTableViewCell"];
            [cell setCellDataWithTotalPrice:nil TransExpense:@"12"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    UITableViewCell* cell=[[UITableViewCell alloc]init];
    
    
    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        QXKAddressSelectViewController* pushView=[[QXKAddressSelectViewController alloc]init];
        pushView.delegate=self;
        [self.navigationController pushViewController:pushView animated:YES ];
    
    }
    
}


- (IBAction)btnPushPay:(id)sender {
    
    
    
    
    
    QXKUserInfo* usrInfo=[QXKUserInfo shareUserInfo];
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/order/checkOrder"];
    
    NSString*userid=usrInfo.userId ;
    NSDictionary *parameters;
    if (mdicAddress==nil) {
        [MBProgressHUD showHubWithTitle:@"缺少默认地址接口请进入进行选择" type:0 deleController:self];
        return;
    }
    parameters = @{@"cardid":[self.dicPreInfo objectForKey:@"cardid"],@"cardnum":[NSNumber numberWithInt:numOfBuy],@"seller":[self.dicSellerInfo objectForKey:@"userid"],@"buyer":userid,@"card_price":@"12",@"logistic_price":@"20",@"addrid":[mdicAddress objectForKey:@"addressId"]};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSArray* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:kNilOptions
                                                         error:&error];
        
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
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"确认支付" message:@"您的总价为%ld\n是否确认支付?\n将跳转到支付宝进行付款" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.tag=1;
    alertView.delegate=self;
    //        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alertView show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    
}
-(void)addressSelectWithName:(NSString *)name phone:(NSString *)phone address:(NSString *)address addressId:(NSString *)addressId{
    
    mdicAddress=[[NSMutableDictionary alloc] initWithObjects:@[name,phone,address,addressId] forKeys:@[@"name",@"phone",@"address",@"addressId"]];
    [self.tableViewMain reloadData];
    
    
}
-(void)orderSelectCardNumTableViewCellWithNum:(NSInteger)num{
    numOfBuy=num;
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
