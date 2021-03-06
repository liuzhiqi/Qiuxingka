//
//  QXKRegister1ViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/6/15.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKRegister1ViewController.h"
#import "QXKRegister2ViewController.h"
#import "QXKGeneral.h"
@interface QXKRegister1ViewController ()

@end

@implementation QXKRegister1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.navigationController.navigationBar.opaque=YES;
    
    self.textFieldCaptcha.layer.borderWidth=1;
    self.textFieldCaptcha.layer.borderColor=[[UIColor grayColor] CGColor];
    self.textFieldCaptcha.layer.cornerRadius=18;
    self.textFieldPhone.layer.borderWidth=1;
    self.textFieldPhone.layer.borderColor=[[UIColor grayColor] CGColor];
    self.textFieldPhone.layer.cornerRadius=18;
    self.viewComBG.layer.borderWidth=1;
    self.viewComBG.layer.borderColor=[[UIColor grayColor] CGColor];
    self.viewComBG.layer.cornerRadius=18;
    
    
    
    
    NSArray * arrayPhoneNum=[NSArray arrayWithObjects:@"Afghanistan(+93)", @"Albania(+355)",@"Algeria(+213)",@"American Samoa(+1684)",@"Andorra(+376)",@"Angola(+244)",@"Anguilla(+1264)",@"Antarctica(+672)",@"Antigua and Barbuda(+1268)",@"Argentina(+54)",@"Armenia(+374)",@"Aruba(+297)",@"Australia(+61)",@"Austria(+43)",@"Azerbaijan(+994)",@"Bahamas(+1242)",@"Bahrain(+973)",@"Bangladesh(+880)",@"Barbados(+1246)"@"Belarus(+375)",@"Belgium(+32)",@"Belize(+501)",@"Benin(+229)",@"Bermuda(+1441)",@"Bhutan(+975)",@"Bolivia(+591)",@"Bosnia and Herzegovina(+387)",@"Botswana(+267)"@"Brazil(+55)",@"British Virgin Islands(+1284)",@"Brunei(+673)",@"Bulgaria(+359)",@"Burkina Faso(+226)",@"Burma (Myanmar)(+95)",@"Burundi(+257)",@"Cambodia(+855)",@"Cameroon(+237)",@"Canada(+1)",@"Cape Verde(+238)",@"Cayman Islands(+1345)",@"Central African Republic(+236)",@"Chad(+235)",@"Chile(+56)",@"China(+86)",@"Christmas Island(+61)",@"Cocos (Keeling) Islands(+61)",@"Colombia(+57)",@"Comoros(+269)",@"Cook Islands(+682)",@"Costa Rica(+506)",@"Croatia(+385)",@"Cuba(+53)",@"Cyprus(+357)",@"Czech Republic(+420)",@"Democratic Republic of the Congo(+243)",@"Denmark(+45)",@"Djibouti(+253)",@"Dominica(+1767)",@"Dominican Republic(+1809)",@"Ecuador(+593)",@"Egypt(+20)",@"El Salvador(+503)",@"Equatorial Guinea(+240)",@"Eritrea(+291)",@"Estonia(+372)",@"Ethiopia(+251)",@"Falkland Islands(+500)",@"Faroe Islands(+298)",@"Fiji(+679)",@"Finland(+358)",@"France (+33)",@"French Polynesia(+689)",@"Gabon(+241)",@"Gambia(+220)",@"Gaza Strip(+970)",@"Georgia(+995)",@"Germany(+49)",@"Ghana(+233)",@"Gibraltar(+350)",@"Greece(+30)",@"Greenland(+299)",@"Grenada(+1473)",@"Guam(+1671)",@"Guatemala(+502)",@"Guinea(+224)",@"Guinea-Bissau(+245)",@"Guyana(+592)",@"Haiti(+509)",@"Holy See (Vatican City)(+39)",@"Honduras(+504)",@"Hong Kong(+852)",@"Hungary(+36)",@"Iceland(+354)",@"India(+91)",@"Indonesia(+62)",@"Iran(+98)",@"Iraq(+964)",@"Ireland(+353)",@"Isle of Man(+44)",@"Israel(+972)",@"Italy(+39)",@"Ivory Coast(+225)",@"Jamaica(+1876)",@"Japan(+81)",@"Jordan(+962)",@"Kazakhstan(+7)",@"Kenya(+254)",@"Kiribati(+686)",@"Kosovo(+381)",@"Kuwait(+965)",@"Kyrgyzstan(+996)",@"Laos(+856)",@"Latvia(+371)",@"Lebanon(+961)",@"Lesotho(+266)",@"Liberia(+231)",@"Libya(+218)",@"Liechtenstein(+423)",@"Lithuania(+370)",@"Luxembourg(+352)",@"Macau(+853)",@"Macedonia(+389)",@"Madagascar(+261)",@"Malawi(+265)",@"Malaysia(+60)",@"Maldives(+960)",@"Mali(+223)",@"Malta(+356)",@"MarshallIslands(+692)",@"Mauritania(+222)",@"Mauritius(+230)",@"Mayotte(+262)",@"Mexico(+52)",@"Micronesia(+691)",@"Moldova(+373)",@"Monaco(+377)",@"Mongolia(+976)",@"Montenegro(+382)",@"Montserrat(+1664)",@"Morocco(+212)",@"Mozambique(+258)",@"Namibia(+264)",@"Nauru(+674)",@"Nepal(+977)",@"Netherlands(+31)",@"Netherlands Antilles(+599)",@"New Caledonia(+687)",@"New Zealand(+64)",@"Nicaragua(+505)",@"Niger(+227)",@"Nigeria(+234)",@"Niue(+683)",@"Norfolk Island(+672)",@"North Korea (+850)",@"Northern Mariana Islands(+1670)",@"Norway(+47)",@"Oman(+968)",@"Pakistan(+92)",@"Palau(+680)",@"Panama(+507)",@"Papua New Guinea(+675)",@"Paraguay(+595)",@"Peru(+51)",@"Philippines(+63)",@"Pitcairn Islands(+870)",@"Poland(+48)",@"Portugal(+351)",@"Puerto Rico(+1)",@"Qatar(+974)",@"Republic of the Congo(+242)",@"Romania(+40)",@"Russia(+7)",@"Rwanda(+250)",@"Saint Barthelemy(+590)",@"Saint Helena(+290)",@"Saint Kitts and Nevis(+1869)",@"Saint Lucia(+1758)",@"Saint Martin(+1599)",@"Saint Pierre and Miquelon(+508)",@"Saint Vincent and the Grenadines(+1784)",@"Samoa(+685)",@"San Marino(+378)",@"Sao Tome and Principe(+239)",@"Saudi Arabia(+966)",@"Senegal(+221)",@"Serbia(+381)",@"Seychelles(+248)",@"Sierra Leone(+232)",@"Singapore(+65)",@"Slovakia(+421)",@"Slovenia(+386)",@"Solomon Islands(+677)",@"Somalia(+252)",@"South Africa(+27)",@"South Korea(+82)",@"Spain(+34)",@"Sri Lanka(+94)",@"Sudan(+249)",@"Suriname(+597)",@"Swaziland(+268)",@"Sweden(+46)",@"Switzerland(+41)",@"Syria(+963)",@"Taiwan(+886)",@"Tajikistan(+992)",@"Tanzania(+255)",@"Thailand(+66)",@"Timor-Leste(+670)",@"Togo(+228)",@"Tokelau(+690)",@"Tonga(+676)",@"Trinidad and Tobago(+1868)",@"Tunisia(+216)",@"Turkey(+90)",@"Turkmenistan(+993)",@"Turks and Caicos Islands(+1649)",@"Tuvalu(+688)",@"Uganda(+256)",@"Ukraine(+380)",@"United Arab Emirates(+971)",@"United Kingdom(+44)",@"United States(+1)",@"Uruguay(+598)",@"US Virgin Islands(+1340)",@"Uzbekistan(+998)",@"Vanuatu(+678)",@"Venezuela(+58)",@"Vietnam(+84)",@"Wallis and Futuna(+681)",@"West Bank(970)",@"Yemen(+967)",@"Zambia(+260)",@"Zimbabwe(+263)",nil];
    
    
    

    self.comBoxView.backgroundColor = [UIColor whiteColor];
    self.comBoxView.arrowImgName = @"down_dark0.png";

    self.comBoxView.titlesList = arrayPhoneNum;
    self.comBoxView.delegate = self;
    self.comBoxView.supView = self.view;
    [self.comBoxView defaultSettings];


    [self getCaptcha];
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPushnext:(id)sender {
   
    
    
    
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/register/getMsgCap"];
    
    NSDictionary *parameters = @{@"telephone":self.textFieldPhone.text,@"captcha": self.textFieldCaptcha.text};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    //
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    ////    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain; charset=utf-8"];
    //    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    //
//    
//    
//    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        
//        NSError* error;
//        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                            options:kNilOptions
//                                                              error:&error];
//        if ([dic objectForKey:@"sucess"]!=nil)
//        {
//            [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
//            QXKRegister2ViewController* pushVuew=[[QXKRegister2ViewController alloc]init];
//            [self.navigationController pushViewController:pushVuew animated:YES];
//        }
//        else{
//            
//            [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:0 target:self];
//            
//            
//        }
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog ( @"operation: %@" , operation. responseString );
//        
//        NSLog(@"Error: %@", error);
//
//    }];
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&error];
        if ([dic objectForKey:@"success"]!=nil)
        {
            [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
            QXKRegister2ViewController* pushVuew=[[QXKRegister2ViewController alloc]init];
            [self.navigationController pushViewController:pushVuew animated:YES];
        }
        else{
            
            [MBProgressHUD showHubWithTitle:[dic objectForKey:@"error"] type:0 target:self];
            
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
//    
//    [MBProgressHUD showHubWithTitle:@"注册成功" type:1 target:self];
//    QXKRegister2ViewController* pushVuew=[[QXKRegister2ViewController alloc]init];
//    [self.navigationController pushViewController:pushVuew animated:YES];

    
    
}



-(void)getCaptcha{
    
    NSMutableString  *postUrl = [[NSMutableString alloc] initWithString:QXKURL] ;
    [postUrl appendString:@"/register"];
    
    NSDictionary *parameters = @{};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    
    [manager GET:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSError* error;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:kNilOptions
                                                               error:&error];
        [self.buttonCaptcha setTitle:[NSString stringWithFormat:@"%@",[dic objectForKey:@"captcha"] ]forState:UIControlStateNormal];
        
        
        NSLog(@"%@",dic)  ;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
               NSLog ( @"operation: %@" , operation. responseString );
        
        NSLog(@"Error: %@", error);
    }];

    
}


- (IBAction)changeCaptcha:(id)sender {
    [self getCaptcha];
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

