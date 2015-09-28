//
//  ViewController.m
//  UINavigationTest
//
//  Created by ricky on 15/9/10.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import "LocalSave.h"
#import "ColorSelectViewController.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) NSMutableArray *redballarray;
@property (nonatomic,strong) NSMutableArray *blueballarray;
@property (nonatomic,strong) UIPickerView *picker;
@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(rightbuttonclick)];
    self.view.backgroundColor = [UIColor whiteColor];
    NSData *myEncodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:@"ColorArray"];
    self.getcolorarray = [NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    NSData *colorData = [[NSUserDefaults standardUserDefaults]objectForKey:@"colorSet"];
    self.navigationController.navigationBar.backgroundColor=  [[NSKeyedUnarchiver unarchiveObjectWithData:colorData] color];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
    _picker= [[UIPickerView alloc] initWithFrame:CGRectMake(20, 40, [UIScreen mainScreen].bounds.size.width - 40, 100)];
    _picker.showsSelectionIndicator = YES;
    _picker.dataSource = self;
    _picker.delegate = self;
    _picker.userInteractionEnabled = NO;
    [self.view addSubview:_picker];
    self.redballarray = [[NSMutableArray alloc] initWithCapacity:0];
    //    NSMutableArray *redballarray =[NSMutableArray array];
    
    for (int i= 1; i<=33; i++) {
        //        [self.redballarray addObject:[NSString stringWithFormat:@"%d", i]];
        [self.redballarray addObject:[@(i) stringValue]];
    }
    NSLog(@"array = %@",self.redballarray);
    //    NSMutableArray *blueballarray =[NSMutableArray array];
    self.blueballarray =[[NSMutableArray alloc]initWithCapacity:0];
    for (int i= 1; i<=16; i++) {
        [self.blueballarray addObject:[@(i) stringValue]];
    }
    NSLog(@"array = %@",self.blueballarray);
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(0, 0, 250, 40);
    [self.label setCenter:CGPointMake(_picker.bounds.origin.x + _picker.bounds.size.width/2, _picker.bounds.origin.y + _picker.bounds.size.height + 100)];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.label.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.label.layer setBorderWidth:0.5];
    [self.view addSubview:_label];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 100, 40)];
    [button setCenter:CGPointMake(_picker.bounds.origin.x + _picker.bounds.size.width/2, _label.frame.origin.y + _label.frame.size.height + 50)];
    [button setTitle:@"开始旋转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:5];
    [button.layer setBorderWidth:0.5];
    [button addTarget:self action:@selector(buttonclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)viewWillAppear:(BOOL)animated{
    BOOL swstatus = getShowAlert();
    if (swstatus) {
        [self.pop setHidden:NO];
        [self.view addSubview:self.pop];
        [self.pop transForm];
    }
}
-(void)rightbuttonclick
{
    NSLog(@"设置");
    SettingViewController *set = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
}
- (popview*)pop{
    if (!_pop) {
        CGRect originbounds = [UIScreen mainScreen].bounds;
        _pop = [[popview alloc]initWithImage:[UIImage imageNamed:@"Image"] contents:tishiwenzi buttonTitle:@"我知道了"];
        CGRectMake(0, 0, originbounds.size.width, originbounds.size.height);
        [_pop setHidden:YES];
        _pop.delegate = self;
    }
    return _pop;
}
-(void)ButtonClicked
{
    [self.pop setHidden:YES];
    [self.pop removeFromSuperview];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 7;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            return self.redballarray.count;
            break;
        case 6:
            return self.blueballarray.count;
            break;
        default:
            return 0;
            break;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            return [self.redballarray objectAtIndex:row] ;
            break;
        case 6:
            return [self.blueballarray objectAtIndex:row];
            break;
        default:
            return  @"";
            break;
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    switch (component) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        {
            if (!pickerLabel){
                pickerLabel = [[UILabel alloc] init];
                pickerLabel.minimumScaleFactor = 8.0;
                pickerLabel.adjustsFontSizeToFitWidth = YES;
                [pickerLabel setTextAlignment:NSTextAlignmentCenter];
                [pickerLabel setTextColor:[UIColor redColor]];
                [pickerLabel setBackgroundColor:[UIColor clearColor]];
                [pickerLabel setFont:[UIFont boldSystemFontOfSize:20]];
            }
            pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
        }
            break;
        case 6:
        {
            if (!pickerLabel){
                pickerLabel = [[UILabel alloc] init];
                pickerLabel.minimumScaleFactor = 8.0;
                pickerLabel.adjustsFontSizeToFitWidth = YES;
                [pickerLabel setTextAlignment:NSTextAlignmentCenter];
                [pickerLabel setTextColor:[UIColor blueColor]];
                [pickerLabel setBackgroundColor:[UIColor clearColor]];
                [pickerLabel setFont:[UIFont boldSystemFontOfSize:20]];
            }
            pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
        }
            break;
            
        default:
            break;
    }
    return pickerLabel;
}
-(NSArray *)randomArray
{
    NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray *startArray =[[NSMutableArray alloc]initWithCapacity:0];
    [startArray addObjectsFromArray:self.redballarray];
    NSInteger m=6;
    for (NSInteger i = 0; i < m; i ++) {
        NSInteger index = arc4random() % (startArray.count - i);
        [resultArray addObject:[startArray objectAtIndex:index]];
        [startArray removeObjectAtIndex:index];
    }
    return resultArray;
    
}
-(void)buttonclicked
{
    NSArray *randomarray = [self randomArray];
    int row1 = [[randomarray objectAtIndex:0]intValue] - 1;
    int row2 = [[randomarray objectAtIndex:1]intValue] - 1;
    int row3 = [[randomarray objectAtIndex:2]intValue] - 1;
    int row4 = [[randomarray objectAtIndex:3]intValue] - 1;
    int row5 = [[randomarray objectAtIndex:4]intValue] - 1;
    int row6 = [[randomarray objectAtIndex:5]intValue] - 1;
    int row7 = arc4random() % 16;
    [self.picker selectRow:row1 inComponent:0 animated:YES];
    [self.picker selectRow:row2 inComponent:1 animated:YES];
    [self.picker selectRow:row3 inComponent:2 animated:YES];
    [self.picker selectRow:row4 inComponent:3 animated:YES];
    [self.picker selectRow:row5 inComponent:4 animated:YES];
    [self.picker selectRow:row6 inComponent:5 animated:YES];
    [self.picker selectRow:row7 inComponent:6 animated:YES];
    _label.text = [NSString stringWithFormat:@"%@ , %@ , %@ , %@ , %@ , %@ , %@ ",[_redballarray objectAtIndex:row1],[_redballarray objectAtIndex:row2],[_redballarray objectAtIndex:row3],[_redballarray objectAtIndex:row4],[_redballarray objectAtIndex:row5],[_redballarray objectAtIndex:row6],[_redballarray objectAtIndex:row7]];
    NSLog(@"%@",_label.text);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
