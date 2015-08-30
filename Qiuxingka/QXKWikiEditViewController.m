//
//  QXKWikiEditViewController.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/7/10.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKWikiEditViewController.h"
const CGFloat heightText=400;
@interface QXKWikiEditViewController ()<UITextViewDelegate ,UIScrollViewDelegate>
{
  
}
@end

@implementation QXKWikiEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
    self.textViewEdit.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    self.textViewEdit.layer.borderWidth=1;
    self.textViewEdit.delegate=self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"1");
    [scrollView resignFirstResponder];
    
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSRange cursorPosition = [textView selectedRange];
    NSInteger index = cursorPosition.location;
    NSString* str=textView.text;
    
    
    
    UIFont *font = textView.font;
    // 根据字体得到NSString的尺寸
    CGRect frameScreen=[UIScreen mainScreen ].applicationFrame;
    CGFloat contentW=frameScreen.size.width-40;
    CGRect rectLabel = [textView.text boundingRectWithSize:CGSizeMake(contentW, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil] context:nil];
    CGFloat labelNameH = rectLabel.size.height;
    
    CGFloat currentOffsetY=textView.contentOffset.y ;
    
   textView.contentOffset=CGPointMake(0, (labelNameH)>111.5?labelNameH-111.5:currentOffsetY) ;
    
    
    
    NSLog(@"%f %f",labelNameH,textView.contentOffset.y );

    
    return YES;
    
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
