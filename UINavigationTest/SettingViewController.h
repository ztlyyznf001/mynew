//
//  SettingViewController.h
//  UINavigationTest
//
//  Created by 赵天立 on 15/9/10.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import <UIKit/UIKit.h>
//@protocol ColorSelectedDelegate <NSObject>
//-(void)reloadData;
//@end
@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UISwitch *sw;
@property (nonatomic) NSString *isButtonOn;
@property (nonatomic,strong) UITableView *tableview;
//@property (nonatomic, retain) id <ColorSelectedDelegate> delegate;
@end
