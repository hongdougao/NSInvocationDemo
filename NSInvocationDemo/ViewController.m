//
//  ViewController.m
//  NSInvocationDemo
//
//  Created by Yangyue on 15/5/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TSTInvocation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testClassMethod];
//    [self changeString:nil];
//    [ViewController transationString:@"lala"];
//    
//    [self classChange];
    
    [self testInvocationWithMoreString];
    
}

- (void)testClassMethod{
    NSString *string = nil;
    
    //初始化NSMethodSignature对象
    NSMethodSignature * sig = [NSString methodSignatureForSelector:@selector(stringWithString:)];
    
    //初始化NSInvocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    
    //设置执行目标对象
    [invocation setTarget:[NSString class]];
    
    //设置执行的selector
    [invocation setSelector:@selector(stringWithString:)];
    
    //设置参数
    NSString *argString = @"test method";
    [invocation setArgument:&argString atIndex:2];
    
    //执行方法
    [invocation retainArguments];
    [invocation invoke];
    
    //获取返回值
    [invocation getReturnValue:&string];
    
    NSLog(@"执行结果：%@", string);
    
    

}

- (void)classChange{

    NSString *nativeStr = @"好困";
    SEL mySelector = @selector(appendMyString:);
    
    TSTInvocation *myClass = [[TSTInvocation alloc]init];
    
    NSMethodSignature *sig = [[myClass class]instanceMethodSignatureForSelector:mySelector];//实例方法
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    
    [invocation setTarget: myClass];
    [invocation setSelector:mySelector];
    [invocation setArgument:&nativeStr atIndex:2];
    
    NSString *result = nil;
    
    [invocation retainArguments];
    [invocation invoke];
    [invocation getReturnValue:&result];
    
    NSLog(@"result invocation is :%@",result);
}

+ (NSString *)transationString:(NSString *)str{
    str = @"睡你XX 起来high";
    NSLog(@"%s  str  = %@",__FUNCTION__,str);
    return  str;

}
- (void)changeString:(NSString*)str{

    NSMethodSignature * sig = [ViewController methodSignatureForSelector:@selector(transationString:)];//类方法
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    
    [invocation setTarget:[ViewController class]];
    
    [invocation setSelector:@selector(transationString:)];
    
    NSString * stringOne = @"困死了睡了";
    
    [invocation setArgument:&stringOne atIndex:2];//0 1 两个参数已经被target 和selector占用
    
    [invocation retainArguments];
    [invocation invoke];
    
    [invocation getReturnValue:&stringOne];
    NSLog(@"transation 之后的str：%@",stringOne);

}
- (void)testInvocationWithMoreString{
    
    NSString *str = nil;
    SEL mySelector = @selector(appendMoreStringOne:andStringTwo:andStringThree:);
    
    NSMethodSignature *sig = [TSTInvocation methodSignatureForSelector:mySelector];
    
    NSInvocation *invocation  = [NSInvocation invocationWithMethodSignature:sig];
    
    [invocation setTarget:[TSTInvocation class]];
    [invocation setSelector:mySelector];
    
    NSString *strA = @"乌拉拉";
    [invocation setArgument:&strA atIndex:2];
    
    NSString *strB = @"one piece";
    [invocation setArgument:&strB atIndex:3];
    
    NSString *strC = @"别扭受";
    [invocation setArgument:&strC atIndex:4];
    
    [invocation retainArguments];
    [invocation invoke];
    
    [invocation getReturnValue:&str];
    NSLog(@"%s 最终结果 %@",__FUNCTION__,str);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
