//
//  localsave.m
//  UINavigationTest
//
//  Created by ricky on 15/9/11.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import "LocalSave.h"

static NSString* kShowAlertKey = @"kShowAlertKey";

void saveShowAlertData(BOOL show){
    [[NSUserDefaults standardUserDefaults] setObject:@(show) forKey:kShowAlertKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

BOOL getShowAlert(){
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kShowAlertKey] boolValue];
}

@implementation LocalSave

@end
