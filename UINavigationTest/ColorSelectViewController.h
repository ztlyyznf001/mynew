//
//  ColorSelectViewController.h
//  UINavigationTest
//
//  Created by ricky on 15/9/11.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"
#import "ColorSet.h"
@interface ColorSelectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSCoding>
@property (nonatomic) NSArray *colorSets;
@property (nonatomic,strong) ColorSet *ColorSelected;

@end
