#import <Foundation/Foundation.h>

typedef enum _RandomWay {
    RandomWayIntegerFromZero
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

+ (NSInteger)randomIntegerMaxFromZero:(int)maxValue {
    return (arc4random() % maxValue);
}

@end

@interface Sort : NSObject

// 插入排序
+ (void)insertionSort:(NSMutableArray *)originArray;

@end

@implementation Sort

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
    
    NSLog(@"%@",originArray);
}

@end

@interface TestSort : NSObject

// 是否为升序排序
+ (BOOL)sortedAscending:(NSArray *)arr;

@end

@implementation TestSort

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
        NSMutableArray *mutableArray = [[RandomData randomArray:RandomWayIntegerFromZero count:10 with:@1000] mutableCopy];
        NSLog(@"%@",mutableArray);
        [Sort insertionSort:mutableArray];
        
        assert([TestSort sortedAscending:mutableArray]);
    }
}