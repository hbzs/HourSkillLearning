#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RandomWayIntegerFromZero = 0
} RandomWay;

typedef enum : NSInteger {
    SortTypeNone = 0,
    SortTypeSelection,
    SortTypeInsertionImprove,
    SortTypeInsertion
} SortType;

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

+ (NSInteger)randomIntegerMaxFromZero:(int)maxValue {
    return (arc4random() % maxValue);
}

@end

@interface Sort : NSObject

// 选择排序
+ (void)selectionSort:(NSMutableArray *)originArray;
// 优化的选择排序
+ (void)insertionSortImprove:(NSMutableArray *)originArray;
// 插入排序
+ (void)insertionSort:(NSMutableArray *)originArray;

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
        for (int j = (i - 1); j > 0; j--) {
            if ([originArray[j+1] compare:originArray[j]] == NSOrderedAscending) {
                originArray[j+1] = originArray[j];
                originArray[j]   = currentToSortValue;
            }
        }
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

@end

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
                    [Sort insertionSort:arr];
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
            return NO;
        }
    }
    return YES;
}

@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        int count = 10000;
        
        NSMutableArray *mutableArraySelction        = [[RandomData randomArray:RandomWayIntegerFromZero count:count with:@1000] mutableCopy];
        NSMutableArray *mutableArrayInsertionImprove = [mutableArraySelction mutableCopy];
        NSMutableArray *mutableArrayInsertion       = [mutableArraySelction mutableCopy];
        
        [TestSort sortTimerTestName:@"选择排序" methodType:SortTypeSelection sortArray:mutableArraySelction];
        assert([TestSort sortedAscending:mutableArraySelction]);
        
        [TestSort sortTimerTestName:@"引入变量的插入排序" methodType:SortTypeInsertionImprove sortArray:mutableArrayInsertionImprove];
        assert([TestSort sortedAscending:mutableArrayInsertionImprove]);
        
        [TestSort sortTimerTestName:@"插入排序" methodType:SortTypeInsertion sortArray:mutableArrayInsertion];
        assert([TestSort sortedAscending:mutableArrayInsertion]);
    }
}