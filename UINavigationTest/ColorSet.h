//
//  ColorSet.h
//  UINavigationTest
//
//  Created by ricky on 15/9/11.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorSet : NSObject<NSCoding>
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) UIColor *color;
@end
