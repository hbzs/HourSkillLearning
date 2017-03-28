//
//  CanBackModule.m
//  UZApp
//
//  Created by hourunjing on 2017/3/25.
//  Copyright © 2017年 APICloud. All rights reserved.
//

#import "CanBackModule.h"
#import "NSDictionaryUtils.h"

static NSNumber *canBackId;
static NSInteger count;

@implementation CanBackModule

- (void)canBack:(NSDictionary *)paramsDict_ {
  canBackId = @([paramsDict_ integerValueForKey:@"cbId" defaultValue:-1]);
  count = 0;
  
  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(continnousTimer) userInfo:nil repeats:YES];
}

- (void)continnousTimer {
  
  if ([canBackId compare:@0] == NSOrderedDescending) {
    count++;
    
    NSString *msg = [NSString stringWithFormat:@"我是回调时间：%@", @(count)];
    [self sendResultEventWithCallbackId:[canBackId intValue]
                               dataDict:@{@"msg": msg}
                                errDict:nil doDelete:NO];
  }
}

@end
