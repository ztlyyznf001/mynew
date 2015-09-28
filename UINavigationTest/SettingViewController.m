//
//  SettingViewController.m
//  UINavigationTest
//
//  Created by 赵天立 on 15/9/10.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import "SettingViewController.h"
#import "LocalSave.h"
#import "ColorSelectViewController.h"
#import "GestureViewController.h"
#import "GestureVerifyViewController.h"
@interface SettingViewController ()
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width  - 40, 200) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reRoadTableView) name:@"colorChaged" object:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    return 50;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arrayForCell = [[NSArray alloc]initWithObjects:@"是否弹窗",@"设置导航栏颜色",@"设置手势密码", nil];
    static NSString
    *cellIdentifierForFirstRow=@"UITableViewCellIdentifierKey1";
    static NSString
    *cellIdentifierForRowTwo=@"UITableViewCellIdentifierKey2";
    static NSString
    *cellIdentifierForRowThree=@"UITableViewCellIdentifierKey3";
    UITableViewCell *cell;
    if (indexPath.row==0) {
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }else if(indexPath.row == 1){
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForRowTwo];
    }else if(indexPath.row == 2)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifierForRowThree];
    }
    if(!cell){
        if (indexPath.row==0) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
        }else if(indexPath.row == 1){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForRowTwo];
        }else if(indexPath.row == 2){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForRowThree];
        }
    }
    if (indexPath.row == 0) {
        self.sw=[[UISwitch alloc]init];
        [self.sw setOn:getShowAlert()];
        [self.sw addTarget:self action:@selector(switchValueChange) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView=self.sw;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }else if (indexPath.row == 1){
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        //            cell.detailTextLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"colornameselected"];
        NSData *colorData = [[NSUserDefaults standardUserDefaults]objectForKey:@"colorSet"];
        cell.detailTextLabel.text=  [[NSKeyedUnarchiver unarchiveObjectWithData:colorData] name];
    }else if (indexPath.row == 2){
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = arrayForCell[indexPath.row];
    return cell;
    
}
-(void)switchValueChange{
    if (self.sw.on) {
        NSLog(@"是");
    }else {
        NSLog(@"否");
    }
//    _isButtonOn = [NSString stringWithFormat:@"%d",_sw.on];
    saveShowAlertData(self.sw.on);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        NSLog(@"选中了第二行");
        ColorSelectViewController *color = [[ColorSelectViewController alloc]init];
        [self.navigationController pushViewController:color animated:YES];
    }else if (indexPath.row == 2) {
        NSLog(@"选中了第三行");
        GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
        gestureVerifyVc.isToSetNewGesture = YES;
        [self.navigationController pushViewController:gestureVerifyVc animated:YES];
    }
}
- (void) reRoadTableView{
    NSLog(@"reloading");
    NSIndexPath *indexpathneedreload = [NSIndexPath indexPathForRow:1 inSection:0];
    NSArray *indexarray = [NSArray arrayWithObject:indexpathneedreload];
    [self.tableview reloadRowsAtIndexPaths:indexarray withRowAnimation:UITableViewRowAnimationNone];
//    [self.tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
