#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RandomWayIntegerFromZero = 0
} RandomWay;

@interface RandomData : NSObject

@end

@implementation RandomData

+ (NSArray *)randomArray:(RandomWay)way count:(int)count with:(id)object {
    NSMutableArray *randomArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < count; i++) {
        switch (way) {
            	case RandomWayIntegerFromZero:
                {
                    [randomArray addObject:@([RandomData randomIntegerMaxFromZero:[object integerValue]])];
                }
                    break;
            }
    }
    return randomArray;
}

+ (NSArray *)randomArraySpecitifyNearlyOrdered:(NSInteger)randomNumberCount count:(int)count {
    NSMutableArray *randomArray = [[NSMutableArray alloc]initWithCapacity:count];
    for (int i = 0; i < count; i++) {
        randomArray[i] = @(i);
    }
    for (int i = 0; i < randomNumberCount; i++) {
        NSInteger lValue = [RandomData randomIntegerMaxFromZero:count];
        NSInteger rValue = [RandomData randomIntegerMaxFromZero:count];
        [randomArray exchangeObjectAtIndex:lValue withObjectAtIndex:rValue];
    }
    return randomArray;
}

+ (NSInteger)randomIntegerMaxFromZero:(int)maxValue {
    return (arc4random() % maxValue);
}

@end

#define NOR_VALUES @([array[lIndex] integerValue]^[array[rIndex] integerValue])

@interface Sort : NSObject

// 选择排序
+ (void)selectionSort:(NSMutableArray *)originArray;
// 优化的选择排序
+ (void)insertionSortImprove:(NSMutableArray *)originArray;
// 插入排序
+ (void)insertionSort:(NSMutableArray *)originArray;
// 传统插入排序
+ (void)insertionSortCommon:(NSMutableArray *)originArray;

@end

@implementation Sort

+ (void)selectionSort:(NSMutableArray *)originArray {
    for (int i = 0; i < (originArray.count - 1); i++) {
        for (int j = (i + 1); j < originArray.count; j++) {
            if ([originArray[j] compare:originArray[i]] == NSOrderedAscending) {
                  [originArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}

+ (void)insertionSortImprove:(NSMutableArray *)originArray {
    
    for (int i = 1; i < originArray.count; i++) {
        id currentToSortValue = originArray[i];
        int j;
        for (j = i; j > 0; j--) {
            if ([currentToSortValue compare:originArray[j-1]] == NSOrderedAscending) {
                originArray[j] = originArray[j-1];
            } else {
                break;
            }
        }
        originArray[j] = currentToSortValue;
    }
}

+ (void)insertionSort:(NSMutableArray *)originArray {
    
    for (int i = 1; i < originArray.count; i++) {
        for (int j = i; j > 0; j--) {
            
            if ([originArray[j] compare:originArray[j-1]] == NSOrderedAscending) {
                [originArray exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            } else {
                break;
            }
        }
    }
}

+ (void)insertionSortCommon:(NSMutableArray *)originArray {
    
    for (int i = 1; i < originArray.count; i++) {
        for (int j = i; j > 0; j--) {
            
            if ([originArray[j] compare:originArray[j-1]] == NSOrderedAscending) {
                [Sort swapAtIndex:j and:(j-1) inArray:originArray];
            } else {
                break;
            }
        }
    }
}

+ (void)swapAtIndex:(NSInteger)lIndex and:(NSInteger)rIndex inArray:(NSMutableArray *)array {
    array[lIndex] = NOR_VALUES;
    array[rIndex] = NOR_VALUES;
    array[lIndex] = NOR_VALUES;
}

@end

typedef enum : NSInteger {
    SortTypeNone = 0,
    SortTypeSelection,
    SortTypeInsertionImprove,
    SortTypeInsertion,
    SortTypeInsertionCommon
} SortType;

@interface TestSort : NSObject

// 排序并计算时间
+ (void)sortTimerTestName:(NSString *)sortName methodType:(SortType)sortType sortArray:(NSMutableArray *)arr;
// 是否为升序排序
+ (BOOL)sortedAscending:(NSArray *)arr;

@end

@implementation TestSort

+ (void)sortTimerTestName:(NSString *)sortName methodType:(SortType)sortType sortArray:(NSMutableArray *)arr {
    NSDate *startDate = [NSDate date];
    switch (sortType) {
    	case SortTypeSelection:
            {
                [Sort selectionSort:arr];
            }
            break;
        case SortTypeInsertion:
            {
                [Sort insertionSort:arr];
            }
            break;
        case SortTypeInsertionImprove:
                {
                    [Sort insertionSortImprove:arr];
                }
                break;
        case SortTypeInsertionCommon:
                    {
                        [Sort insertionSortCommon:arr];
                    }
                    break;
        default:
            break;
    }
    NSDate *endDate   = [NSDate date];
    NSTimeInterval secondsBetweenDates = [endDate timeIntervalSinceDate:startDate];
    NSLog(@"数组共有%@个元素，%@花费了%@秒", @(arr.count), sortName, @(secondsBetweenDates));
}

+ (BOOL)sortedAscending:(NSArray *)arr {
    for (int i = 1; i < arr.count; i++) {
        if (arr[i-1] > arr[i]) {
            NSLog(@"error:%@",arr);
            return NO;
        }
    }
    return YES;
}

@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        int count = 10000;
        
//        NSMutableArray *mutableArraySelction        = [[RandomData randomArray:RandomWayIntegerFromZero count:count with:@1000] mutableCopy];
        NSMutableArray *mutableArraySelction        = [[RandomData randomArraySpecitifyNearlyOrdered:10 count:count] mutableCopy];
        NSMutableArray *mutableArrayInsertionImprove = [mutableArraySelction mutableCopy];
        NSMutableArray *mutableArrayInsertion       = [mutableArraySelction mutableCopy];
        NSMutableArray *mutableArrayInsertionCommon = [mutableArraySelction mutableCopy];
        
        [TestSort sortTimerTestName:@"选择排序" methodType:SortTypeSelection sortArray:mutableArraySelction];
        assert([TestSort sortedAscending:mutableArraySelction]);
        
        [TestSort sortTimerTestName:@"引入变量的插入排序" methodType:SortTypeInsertionImprove sortArray:mutableArrayInsertionImprove];
        assert([TestSort sortedAscending:mutableArrayInsertionImprove]);
        
        [TestSort sortTimerTestName:@"插入排序" methodType:SortTypeInsertion sortArray:mutableArrayInsertion];
        assert([TestSort sortedAscending:mutableArrayInsertion]);
        
        [TestSort sortTimerTestName:@"传统的插入排序（不调用系统方法）" methodType:SortTypeInsertionCommon sortArray:mutableArrayInsertionCommon];
        assert([TestSort sortedAscending:mutableArrayInsertionCommon]);
    }
}