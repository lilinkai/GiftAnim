//
//  UIView+Tool.h
//  KKbaseMVVM
//
//  Created by 李林凯 on 16/4/7.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tool)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;
@property (nonatomic, readonly) UIViewController *viewController;

- (void)removeAllSubviews;

@end
