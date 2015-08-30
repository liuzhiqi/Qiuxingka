//
//  QXKSearchFilterView.m
//  Qiuxingka
//
//  Created by LiuZhiqi on 15/8/25.
//  Copyright (c) 2015年 Tristan. All rights reserved.
//

#import "QXKSearchFilterView.h"
#import "QXKGeneral.h"
@interface QXKSearchFilterView() {
    CGFloat cellHeight;
}

@end



@implementation QXKSearchFilterView
-(void)awakeFromNib{
    self.tableViewMain.delegate=self;
    self.tableViewMain.dataSource=self;
    self.arraySelectIdx=[NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0], nil];
    
    cellHeight=30;
    self.tableType=0;
    [self setData];
}

-(void)setData{
    self.arrayOrderTitle=[NSMutableArray arrayWithObjects:@"默认排序",@"价格从低到高",@"最新发布", nil];
    self.arrayCityTitle=[NSMutableArray arrayWithObjects:@"全部区域",@"杭州",@"武汉",@"北京",@"天津",@"河北", nil];
    [self.tableViewMain reloadData];
}
-(void)setTableType:(NSInteger)tableType{
    _tableType=tableType;
    [self.tableViewMain reloadData];
}

-(CGFloat)getTableHeight{
    return cellHeight*(self.tableType==0?self.arrayCityTitle.count:self.arrayOrderTitle.count);
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        if (self.tableType==0) {
            return self.arrayCityTitle.count;
        }
    return self.arrayOrderTitle.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[[UITableViewCell alloc]init];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, cellHeight)];
    if (self.tableType==0) {
        label.text=[self.arrayCityTitle objectAtIndex:indexPath.row];
    }else{
        label.text=[self.arrayOrderTitle objectAtIndex:indexPath.row];
    }
    
    UIFont * font=label.font;
    CGSize size = CGSizeMake(2000,30);
    CGSize labelsize = [label.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
   // [label.text boundingRectWithSize:<#(CGSize)#> options:<#(NSStringDrawingOptions)#> attributes:<#(NSDictionary *)#> context:<#(NSStringDrawingContext *)#>];
    label.frame = CGRectMake(label.frame.origin.x   ,(cellHeight- labelsize.height) /2 , labelsize.width, labelsize.height );
//    label.backgroundColor = [UIColor purpleColor];
    label.textColor = [UIColor blackColor];
    if(indexPath.row==0&&self.tableType==0){
        UIImageView* imgView=[[UIImageView alloc]initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width+10, 5, 20, 20)];
        imgView.image=[UIImage imageNamed:@"下一步"];
        imgView.backgroundColor=[UIColor blackColor];
        [cell addSubview:imgView];
    }
    
    if ([self.arraySelectIdx[self.tableType] integerValue]==indexPath.row) {
        label.textColor=[UIColor QXKGreenLight];
    }else{
        label.textColor=[UIColor blackColor];
    }
    [cell addSubview:label];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate searchFilterView:self selectIdx:indexPath.row];
    self.arraySelectIdx[self.tableType];
    [self hideView];
}
-(void)showView{
    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    CGFloat filterHeight=[self getTableHeight];
    self.frame=CGRectMake(0, self.frame.origin.y,frameScreen.size.width, filterHeight);
    
}
-(void)hideView
{

    CGRect frameScreen=[UIScreen mainScreen].applicationFrame;
    self.frame=CGRectMake(0, self.frame.origin.y, frameScreen.size.width, 0);
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
