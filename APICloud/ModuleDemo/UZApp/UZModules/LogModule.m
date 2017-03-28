//
//  LogModule.m
//  UZApp
//
//  Created by hourunjing on 2017/3/24.
//  Copyright © 2017年 APICloud. All rights reserved.
//

#import "LogModule.h"

@implementation LogModule

- (void)printLog:(NSDictionary *)paramsDict_ {
  NSString *logMsg = @"Log Msg";
  NSLog(@"%@", logMsg);
  
  [self sendMessageByEvalJS:logMsg];
  
  [self sendCustomEvent:@"nativeEvent" extra:[NSString stringWithFormat:@"{'eventContent': '%@'}", logMsg]];
}

- (void)sendMessageByEvalJS:(NSString *)content {
  
  NSString *jsString = [NSString stringWithFormat:@"nativeMessage({'content': '%@'})", content];
  [self evalJs:jsString];
}
  
@end
