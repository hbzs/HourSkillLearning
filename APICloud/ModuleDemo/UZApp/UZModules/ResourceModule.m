//
//  ResourceModule.m
//  UZApp
//
//  Created by hourunjing on 2017/3/24.
//  Copyright © 2017年 APICloud. All rights reserved.
//

#import "ResourceModule.h"
#import "NSDictionaryUtils.h"

@implementation ResourceModule

- (void)addImageView:(NSString *)imageRealPath inFrame:(CGRect)rect {
  UIImage *image = [UIImage imageWithContentsOfFile:imageRealPath];
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  imageView.frame = rect;
  
  [self addSubview:imageView fixedOn:nil fixed:YES];
}

- (void)remoteResource:(NSDictionary *)paramsDict_ {
  // 获取 widget 下的相对地址
  NSString *imageWidgetPath = [paramsDict_ stringValueForKey:@"image" defaultValue:@""];
  NSString *imageRealPath = [self getPathWithUZSchemeURL:imageWidgetPath];
  
  [self addImageView:imageRealPath inFrame:CGRectMake(0, 0, 100, 100)];
}
  
- (void)localResource:(NSDictionary *)paramsDict_ {
  NSString *imageLocalPath = [[NSBundle mainBundle] pathForResource:@"res_resourceModule/land" ofType:@"png"];
  
  [self addImageView:imageLocalPath inFrame:CGRectMake(200, 0, 100, 100)];
}
  
@end
