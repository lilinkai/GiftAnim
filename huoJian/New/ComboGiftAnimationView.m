//
//  ComboGiftAnimationView.m
//  huoJian
//
//  Created by lilinkainew on 2016/12/26.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "ComboGiftAnimationView.h"
#import "GiftAnimationModel.h"

@interface ComboGiftAnimationView (){
    GiftAnimationModel *_model;  //礼物model
}

@end

@implementation ComboGiftAnimationView

/**
 动画开始
 
 @param model 对应的动画解析model
 @param animationCompletion 动画完成回调（用于控制队列）
 */
- (void)startAnimationWithModel:(GiftAnimationModel *)model withAnimationCompletion:			(giftAnimationCompletion)animationCompletion{
    
    _giftAnimationCompletion = animationCompletion;
    _model = model;
    
    [self startComboAnimationWithCompletion:animationCompletion];
}


@end
