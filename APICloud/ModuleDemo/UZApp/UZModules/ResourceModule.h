//
//  ResourceModule.h
//  UZApp
//
//  Created by hourunjing on 2017/3/24.
//  Copyright © 2017年 APICloud. All rights reserved.
//

#import "UZModule.h"

@interface ResourceModule : UZModule

- (void)remoteResource:(NSDictionary *)paramsDict_;
- (void)localResource:(NSDictionary *)paramsDict_;
  
@end
