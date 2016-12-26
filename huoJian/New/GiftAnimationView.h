//
//  GiftAnimationView.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/24.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimationAction.h"

@class GiftAnimationModel;

#define RocketIocnSize CGSizeMake(60, 25)   //火箭固定宽高(不可改变）
#define aircraftIocnSize CGSizeMake(30, 25)   //飞机固定宽高(不可改变）

@protocol GiftAnimationViewDelegate <NSObject>
@optional

/**
 点击礼物漂浮动画代理
 
 @param model 对应的礼物modelObj
 */
- (void)clickGiftContentWith:(GiftAnimationModel *)model;

@end

@interface GiftAnimationView : GiftAnimationAction

/**
 动画开始
 
 @param model 对应的动画解析model
 @param animationCompletion 动画完成回调（用于控制队列）
 */
- (void)startAnimationWithModel:(GiftAnimationModel *)model withAnimationCompletion:			(giftAnimationCompletion)animationCompletion;	//开始动画

@end
