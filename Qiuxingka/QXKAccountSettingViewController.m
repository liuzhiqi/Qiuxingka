//
//  QXKAccountSettingViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/1.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKAccountSettingViewController.h"
#import "QXKTableViewCellStyle1TableViewCell.h"
#import "QXKAddressSelectViewController.h"
@interface QXKAccountSettingViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate       >
{
    NSString*strGender;
    NSString*strNum;
    
}

@end

@implementation QXKAccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;

    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    //tableView init
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    [self.tableViewMain registerNib:[UINib nibWithNibName:@"QXKTableViewCellStyle1TableViewCell" bundle:nil] forCellReuseIdentifier:@"QXKTableViewCellStyle1TableViewCell"];
    
    
    
    strGender=@"男";
    strNum=@"13291876886";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }
    if (section==1) {
        return 2;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section*10+indexPath.row) {
        case 0:
            return 100;
            break;
        case 1:
            return 44;
            break;
        case 2:
            return 44;
            break;
        case 10:
            return 60;
            break;
        case 11:
            return 44;
            break;
            
        default:
            break;
    }
    

    
    return 0;
    
    
}





-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    QXKTableViewCellStyle1TableViewCell* cell=[self.tableViewMain dequeueReusableCellWithIdentifier:@"QXKTableViewCellStyle1TableViewCell"];;
    
    switch (indexPath.section*10+indexPath.row) {
        case 0:
            cell.labelTitle.text=@"修改头像";
            cell.labelSubtitle.hidden=YES;
            cell.imageViewIMG.hidden=NO;
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 1:
            cell.labelTitle.text=@"昵称";
            cell.labelSubtitle.text=@"Tristan";
            
            cell.labelSubtitle.hidden=NO;
            cell.imageViewIMG.hidden=YES;
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 2:
            cell.labelTitle.text=@"性别";
            cell.labelSubtitle.text=strGender;
            cell.labelSubtitle.hidden=NO;
            cell.imageViewIMG.hidden=YES;
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 10:
            
            cell.labelTitle.text=@"默认地址";
            cell.labelSubtitle.text=@"浙江省杭州市西湖区三墩镇浙江大学紫金港校区蒙民伟楼308";
            cell.labelSubtitle.hidden=NO;
            cell.imageViewIMG.hidden=YES;
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 11:
            cell.labelSubtitle.hidden=NO;
            cell.labelTitle.text=@"电话绑定";
            cell.labelSubtitle.text=strNum;
            cell.imageViewIMG.hidden=YES;
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        default:
            break;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    switch (indexPath.section*10+indexPath.row) {
        case 0:
            ;
            
            break;
        case 1:
            ;
            break;
        case 2:
        {
//            UIActionSheet *sheetView=[[UIActionSheet alloc]initWithTitle:@"请选择性别" delegate:self cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:@"女性 Female",@"男性 Male",@"保密 Unknow", nil];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择性别" message:nil preferredStyle: UIAlertControllerStyleActionSheet];

            UIAlertAction *femaleAction =[UIAlertAction actionWithTitle:@"女 Female" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                  strGender=@"女";
                [self.tableViewMain reloadData];
                
            }];
            
            
            UIAlertAction *maleAction = [UIAlertAction actionWithTitle:@"男 Male" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                strGender=@"男";
                [self.tableViewMain reloadData];
                
            }];
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"其他 Other" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                strGender=@"其他";
                [self.tableViewMain reloadData];
                
            }];
            [alertController addAction:femaleAction];
            [alertController addAction:maleAction];
            [alertController addAction:otherAction];
            alertController.view.tintColor=[UIColor blackColor];
            [self presentViewController:alertController animated:YES completion:nil];
            
            
        }break;
        case 10:
        {
            QXKAddressSelectViewController *pushView=[[QXKAddressSelectViewController alloc]init ];
            [self.navigationController pushViewController:pushView animated:YES];
            
        }
            
            break;
        case 11:
        {
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请输入身份证号后四位" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alertView.tag=1;
            alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
            [alertView show];
        }
            
            break;
            
        default:
            break;
    }

    
    
    
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (buttonIndex==0) {
        return;
    }
    
    
    
    UITextField *tf=[alertView textFieldAtIndex:0];
    if (alertView.tag==1) {
        
        UIAlertView* alertView1=[[UIAlertView alloc]initWithTitle:@"回答正确，请输入新手机号" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView1.tag=2;
        alertView1.alertViewStyle=UIAlertViewStylePlainTextInput;
        [alertView1 show];

    }
    if (alertView.tag==2) {
        strNum=tf.text;
        UIAlertView* alertView1=[[UIAlertView alloc]initWithTitle:@"修改成功" message:nil delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
        alertView1.tag=3;
        [alertView1 show];
        [self.tableViewMain reloadData];
        
    }
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
