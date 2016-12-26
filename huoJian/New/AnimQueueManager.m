//
//  AnimQueueManager.m
//  huoJian
//
//  Created by lilinkainew on 2016/12/20.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "AnimQueueManager.h"
#import "GiftAnimOperation.h"
#import "GiftAnimationModel.h"

@interface AnimQueueManager ()

@property (nonatomic, assign)NSInteger maxOperationCount;   //并发数
@property (nonatomic,strong) NSOperationQueue *ARAnimationQueue;  //横幅飞机火箭礼物动画队列
@property (nonatomic,strong) NSOperationQueue *rocketAnimationQueue;  //火箭up动画队列
@property (nonatomic,strong) NSOperationQueue *comboAnimationQueue;  //连击动画队列

@end

@implementation AnimQueueManager

/**
 初始化管理类
 @return 当前manager
 */
+ (instancetype)sharedAnimQueueManager{
    
    static AnimQueueManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AnimQueueManager alloc] init];
        manager.maxOperationCount = 2;
        manager.arGiftArray = [NSMutableArray array];
    });
    return manager;
}

/**
 创建礼物动画队列
 
 @return 队列obj
 */
- (NSOperationQueue *)ARAnimationQueue{
    if (_ARAnimationQueue == nil) {
        _ARAnimationQueue = [[NSOperationQueue alloc] init];
        _ARAnimationQueue.maxConcurrentOperationCount = self.maxOperationCount;
    }
    return _ARAnimationQueue;
}

/**
 火箭up动画队列
 
 @return 队列obj
 */
- (NSOperationQueue *)rocketAnimationQueue{
    if (_rocketAnimationQueue == nil) {
        _rocketAnimationQueue = [[NSOperationQueue alloc] init];
        _rocketAnimationQueue.maxConcurrentOperationCount = 1;
    }
    return _rocketAnimationQueue;
}

/**
 连击动画队列
 
 @return 队列obj
 */
- (NSOperationQueue *)comboAnimationQueue{
    if (_comboAnimationQueue == nil) {
        _comboAnimationQueue = [[NSOperationQueue alloc] init];
        _comboAnimationQueue.maxConcurrentOperationCount = 1;
    }
    return _comboAnimationQueue;
}

/**
 根据实际model添加飞机动画
 
 @param model modelobj
 */
- (void)addAnimationWithModel:(GiftAnimationModel *)model animContentView:(UIView *)animContentView {
    
    GiftAnimOperation *op = [GiftAnimOperation addGiftAnimOperationWithGiftModel:model animContentView:animContentView maxTop:self.maxTop];
    
    switch (model.giftStyle) {
        case AircraftType:
            [self.ARAnimationQueue addOperation:op];
            break;
        case RocketType:
            [self.ARAnimationQueue addOperation:op];
            break;
        case RocketUpType:
            [self.rocketAnimationQueue addOperation:op];
            break;
        case ComboType:
            [self.comboAnimationQueue addOperation:op];
            break;
        default:
            break;
    }
    
    
}


@end
