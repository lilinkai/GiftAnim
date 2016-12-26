//
//  RocketUpGiftAnimationView.m
//  huoJian
//
//  Created by lilinkainew on 2016/12/26.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "RocketUpGiftAnimationView.h"
#import "YYAnimatedImageView.h"
#import "UIView+Tool.h"

@interface RocketUpGiftAnimationView ()

@property (strong, nonatomic) IBOutlet YYAnimatedImageView *fireImageView;
@property (strong, nonatomic) IBOutlet YYAnimatedImageView *rocketImageView;

@property (strong, nonatomic) IBOutlet UIView *rocketBigView;
@property (strong, nonatomic) IBOutlet UIView *cloudBigView;

@property (strong, nonatomic) IBOutlet UIImageView *cloud1;
@property (strong, nonatomic) IBOutlet UIImageView *cloud2;
@property (strong, nonatomic) IBOutlet UIImageView *cloud3;

@end

@implementation RocketUpGiftAnimationView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self loadView];
    
}

- (void)loadView{
    
    self.fireImageView.animationImages = @[[UIImage imageNamed:@"火0001"],[UIImage imageNamed:@"火0002"],[UIImage imageNamed:@"火0003"],[UIImage imageNamed:@"火0004"],[UIImage imageNamed:@"火0005"]];
    
    self.rocketImageView.animationImages = @[[UIImage imageNamed:@"hj0001"],[UIImage imageNamed:@"hj0002"],[UIImage imageNamed:@"hj0003"],[UIImage imageNamed:@"hj0004"],[UIImage imageNamed:@"hj0005"]];
    
    [self loadRocketLayout];
    [self loadCloudLayout];
}

/**
 *  布局火箭的frame
 */
- (void)loadRocketLayout{
    self.rocketBigView.top = GiftHeight;
    self.rocketBigView.left = (GiftWidth-self.rocketBigView.width)/2;
}

/**
 *  布局云朵的frame
 */
- (void)loadCloudLayout{
    self.cloudBigView.top = GiftHeight - 180 - self.cloudBigView.height/2 - 20;
    self.cloudBigView.left = (GiftWidth - 230)/2;
}

/**
 动画开始
 
 @param animationCompletion 动画完成回调（用于控制队列）
 */
- (void)startAnimationWithCompletion:(giftAnimationCompletion)Completion{
    [self startRocketUpAnimationWithRocketView:self.rocketBigView Cloud1:_cloud1 Cloud2:_cloud2 Cloud3:_cloud3 Completion:Completion];
}

@end
