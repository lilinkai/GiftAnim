//
//  GiftAnimOperation.m
//  huoJian
//
//  Created by lilinkainew on 2016/12/20.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimOperation.h"
#import "GiftAnimationView.h"
#import "GiftAnimationModel.h"
#import "UIView+Tool.h"
#import "AnimQueueManager.h"
#import "RocketUpGiftAnimationView.h"
#import "ComboGiftAnimationView.h"

@interface GiftAnimOperation (){
    
    BOOL _finished;  //用于设置队列是否完成
    BOOL _executing; //队列任务开始执行
    
}

@property (nonatomic, strong)GiftAnimationView *giftAnimationView;  //火箭，飞机横幅动画view
@property (nonatomic, strong)RocketUpGiftAnimationView *rocketView;  //火箭全局up动画
@property (nonatomic, strong)ComboGiftAnimationView *comboGiftAnimationView;  //连击动画
@property (nonatomic, strong)GiftAnimationModel *model;  //model
@property (nonatomic,strong) UIView *animContentView;   //需要显示动画的view
@property (nonatomic, assign)NSInteger maxTop;   //初始位置（需要根据显示设置最低位置在哪里）

@end

@implementation GiftAnimOperation

+ (GiftAnimOperation *)addGiftAnimOperationWithGiftModel:(GiftAnimationModel *)model animContentView:(UIView *)animContentView maxTop:(NSInteger)maxTop{
    
    GiftAnimOperation *giftAnimOperation = [[GiftAnimOperation alloc]initWithGiftModel:model animContentView:animContentView maxTop:maxTop];
    return giftAnimOperation;
    
}

/**
 横幅动画view加载

 @return 横幅动画view
 */
- (GiftAnimationView *)giftAnimationView{
    if (_giftAnimationView == nil) {
        _giftAnimationView = [[[NSBundle mainBundle]loadNibNamed:@"GiftAnimationView" owner:nil options:nil]lastObject];
    }
    return _giftAnimationView;
}

/**
 火箭上升动画

 @return 火箭上升view
 */
- (RocketUpGiftAnimationView *)rocketView{
    if (_rocketView == nil) {
        _rocketView = [[[NSBundle mainBundle]loadNibNamed:@"RocketUpGiftAnimationView" owner:nil options:nil]lastObject];
    }
    return _rocketView;
}

/**
 连击动画
 
 @return 连击view
 */
- (ComboGiftAnimationView *)comboGiftAnimationView{
    if (_comboGiftAnimationView == nil) {
        _comboGiftAnimationView = [[[NSBundle mainBundle]loadNibNamed:@"ComboGiftAnimationView" owner:nil options:nil]lastObject];
    }
    return _comboGiftAnimationView;
}

/**
 初始化

 @param model 礼物model
 @param animContentView 需要把动画view添加到的view
 @return obj
 */
- (instancetype)initWithGiftModel:(GiftAnimationModel *)model animContentView:(UIView *)animContentView maxTop:(NSInteger)maxTop{
    self = [super init];
    if (self) {
        self.model = model;
        self.animContentView = animContentView;
        self.maxTop = maxTop;
    }
    return self;
}

/**
 开始方法(KVO控制队列任务状态)
 */
- (void)start{
    //这里动画队列任务不存在Cancelled状态所以不需要判断，直接开始执行
    [self willChangeValueForKey:@"isExecuting"];
    _executing = YES;
    [self main];
    [self didChangeValueForKey:@"isExecuting"];
}

/**
 自定义Operation提供了start main接口。
 */
- (void)main{
    
    switch (_model.giftStyle) {
        case AircraftType:
            [self landscapeARgiftAnimation];
            break;
        case RocketType:
            [self landscapeARgiftAnimation];
            break;
        case RocketUpType:
            [self rocketViewUpAnimation];
            break;
        case ComboType:
            [self comboViewAnimation];
            break;
        default:
            break;
    }
    
    
}

/**
 横屏动画
 */
- (void)landscapeARgiftAnimation{
    __weak GiftAnimOperation *weakSelf = self;
    
    NSMutableArray *giftViews = [AnimQueueManager sharedAnimQueueManager].arGiftArray;
    
    [giftViews addObject:weakSelf.giftAnimationView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.animContentView addSubview:self.giftAnimationView];
        
        GiftAnimationView *giftAnimationView = [giftViews firstObject];
        
        if (giftAnimationView.top == weakSelf.maxTop) {
            weakSelf.giftAnimationView.top = weakSelf.maxTop - weakSelf.giftAnimationView.height - 10;
        }else{
            weakSelf.giftAnimationView.top = weakSelf.maxTop;
        }
        
        [weakSelf.giftAnimationView startAnimationWithModel:weakSelf.model withAnimationCompletion:^{
            
            [weakSelf.giftAnimationView removeFromSuperview];
            
            [giftViews removeObject:weakSelf.giftAnimationView];
            
            [weakSelf willChangeValueForKey:@"isFinished"];
            
            _finished = YES;
            
            [weakSelf didChangeValueForKey:@"isFinished"];
        }];
    });
}

/**
 上升火箭动画
 */
- (void)rocketViewUpAnimation{
    
    __weak GiftAnimOperation *weakSelf = self;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.animContentView addSubview:weakSelf.rocketView];
        
        [self.rocketView startAnimationWithCompletion:^{
            
            [weakSelf.rocketView removeFromSuperview];
            
            [weakSelf willChangeValueForKey:@"isFinished"];
            
            _finished = YES;
            
            [weakSelf didChangeValueForKey:@"isFinished"];
        }];
        
    });
}

/**
 连击动画
 */
- (void)comboViewAnimation{
    
    __weak GiftAnimOperation *weakSelf = self;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.animContentView addSubview:weakSelf.comboGiftAnimationView];
        
        weakSelf.comboGiftAnimationView.top = weakSelf.maxTop - (weakSelf.giftAnimationView.height*2 + weakSelf.comboGiftAnimationView.height);
        
        [weakSelf.comboGiftAnimationView startComboAnimationWithCompletion:^{
            
            [weakSelf.comboGiftAnimationView removeFromSuperview];
            
            weakSelf.giftAnimationView = nil;
            
            [weakSelf willChangeValueForKey:@"isFinished"];
            
            _finished = YES;
            
            [weakSelf didChangeValueForKey:@"isFinished"];
        }];
        
    });
    
}

// 提示：To be deprecated; use and override 'asynchronous' below
//之前用的isConcurrent
/**
 覆写异步执行

 @return YES
 */
- (BOOL)isAsynchronous{
    return YES;
}

/**
 覆写任务是否完成控制

 @return 完成状态 _finished
 */
- (BOOL) isFinished{
    return _finished;
}

/**
 覆写任务是否完成开始执行

 @return 执行状态 _executing
 */
- (BOOL) isExecuting{
    return _executing;
}

@end
