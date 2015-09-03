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
#import "QXKGeneral.h"


@interface QXKAccountSettingViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate,QXKAddressSelectDelegate       >
{
    NSString*strGender;
    NSString*strNum;
    NSString* profileUrl;
}

@property(strong,nonatomic)UIImage*profileImage;
@property(strong,nonatomic)NSData *fileData;
@end

@implementation QXKAccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;

    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    

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

-(void)done{
    
    if (_profileImage==nil) {
        QXKUserInfo* userInfo= [QXKUserInfo shareUserInfo];
        
        profileUrl= userInfo.profileUrl;
        [self updateUserInfo];
        
        return;
        
    }
    
    
    
    
    
    QXKUserInfo* userInfo= [QXKUserInfo shareUserInfo];
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/mycard/updateUserInfo"];
    
    NSDictionary *parameters = @{@"userid":userInfo.userId,@"userid":userInfo.userId,@"username":userInfo.userId,@"gender":userInfo.userId,@"tel":userInfo.userId,@"province":userInfo.userId,@"city":userInfo.userId,@"district":userInfo.userId,@"address":userInfo.userId,@"postcode":userInfo.userId,@"IDCardNo":userInfo.userId};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    UIImage *img=_profileImage;
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:postUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(img,0.5);
        [formData appendPartWithFileData:imageData name:@"imgs" fileName:[NSString stringWithFormat:@"%@.jpg",userInfo.userName] mimeType:@"image/jpeg"];
        
        
        
        
        
        
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([[dic objectForKey:@"returnCode"] isEqual:@"1"]) {
            
            profileUrl=[dic objectForKey:@"imgUrl"] ;
            
            
            [self updateUserInfo];
        }else
        {
            
            [MBProgressHUD showHubWithTitle:@"头像上传失败" type:0 deleController:self];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showHubWithTitle:@"头像上传失败" type:0 deleController:self];
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
    



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
            self.imageViewProfile=cell.imageViewIMG;
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
        {
            
            UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:@"请选择文件来源"
                                          delegate:self
                                          cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:@"照相机",@"相册",nil];
            [actionSheet showInView:self.view];

        }
            
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
            pushView.delegate=self;
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


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex = [%ld]",(long)buttonIndex);
    switch (buttonIndex) {
        case 0://照相机
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            //			[self presentModalViewController:imagePicker animated:YES];
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
            break;
        case 1://摄像机
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //			[self presentModalViewController:imagePicker animated:YES];
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        default:
            break;
    }
}

#pragma mark -
#pragma UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        [self performSelector:@selector(saveImage:)  withObject:img afterDelay:0.5];
    }
    else if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        NSString *videoPath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
        self.fileData = [NSData dataWithContentsOfFile:videoPath];
    }
    //	[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //	[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(UIImage *)image {
    //	NSLog(@"保存头像！");
    //	[userPhotoButton setImage:image forState:UIControlStateNormal];
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
    NSLog(@"imageFile->>%@",imageFilePath);
    success = [fileManager fileExistsAtPath:imageFilePath];
    if(success) {
        success = [fileManager removeItemAtPath:imageFilePath error:&error];
    }
    UIImage *smallImage=image;
    //	UIImage *smallImage=[self scaleFromImage:image toSize:CGSizeMake(300.0f, 300.0f)];//将图片尺寸改为80*80
    //    UIImage *smallImage = [self thumbnailWithImageWithoutScale:image size:CGSizeMake(93, 93)];
    
    [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:imageFilePath atomically:YES];//写入文件
    UIImage *selfPhoto = [UIImage imageWithContentsOfFile:imageFilePath];//读取图片文件
    //	[userPhotoButton setImage:selfPhoto forState:UIControlStateNormal];
    self.profileImage = selfPhoto;
    self.imageViewProfile.image=selfPhoto;
}

// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

-(void)updateUserInfo{
    QXKUserInfo* userInfo= [QXKUserInfo shareUserInfo];
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"user/update.do"];
    
    
    
    NSDictionary *parameters = @{@"isLogin": [NSNumber numberWithInteger:userInfo.isLogin] ,
                                 @"uid": userInfo.userId};
    //
    //        NSDictionary *parameters = @{@"loginName": @"15158072492",
    //                                     @"loginPwd": @"a39b5f5c3998"};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //方法一：
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //注意：默认的Response为json数据
    //    [manager setResponseSerializer:[AFXMLParserResponseSerializer new]];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//使用这个将得到的是NSData
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    //注意：此行不加也可以
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain; charset=utf-8"];
    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    
    
    //SEND YOUR REQUEST
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *dic=[[NSDictionary alloc]initWithDictionary:responseObject];
        if ([[dic objectForKey:@"returnCode"] isEqual:@"1"]) {
            
            [MBProgressHUD showHubWithTitle:@"修改信息成功" type:1 deleController:self];
            
            QXKUserInfo* userInfo= [QXKUserInfo shareUserInfo];
          
            
            
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else
        {
            
            [MBProgressHUD showHubWithTitle:@"信息修改失败" type:0 deleController:self];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
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
