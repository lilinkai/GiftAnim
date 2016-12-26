//
//  GiftAnimationAction.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/24.
//  Copyright © 2016年 7k7k. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
 动画完成回调
 */
typedef void(^giftAnimationCompletion)();

@interface GiftAnimationAction : UIView<CAAnimationDelegate>{
    giftAnimationCompletion _giftAnimationCompletion;   //动画完成回调
}

/**
 飞机横屏动画
 */
- (void)startAircraftAnimationWithCompletion:(giftAnimationCompletion)Completion;

/**
 火箭横屏动画
 */
- (void)startRocketAnimationWithCompletion:(giftAnimationCompletion)Completion;

/**
 连击横屏动画
 */
- (void)startComboAnimationWithCompletion:(giftAnimationCompletion)Completion;

/**
 火箭上升动画
 */
- (void)startRocketUpAnimationWithRocketView:(UIView *)rocketView Cloud1:(UIView *)cloud1 Cloud2:(UIView *)cloud2 Cloud3:(UIView *)cloud3 Completion:(giftAnimationCompletion)Completion;

@end
