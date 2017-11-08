//
//  ViewController.m
//  Algorithm
//
//  Created by tederen on 2017/11/7.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

#import "ViewController.h"
#import "SortManager.h"


@interface ViewController ()

@property(nonatomic,strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = @[@(4),@(15),@(7),@(13),@(20),@(3),@(5),@(1),@(24),@(34),@(25),@(23),@(12),@(20),@(18),@(12),@(13),@(22),@(6),@(17)];
    
#pragma mark ------------------------排序法练习
    NSArray *arr1 = [SortManager bubbleSortWithArray:self.array sortType:SortDeascending];
    NSLog(@"冒泡排序：%@",arr1);
    
    NSArray *arr2 = [SortManager selectSortWithArray:self.array sortType:SortAscending];
    NSLog(@"选择排序：%@",arr2);
    
    NSArray *arr3 = [SortManager insertSortWithArray:self.array sortType:SortAscending];
    NSLog(@"插入排序%@",arr3);
    
    NSArray *arr4 = [SortManager binaryInsertSortWithArray:self.array sortType:SortAscending];
    NSLog(@"二分插入排序%@",arr4);
    
    NSArray *arr5 = [SortManager quickSortWithArray:self.array sortType:SortDeascending];
    NSLog(@"快速排序%@",arr5);

    NSArray *arr6 = [SortManager shellSortWithArray:self.array sortType:SortAscending];
    NSLog(@"希尔排序：%@",arr6);
    
    //算法题练习
    NSString *restr = [self reverseOutputWithString:@"hello world! this is a child, haha!"];
    NSLog(@"逆序输出%@",restr);
    
    NSInteger index = [self frontAppearOnceCharWithStrin:@"iedccdhejsiehloma"];
    NSLog(@"出现一次的最前字符在第%ld个",index+1);
}


#pragma mark ------------------------算法题练习
//1.实现一个字符串“how are you”的逆序输出。如给定字符串为“hello world”,输出结果应当为“world hello”。
- (NSString *)reverseOutputWithString:(NSString *)string
{
    NSMutableString *str = string.mutableCopy;
    NSMutableString *reStr = @"".mutableCopy;
    NSArray *arr = [str componentsSeparatedByString:@" "];
    for (NSInteger i = arr.count-1; i >= 0; i --) {
        NSString *cha = arr[i];
        [reStr appendString:cha];
        if (i != 0) {
            [reStr appendString:@" "];
        }
    }
    return reStr;
}
//2. 给定一个字符串，输出本字符串中只出现一次并且最靠前的那个字符的位置？如“abaccddeeef”,字符是b,输出应该是2。
- (NSInteger)frontAppearOnceCharWithStrin:(NSString *)string
{
    NSMutableString *str = string.mutableCopy;
    NSString *onceChar;
    NSInteger index = -1;
    for (NSInteger i = 0; i < str.length-1; i ++) {
        NSString *a = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *b = [str substringWithRange:NSMakeRange(i+1, str.length-i-1)];
        NSString *c = [str substringWithRange:NSMakeRange(0,i)];
        if ([b containsString:a] || [c containsString:a]) {
            continue;
        }
        onceChar = a;
        index = i;
        break;
    }
    NSLog(@"最靠前出现一次的字符%@",onceChar);
    return index;
}


@end
