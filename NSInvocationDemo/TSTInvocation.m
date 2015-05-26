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
+ (NSString *)appendMoreStringOne:(NSString *)stringA andStringTwo:(NSString *)stringB andStringThree:(NSString *)stringC{
    NSString *string =[NSString stringWithFormat:@"give me stringA :%@ stringB:%@ stringC:%@",stringA,stringB,stringC];
    return string;

}
@end
