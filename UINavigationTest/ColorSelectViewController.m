//
//  ColorSelectViewController.m
//  UINavigationTest
//
//  Created by ricky on 15/9/11.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import "ColorSelectViewController.h"
#import "ColorSet.h"
@interface ColorSelectViewController ()

@end

@implementation ColorSelectViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *colorSelect = [[UITableView alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height  - 100)];
    colorSelect.delegate = self;
    colorSelect.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:colorSelect];
    [self setExtraCellLineHidden:colorSelect
     ];
    ColorSet *colorSet1 = [[ColorSet alloc]init];
    colorSet1.color = [UIColor blueColor];
    colorSet1.name = @"蓝色";
    ColorSet *colorSet2 = [[ColorSet alloc]init];
    colorSet2.color = [UIColor magentaColor];
    colorSet2.name = @"粉色";
    ColorSet *colorSet3 = [[ColorSet alloc]init];
    colorSet3.color = [UIColor blackColor];
    colorSet3.name = @"黑色";
    ColorSet *colorSet4 = [[ColorSet alloc]init];
    colorSet4.color = [UIColor brownColor];
    colorSet4.name = @"棕色";
    ColorSet *colorSet5 = [[ColorSet alloc]init];
    colorSet5.color = [UIColor greenColor];
    colorSet5.name = @"绿色";
    ColorSet *colorSet6 = [[ColorSet alloc]init];
    colorSet6.color = [UIColor grayColor];
    colorSet6.name = @"灰色";
    ColorSet *colorSet7 = [[ColorSet alloc]init];
    colorSet7.color = [UIColor orangeColor];
    colorSet7.name = @"橙色";
    ColorSet *colorSet8 = [[ColorSet alloc]init];
    colorSet8.color = [UIColor yellowColor];
    colorSet8.name = @"黄色";
    ColorSet *colorSet9 = [[ColorSet alloc]init];
    colorSet9.color = [UIColor purpleColor];
    colorSet9.name = @"紫色";
    ColorSet *colorSet10 = [[ColorSet alloc]init];
    colorSet10.color = [UIColor whiteColor];
    colorSet10.name = @"白色";
    self.colorSets = [NSArray arrayWithObjects:colorSet1,colorSet2,colorSet3,colorSet4,colorSet5,colorSet6,colorSet7,colorSet8,colorSet9, colorSet10,nil];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.colorSets[indexPath.row] name];
    UIView *color = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    color.backgroundColor = [self.colorSets[indexPath.row]color];
    cell.accessoryView = color;
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.navigationController.navigationBar.backgroundColor = [self.colorSets[indexPath.row] color];
    self.ColorSelected = self.colorSets[indexPath.row];
    NSLog(@"%@",self.ColorSelected.name);
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:self.colorSets[indexPath.row]];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"colorSet"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"colorChaged" object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
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
