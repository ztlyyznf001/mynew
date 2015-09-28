//
//  ColorSet.m
//  UINavigationTest
//
//  Created by ricky on 15/9/11.
//  Copyright (c) 2015年 ricky. All rights reserved.
//

#import "ColorSet.h"

@implementation ColorSet
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.color forKey:@"colorname"];
    [aCoder encodeObject:self.name forKey:@"color"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.color = [aDecoder decodeObjectForKey:@"colorname"];
        self.name = [aDecoder decodeObjectForKey:@"color"];
    }
    return self;
}

@end
