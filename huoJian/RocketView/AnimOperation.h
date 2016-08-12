//
//  AnimOperation.h
//  KKbaseMVVM
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RocketView.h"
#import "GiftAnimView.h"

@interface AnimOperation : NSOperation

@property (nonatomic,strong) UIView *animContentView;   //需要显示动画的view（一定要指定）

@property (nonatomic,strong) RocketView *rocketView;
@property (nonatomic, strong)GiftAnimView *giftAnimView;

@property (strong, nonatomic)DanMuModel *danMuModel;   //火箭、飞机礼物model

+ (instancetype)animOperation;

@end
