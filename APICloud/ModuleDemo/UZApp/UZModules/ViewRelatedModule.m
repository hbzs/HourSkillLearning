//
//  ViewRelatedModule.m
//  UZApp
//
//  Created by hourunjing on 2017/3/26.
//  Copyright © 2017年 APICloud. All rights reserved.
//

#import "ViewRelatedModule.h"
#import "NSDictionaryUtils.h"
#import "NativeViewController.h"

@implementation ViewRelatedModule

- (void)addUIView:(NSDictionary *)paramsDict_ {
  
  NSString *imageRelatedPath = [paramsDict_ stringValueForKey:@"image" defaultValue:@""];
  NSString *imageRealPath = [self getPathWithUZSchemeURL:imageRelatedPath];
  
  UIImage *image = [UIImage imageWithContentsOfFile:imageRealPath];
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  imageView.frame = CGRectMake(arc4random() % 300,  arc4random() % 400, 100, 100);
  imageView.userInteractionEnabled = YES;
  
  NSString *superViewName = [paramsDict_ stringValueForKey:@"fixedOn" defaultValue:nil];
  Boolean fixed = [paramsDict_ boolValueForKey:@"fixed" defaultValue:YES];
  [self addSubview:imageView fixedOn:superViewName fixed:fixed];
  
  [self view:imageView preventSlidBackGesture:fixed];
}

- (void)nativePushVC:(NSDictionary *)paramsDict_ {
  NativeViewController *vc = [[NativeViewController alloc] init];
  vc.view.backgroundColor = [UIColor grayColor];
  vc.slidBackEnabled = YES;
  vc.slidBackType = SlidBackTypeFullPage;
  [self.viewController.navigationController pushViewController:vc animated:YES];
}

@end
