#import <Foundation/Foundation.h>

//#define NOR_VALUES @([array[lIndex] integerValue]^[array[rIndex] integerValue])

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

@interface Student : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSNumber *score;

- (instancetype)initWithName:(NSString *)name score:(NSNumber *)score;
- (NSComparisonResult)compare:(Student *)otherStudent;

@end

@implementation Student

- (instancetype)initWithName:(NSString *)name score:(NSNumber *)score {
    self = [super init];
    if (self) {
        self.name  = name;
        self.score = score;
    }
    return self;
}

- (NSComparisonResult)compare:(Student *)otherStudent {
    return ([self.score compare:otherStudent.score] == NSOrderedSame)?
                                    [self.name compare:otherStudent.name]:
                                    [self.score compare:otherStudent.score];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ is %@", self.name, self.score];
}

@end

@interface Sort : NSObject

// 选择排序
+ (void)selectionSort:(NSMutableArray *)originArray;
// 插入排序
+ (void)insertionSort:(NSMutableArray *)originArray;

@end

@implementation Sort

+ (void)selectionSort:(NSMutableArray *)originArray {
    for (int i = 0; i < (originArray.count - 1); i++) {
        for (int j = (i + 1); j < originArray.count; j++) {
            if ([originArray[j] compare:originArray[i]] == NSOrderedAscending) {
//                [Sort swapAtIndex:i and:j inArray:originArray];
                  [originArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"%@",originArray);
}

+ (void)insertionSort:(NSMutableArray *)originArray {
    
    for (int i = 1; i < originArray.count; i++) {
        for (int j = i; j > 0; j--) {
            
            if ([originArray[j] compare:originArray[j-1]] == NSOrderedAscending) {
//				[Sort swapAtIndex:j and:(j-1) inArray:originArray];
                [originArray exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            } else {
                break;
            }
        }
    }
    
    NSLog(@"%@",originArray);
}

//+ (void)swapAtIndex:(NSInteger)lIndex and:(NSInteger)rIndex inArray:(NSMutableArray *)array {
//    array[lIndex] = NOR_VALUES;
//    array[rIndex] = NOR_VALUES;
//    array[lIndex] = NOR_VALUES;
//}

@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
//        NSMutableArray *mutableArray = [@[@8,@6,@2,@3,@1,@5,@7,@4] mutableCopy];
//        NSMutableArray *mutableArray = [@[@8.2,@6.4,@2,@3,@1,@5,@7,@4] mutableCopy];
//        NSMutableArray *mutableArray = [@[@"cc",@"fd",@"sgfg",@"swqaa",@"bgf",@"ca"] mutableCopy];
//        NSMutableArray *mutableArray = [@[[[Student alloc] initWithName:@"sunwei" score:@95],
//                                          [[Student alloc] initWithName:@"beta" score:@45],
//                                          [[Student alloc] initWithName:@"gama" score:@86],
//                                          [[Student alloc] initWithName:@"alpha" score:@73],
//                                          [[Student alloc] initWithName:@"delta" score:@45],
//                                          [[Student alloc] initWithName:@"summary" score:@95]] mutableCopy];
        NSMutableArray *mutableArray = [[RandomData randomArray:RandomWayIntegerFromZero count:10 with:@1000] mutableCopy];
        NSLog(@"%@",mutableArray);
        [Sort selectionSort:mutableArray];
//        [Sort insertionSort:mutableArray];
    }
}