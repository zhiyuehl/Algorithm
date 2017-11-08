//
//  SortManager.m
//  Algorithm
//
//  Created by tederen on 2017/11/7.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

#import "SortManager.h"

@implementation SortManager

//1.冒泡排序：稳定，复杂度高
+ (NSArray *)bubbleSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType
{
    NSMutableArray *arr = sortArray.mutableCopy;
    for (int i = 0; i < arr.count-1; i ++) {
        for (int j = 0; j < arr.count-1-i; j ++) {
            //交换2个数
            if (sortType == SortAscending) {
                if ([arr[j] floatValue] < [arr[j+1] floatValue]) {
                    continue;
                }
            }else if (sortType == SortDeascending) {
                if ([arr[j] floatValue] > [arr[j+1] floatValue]) {
                    continue;
                }
            }
            NSNumber *t = arr[j];
            arr[j] = arr[j+1];
            arr[j+1] = t;
        }
    }
    return arr;
}
//2.选择排序：不稳定，会改变相等大小元素的相对位置
+ (NSArray *)selectSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType
{
    NSMutableArray *arr = sortArray.mutableCopy;
    for (int i = 0; i < arr.count-1; i ++) {
        int min = i;
        for (int j = i; j < arr.count; j ++) {
            if (sortType == SortAscending) {
                if ([arr[j] floatValue] > [arr[min] floatValue]) {
                    continue;
                }
            }else if (sortType == SortDeascending) {
                if ([arr[j] floatValue] < [arr[min] floatValue]) {
                    continue;
                }
            }
            min = j;
        }
        if (min != i) {
            //交换2个数
            NSNumber *t = arr[min];
            arr[min] = arr[i];
            arr[i] = t;
        }
    }
    return arr;
}


//3.插入排序:稳定
+ (NSArray *)insertSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType
{
    NSMutableArray *arr = sortArray.mutableCopy;
    for (int i = 1; i < arr.count; i ++) {
        NSNumber *a = arr[i];
        int j = i-1;
        //依次向左比较，如果左>右
        if (sortType == SortAscending) {
            while (j >= 0 && [arr[j] floatValue] > [a floatValue]) {
                arr[j+1] = arr[j];
                j --;
            }
        }else if (sortType == SortDeascending) {
            while (j >= 0 && [arr[j] floatValue] < [a floatValue]) {
                arr[j+1] = arr[j];
                j --;
            }
        }
        arr[j+1] = a;
    }
    return arr;
}

//4.二分插入排序
+ (NSArray *)binaryInsertSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType
{
    NSMutableArray *arr = sortArray.mutableCopy;
    for (int i = 0; i < arr.count; i ++) {
        NSNumber *a = arr[i];
        int left = 0;
        int right = i -1;
        while (left <= right) {
            int mid = (left+right)/2;
            if (sortType == SortAscending) {
                if ([arr[mid] floatValue] > [a floatValue]) {
                    right = mid -1;
                }else {
                    left = mid + 1;
                }
            }else if (sortType == SortDeascending) {
                if ([arr[mid] floatValue] < [a floatValue]) {
                    right = mid -1;
                }else {
                    left = mid + 1;
                }
            }
        }
        for (int j = i - 1; j >= left; j --) {
            arr[j+1] = arr[j];
        }
        arr[left] = a;
    }
    return arr;
}

//5.快速排序
+ (NSArray *)quickSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType
{
    NSMutableArray *arr = sortArray.mutableCopy;
    
    [self quickSortWithMutableArray:arr left:0 right:arr.count-1 sortType:sortType];
    
    return arr;
}

+ (void)quickSortWithMutableArray:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right sortType:(SortType)sortType
{
    if (left >= right) {
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    NSNumber *key = arr[left];
    if (sortType == SortAscending) {
        while (i < j) {
            while ([key floatValue] <= [arr[j] floatValue] && i < j) {
                j --;
            }
            arr[i] = arr[j];
            while (i < j && [key floatValue] >= [arr[i] floatValue]) {
                i ++;
            }
            arr[j] = arr[i];
        }
    }else if (sortType == SortDeascending) {
        while (i < j) {
            while ([key floatValue] >= [arr[j] floatValue] && i < j) {
                j --;
            }
            arr[i] = arr[j];
            while (i < j && [key floatValue] <= [arr[i] floatValue]) {
                i ++;
            }
            arr[j] = arr[i];
        }
    }
    arr[i] = key;
    [self quickSortWithMutableArray:arr left:left right:i-1 sortType:sortType];
    [self quickSortWithMutableArray:arr left:i+1 right:right sortType:sortType];
}

//6.希尔排序
+ (NSArray *)shellSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType
{
    NSMutableArray *arr = sortArray.mutableCopy;

    int gap = arr.count/2.0;
    while (gap >= 1) {
        for (int i = gap; i < arr.count; i ++) {
            NSNumber *t = arr[i];
            int j = i;
            if (sortType == SortAscending) {
                while (j >= gap && [t floatValue] > [arr[j-gap] floatValue]) {
                    [arr replaceObjectAtIndex:j withObject:arr[j-gap]];
                    j -= gap;
                }
            }else if (sortType == SortDeascending) {
                while (j >= gap && [t floatValue] < [arr[j-gap] floatValue]) {
                    [arr replaceObjectAtIndex:j withObject:arr[j-gap]];
                    j -= gap;
                }
            }
            [arr replaceObjectAtIndex:j withObject:t];
        }
        gap = gap/2;
    }
    return arr;
}






@end
