//
//  GiftGlobalView.m
//  huoJian
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftGlobalView.h"
#import "GiftAnimView.h"
#import "UIView+Tool.h"

#define KKWidth [[UIScreen mainScreen]bounds].size.width

@implementation GiftGlobalView

- (void)startAnimationToCompletion:(animatedComplete)completion{
    
    _animatedComplete = completion;
    
    GiftAnimView *giftAnimView = [[[NSBundle mainBundle]loadNibNamed:@"GiftAnimView" owner:nil options:nil]lastObject];
    [self.view1 addSubview:giftAnimView];
    giftAnimView.danMuModel = self.danMuModel;
    giftAnimView.centerX = KKWidth+giftAnimView.width/2;
    
    [self animationWithAnimationView:giftAnimView];
}

- (void)animationWithAnimationView:(UIView *)AnimationView{
 
    /**
     *  火箭动画添加
     */
    [self rocketAnimationWithDuration:10
                              YValues:@[ @(KKWidth+AnimationView.width/2+20), @(KKWidth/2+20), @(KKWidth/2-20), @(-(AnimationView.width/2+30))]
                             keyTimes:@[@0.0, @0.2, @0.8, @1.0]
                      timingFunctions:@[
                                        [CAMediaTimingFunction functionWithName:                    kCAMediaTimingFunctionEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                        ]
                              addView:AnimationView];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _animatedComplete();
}

- (void)rocketAnimationWithDuration:(float)duration YValues:(NSArray *)YValues keyTimes:(NSArray *)keyTimes timingFunctions:(NSArray *)timingFunctions addView:(UIView *)addView{
    CAKeyframeAnimation *rocketAnim = [CAKeyframeAnimation animation];
    rocketAnim.keyPath = @"position.x";
    rocketAnim.values = YValues;
    rocketAnim.keyTimes = keyTimes;
    rocketAnim.timingFunctions = timingFunctions;
    rocketAnim.duration = duration;
    rocketAnim.fillMode = kCAFillModeForwards;
    rocketAnim.removedOnCompletion = NO;
    rocketAnim.delegate = self;
    [addView.layer addAnimation:rocketAnim forKey:@"positionY"];
}

@end
