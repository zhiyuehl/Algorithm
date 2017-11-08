//
//  SortManager.h
//  Algorithm
//
//  Created by tederen on 2017/11/7.
//  Copyright © 2017年 zhiyuehl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SortAscending,    //升序
    SortDeascending,  //降序
} SortType;

@interface SortManager : NSObject

//1.冒泡排序：稳定，复杂度高
+ (NSArray *)bubbleSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType;

//2.选择排序：不稳定，会改变相等大小元素的相对位置
+ (NSArray *)selectSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType;

//3.插入排序:稳定,复杂度稍低
+ (NSArray *)insertSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType;

//4.二分插入排序
+ (NSArray *)binaryInsertSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType;

//5.快速排序
+ (NSArray *)quickSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType;

//6.希尔排序
+ (NSArray *)shellSortWithArray:(NSArray *)sortArray sortType:(SortType)sortType;

@end
