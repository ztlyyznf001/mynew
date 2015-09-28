//
//  ViewController.h
//  UINavigationTest
//
//  Created by ricky on 15/9/10.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "popview.h"
#define tishiwenzi @"本平台为O2O彩票预约平台，不能保证预约订单出票成功；预约订单发布时代为冻结资金。预约出票成功后扣款，预约出票失败后会退回冻结资金。"
@interface ViewController : UIViewController<ButtonClickedDelegate>
@property (nonatomic,retain) popview *pop;
@property (nonatomic,strong) UIColor *getcolorarray;
@end

