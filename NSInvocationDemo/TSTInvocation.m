//
//  TSTInvocation.m
//  NSInvocationDemo
//
//  Created by Yangyue on 15/5/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TSTInvocation.h"

@implementation TSTInvocation


- (NSString *)appendMyString:(NSString *)str{

    NSString *stringM = [NSString stringWithFormat:@"%@ 起来hing",str];
    
    return stringM;
}
@end
