//
//  RocketUpGiftAnimationView.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/26.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimationAction.h"

@interface RocketUpGiftAnimationView : GiftAnimationAction

/**
 动画开始
 
 @param animationCompletion 动画完成回调（用于控制队列）
 */
- (void)startAnimationWithCompletion:(giftAnimationCompletion)Completion;	//开始动画


@end
