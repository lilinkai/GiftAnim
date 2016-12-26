//
//  ComboGiftAnimationView.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/26.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimationAction.h"

@class GiftAnimationModel;

@interface ComboGiftAnimationView : GiftAnimationAction

/**
 动画开始
 
 @param model 对应的动画解析model
 @param animationCompletion 动画完成回调（用于控制队列）
 */
- (void)startAnimationWithModel:(GiftAnimationModel *)model withAnimationCompletion:			(giftAnimationCompletion)animationCompletion;	//开始动画

@end
