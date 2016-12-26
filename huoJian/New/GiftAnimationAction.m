//
//  GiftAnimationAction.m
//  huoJian
//
//  Created by lilinkainew on 2016/12/24.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimationAction.h"
#import "UIView+Tool.h"

@implementation GiftAnimationAction

/**
 飞机横屏动画
 */
- (void)startAircraftAnimationWithCompletion:(giftAnimationCompletion)Completion{
    _giftAnimationCompletion = Completion;
    [self animationWithDuration:10
                              YValues:@[ @(GiftWidth+self.width/2), @(GiftWidth/2+20), @(GiftWidth/2-20), @(-(self.width/2))]
                             keyTimes:@[@0.0, @0.2, @0.8, @1.0]
                      timingFunctions:@[
                                        [CAMediaTimingFunction functionWithName:                    kCAMediaTimingFunctionEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                        ]
                              addView:self];
}

/**
 火箭横屏动画
 */
- (void)startRocketAnimationWithCompletion:(giftAnimationCompletion)Completion{
    _giftAnimationCompletion = Completion;
    [self animationWithDuration:10
                              YValues:@[ @(GiftWidth+self.width/2), @(GiftWidth/2+20), @(GiftWidth/2-20), @(-(self.width/2))]
                             keyTimes:@[@0.0, @0.2, @0.8, @1.0]
                      timingFunctions:@[
                                        [CAMediaTimingFunction functionWithName:                    kCAMediaTimingFunctionEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                        ]
                              addView:self];
}

/**
 连击横屏动画
 */
- (void)startComboAnimationWithCompletion:(giftAnimationCompletion)Completion{
    _giftAnimationCompletion = Completion;
    [self animationWithDuration:10
                             YValues:@[ @(GiftWidth+self.width/2), @(GiftWidth/2+20), @(GiftWidth/2-20), @(-(self.width/2))]
                            keyTimes:@[@0.0, @0.2, @0.8, @1.0]
                     timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:                    kCAMediaTimingFunctionEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                       ]
                             addView:self];
}

/**
 火箭上升动画
 */
/**
 火箭上升动画
 */
- (void)startRocketUpAnimationWithRocketView:(UIView *)rocketView Cloud1:(UIView *)cloud1 Cloud2:(UIView *)cloud2 Cloud3:(UIView *)cloud3 Completion:(giftAnimationCompletion)Completion{
    
    _giftAnimationCompletion = Completion;
    /**
     *  火箭动画添加
     */
    [self rocketAnimationWithDuration:3.0
                              YValues:@[ @(GiftHeight), @(GiftHeight-rocketView.height), @(GiftHeight-rocketView.height-30), @(GiftHeight-rocketView.height-30-600)]
                             keyTimes:@[@0, @0.1, @0.8, @1]
                      timingFunctions:@[
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                        ]
                              addView:rocketView];
    
    /**
     *  云朵动画添加
     */
    [self cloudAnimationWithDuration:3.0
                             XValues:@[ @(cloud1.centerX), @(cloud1.centerX-20), @(cloud1.centerX-30)]
                              alphas:@[ @1, @1, @0]
                            keyTimes:@[@0, @0.1, @1]
                     timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
                                       ]
                             addView:cloud1];
    
    [self cloudAnimationWithDuration:3.0
                             XValues:@[ @(cloud2.centerX), @(cloud2.centerX+20), @(cloud2.centerX+30)]
                              alphas:@[ @1, @1, @0]
                            keyTimes:@[@0, @0.1, @1]
                     timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
                                       ]
                             addView:cloud2];
    
    [self cloudAnimationWithDuration:3.0
                             XValues:@[ @(cloud3.centerX), @(cloud3.centerX+20), @(cloud3.centerX+30)]
                              alphas:@[ @1, @1, @0]
                            keyTimes:@[@0, @0.1, @1]
                     timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
                                       ]
                             addView:cloud3];
}

/**
 位移动画具体实现

 @param duration 动画持续时间
 @param YValues 动画帧数组
 @param keyTimes 动画帧时间
 @param timingFunctions 动画方式数组
 @param addView 需要添加的view
 */
- (void)animationWithDuration:(float)duration YValues:(NSArray *)YValues keyTimes:(NSArray *)keyTimes timingFunctions:(NSArray *)timingFunctions addView:(UIView *)addView{
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

/**
 *  火箭特效动画
 *
 *  @param duration        动画时间
 *  @param YValues         动画轨迹
 *  @param keyTimes        对话帧时间
 *  @param timingFunctions 动画显示方式
 *  @param addView         添加动画view
 */
- (void)rocketAnimationWithDuration:(float)duration YValues:(NSArray *)YValues keyTimes:(NSArray *)keyTimes timingFunctions:(NSArray *)timingFunctions addView:(UIView *)addView{
    CAKeyframeAnimation *rocketAnim = [CAKeyframeAnimation animation];
    rocketAnim.keyPath = @"position.y";
    rocketAnim.values = YValues;
    rocketAnim.keyTimes = keyTimes;
    rocketAnim.timingFunctions = timingFunctions;
    rocketAnim.duration = duration;
    rocketAnim.fillMode = kCAFillModeForwards;
    rocketAnim.removedOnCompletion = NO;
    rocketAnim.delegate = self;
    [addView.layer addAnimation:rocketAnim forKey:@"positionY"];
}

/**
 *  云朵特效动画
 *
 *  @param duration        动画时间
 *  @param YValues         动画轨迹
 *  @param keyTimes        对话帧时间
 *  @param timingFunctions 动画显示方式
 *  @param addView         添加动画view
 */
- (void)cloudAnimationWithDuration:(float)duration XValues:(NSArray *)XValues alphas:(NSArray *)alphas keyTimes:(NSArray *)keyTimes timingFunctions:(NSArray *)timingFunctions addView:(UIView *)addView{
    
    CAKeyframeAnimation *cloud3Anim = [CAKeyframeAnimation animation];
    cloud3Anim.keyPath = @"position.x";
    cloud3Anim.values = XValues;
    cloud3Anim.keyTimes = keyTimes;
    cloud3Anim.beginTime = CACurrentMediaTime()+0.1;
    cloud3Anim.timingFunctions = timingFunctions;
    cloud3Anim.duration = duration;
    [addView.layer addAnimation:cloud3Anim forKey:@"cloud3Anim"];
    
    CAKeyframeAnimation *cloud3Anim1 = [CAKeyframeAnimation animation];
    cloud3Anim1.keyPath = @"opacity";
    cloud3Anim1.values = alphas;
    cloud3Anim1.keyTimes = keyTimes;
    cloud3Anim1.beginTime = CACurrentMediaTime()+0.1;
    cloud3Anim1.duration = duration;
    [addView.layer addAnimation:cloud3Anim1 forKey:@"cloud3Anim1"];
}

/**
 动画回调代理，用于判断是否完成

 @param anim 动画对象
 @param flag 是否完成标记
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _giftAnimationCompletion();
}

@end
