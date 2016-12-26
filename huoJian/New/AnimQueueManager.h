//
//  AnimQueueManager.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/20.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GiftAnimationModel;

@interface AnimQueueManager : NSObject

@property (nonatomic, assign)NSInteger maxTop;   //初始位置（需要根据显示设置最低位置在哪里）
@property (nonatomic, strong)NSMutableArray *arGiftArray;   //飞机火箭横幅的数量，用于轨道计算（现在结构是一维数组，因为轨道中的弹道只有1个，如果是多个的话需要变为二维数组）

/**
 初始化管理类
 @return 当前manager
 */
+ (instancetype)sharedAnimQueueManager;

/**
 根据实际model添加飞机横幅动画(火箭、飞机横幅动画为一个队列)
 
 @param animContentView 需要把动画view添加到的view
 @param model modelobj
 */
- (void)addAnimationWithModel:(GiftAnimationModel *)model animContentView:(UIView *)animContentView;

@end
