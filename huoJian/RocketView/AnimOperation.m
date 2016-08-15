//
//  AnimOperation.m
//  KKbaseMVVM
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "AnimOperation.h"
#import "UIView+Tool.h"
#import "AnimOperationManager.h"

#define KKHeight [[UIScreen mainScreen]bounds].size.height
#define KKWidth [[UIScreen mainScreen]bounds].size.width

@interface AnimOperation ()

@property (nonatomic, getter = isFinished)  BOOL finished;
@property (nonatomic, getter = isExecuting) BOOL executing;

@end

@implementation AnimOperation

@synthesize finished = _finished;
@synthesize executing = _executing;

+ (instancetype)animOperation:(getRewards)getRewards{
    
    AnimOperation *op = [[AnimOperation alloc] init];
    
    op.rocketView = [[[NSBundle mainBundle]loadNibNamed:@"RocketView" owner:nil options:nil]lastObject];
    op.rocketView.frame = op.animContentView.frame;
    op.rocketView.height = 0;
    op.getRewards = getRewards;
    op.giftAnimView = [[[NSBundle mainBundle]loadNibNamed:@"GiftAnimView" owner:nil options:nil]lastObject];
    op.giftAnimView.frame = CGRectMake(0, 0, KKWidth, op.giftAnimView.height);
    
    return op;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _executing = NO;
        _finished  = NO;
        
        
    }
    return self;
}

- (void)start {

    if ([self isCancelled]) {
        self.finished = YES;
        return;
    }
    self.executing = YES;
    
    if (self.danMuModel) {
        
        AnimOperationManager *animOperationManager = [AnimOperationManager sharedManager];
        [animOperationManager.globalGiftAnimArray addObject:self];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            AnimOperationManager *animOperationManager = [AnimOperationManager sharedManager];
            
            AnimOperation *animOp = [animOperationManager.globalGiftAnimArray firstObject];
           
            if (animOp.giftAnimView.frame.origin.y == (KKHeight-self.giftAnimView.height)/2) {
                NSLog(@"数组最后一个在上面了");
                self.giftAnimView.top = (KKHeight-animOp.giftAnimView.height)/2+self.giftAnimView.height;
            }else{
                NSLog(@"数组最后一个在下面了");
                self.giftAnimView.top = (KKHeight-animOp.giftAnimView.height)/2;
            }
            
            [self.animContentView addSubview:self.giftAnimView];
            
            self.giftAnimView.danMuModel = self.danMuModel;
            
            [self.giftAnimView startAnimationToCompletion:^{
                self.finished = YES;
                [self.giftAnimView removeFromSuperview];
                [animOperationManager.globalGiftAnimArray removeObject:self];
            } getRewards:^(NSString *roomId) {
                self.getRewards(roomId);
            }];
        }];
    }else{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.animContentView addSubview:self.rocketView];
            
            [self.rocketView startAnimationToCompletion:^{
                self.finished = YES;
                [self.rocketView removeFromSuperview];
            }];
        }];
    }
}

#pragma mark -  手动触发 KVO
- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

@end
