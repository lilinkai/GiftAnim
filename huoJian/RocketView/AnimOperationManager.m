//
//  AnimOperationManager.m
//  KKbaseMVVM
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "AnimOperationManager.h"
#import "AnimOperation.h"

@interface AnimOperationManager ()

//火箭竖着飞动画队列
@property (nonatomic,strong) NSOperationQueue *rocketVerticalQueue;

//送了礼物全站通知动画队列
@property (nonatomic,strong) NSOperationQueue *globalGiftQueue;

@end

@implementation AnimOperationManager

+ (instancetype)sharedManager
{
    static AnimOperationManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AnimOperationManager alloc] init];
        manager.globalGiftAnimArray = [NSMutableArray array];
    });
    return manager;
}

- (NSOperationQueue *)rocketVerticalQueue
{
    if (_rocketVerticalQueue == nil) {
        _rocketVerticalQueue = [[NSOperationQueue alloc] init];
        _rocketVerticalQueue.maxConcurrentOperationCount = 1;
    }
    return _rocketVerticalQueue;
}

- (NSOperationQueue *)globalGiftQueue
{
    if (_globalGiftQueue == nil) {
        _globalGiftQueue = [[NSOperationQueue alloc] init];
        _globalGiftQueue.maxConcurrentOperationCount = 2;
    }
    return _globalGiftQueue;
}

/**
 *  添加到火箭竖着飞的动画
 */
- (void)addRocketVerticalAnim{
    AnimOperation *op = [AnimOperation animOperation:^(NSString *roomId) {
        
    }];
    op.animContentView = self.animContentView;
    [self.rocketVerticalQueue addOperation:op];
}

/**
 *  添加全站横着飞的动画
 */
- (void)addGlobalGiftAnim:(getRewards)getRewards{
    AnimOperation *op = [AnimOperation animOperation:^(NSString *roomId) {
        if (getRewards) {
            getRewards(roomId);
        }
    }];
    op.animContentView = self.animContentView;
    op.danMuModel = self.danMuModel;
    [self.globalGiftQueue addOperation:op];
}

@end
