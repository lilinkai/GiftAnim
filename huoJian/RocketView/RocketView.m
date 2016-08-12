//
//  RocketView.m
//  huoJian
//
//  Created by 李林凯 on 16/8/9.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "RocketView.h"
#import "YYAnimatedImageView.h"
#import "UIView+Tool.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KKWidth [[UIScreen mainScreen]bounds].size.width
#define KKHeight [[UIScreen mainScreen]bounds].size.height

@interface RocketView ()
{
    animatedComplete _animatedComplete;
}

@property (strong, nonatomic) IBOutlet YYAnimatedImageView *fireImageView;
@property (strong, nonatomic) IBOutlet YYAnimatedImageView *rocketImageView;

@property (assign, nonatomic)float progress;

@property (strong, nonatomic) IBOutlet UIView *rocketBigView;
@property (strong, nonatomic) IBOutlet UIView *cloudBigView;

@property (strong, nonatomic) IBOutlet UIImageView *cloud1;
@property (strong, nonatomic) IBOutlet UIImageView *cloud2;
@property (strong, nonatomic) IBOutlet UIImageView *cloud3;

@end

@implementation RocketView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.progress = 0.0;
    
    [self loadView];

}

- (void)loadView{
    
    self.fireImageView.animationImages = @[[UIImage imageNamed:@"火0001"],[UIImage imageNamed:@"火0002"],[UIImage imageNamed:@"火0003"],[UIImage imageNamed:@"火0004"],[UIImage imageNamed:@"火0005"]];
    
    self.rocketImageView.animationImages = @[[UIImage imageNamed:@"hj0001"],[UIImage imageNamed:@"hj0002"],[UIImage imageNamed:@"hj0003"],[UIImage imageNamed:@"hj0004"],[UIImage imageNamed:@"hj0005"]];
}

- (void)layoutSubviews{
    
    [self loadRocketLayout];
    [self loadCloudLayout];
}

/**
 *  布局火箭的frame
 */
- (void)loadRocketLayout{
    self.rocketBigView.top = KKHeight;
    self.rocketBigView.left = (KKWidth-self.rocketBigView.width)/2;
}

/**
 *  布局云朵的frame
 */
- (void)loadCloudLayout{
    self.cloudBigView.top = KKHeight - 180 - self.cloudBigView.height/2 - 20;
    self.cloudBigView.left = (KKWidth - 230)/2;
}

- (void)startAnimationToCompletion:(animatedComplete)completion{
    
    _animatedComplete = completion;
    
    /**
     *  火箭动画添加
     */
    [self rocketAnimationWithDuration:3.0
                                 YValues:@[ @(KKHeight), @(KKHeight-self.rocketBigView.height), @(KKHeight-self.rocketBigView.height-30), @(KKHeight-self.rocketBigView.height-30-600)]
                                 keyTimes:@[@0, @0.1, @0.8, @1]
                         timingFunctions:@[
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                           ]
                                 addView:self.rocketBigView];
    
    /**
     *  云朵动画添加
     */
    [self cloudAnimationWithDuration:3.0
                             XValues:@[ @(self.cloud1.centerX), @(self.cloud1.centerX-20), @(self.cloud1.centerX-30)]
                                 alphas:@[ @1, @1, @0]
                                 keyTimes:@[@0, @0.1, @1]
                                 timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
                                       ]
                                addView:self.cloud1];
    
    [self cloudAnimationWithDuration:3.0
                             XValues:@[ @(self.cloud2.centerX), @(self.cloud2.centerX+20), @(self.cloud2.centerX+30)]
                              alphas:@[ @1, @1, @0]
                            keyTimes:@[@0, @0.1, @1]
                     timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
                                       ]
                             addView:self.cloud2];
    
    [self cloudAnimationWithDuration:3.0
                             XValues:@[ @(self.cloud3.centerX), @(self.cloud3.centerX+20), @(self.cloud3.centerX+30)]
                              alphas:@[ @1, @1, @0]
                            keyTimes:@[@0, @0.1, @1]
                     timingFunctions:@[
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
                                       ]
                             addView:self.cloud3];
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

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    _animatedComplete();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
