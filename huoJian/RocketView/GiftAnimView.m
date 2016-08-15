//
//  GiftAnimView.m
//  huoJian
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimView.h"


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KKWidth [[UIScreen mainScreen]bounds].size.width
#define KKHeight [[UIScreen mainScreen]bounds].size.height

@interface GiftAnimView ()

@property (strong, nonatomic) IBOutlet YYAnimatedImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic)UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) IBOutlet UIButton *getButton;
@property (strong, nonatomic) IBOutlet UIButton *bigButton;

@end

@implementation GiftAnimView


- (void)awakeFromNib{
    [super awakeFromNib];

    [self.getButton addTarget:self action:@selector(getRewardsButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bigButton addTarget:self action:@selector(getRewardsButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setDanMuModel:(DanMuModel *)danMuModel{
    
    _danMuModel = danMuModel;
    
    NSString *user_nick = danMuModel.user_nick.length > 5 ? [NSString stringWithFormat:@"%@...", [danMuModel.user_nick substringToIndex:5]] : danMuModel.user_nick;
    
    NSString *target_nick = danMuModel.target_nick.length > 5 ? [NSString stringWithFormat:@"%@...", [danMuModel.target_nick substringToIndex:5]] : danMuModel.target_nick;
    
    NSString *giftType = @"";
    
    if ([danMuModel.prop_id integerValue] == 6) {
        giftType = @"火箭";
        UIEdgeInsets insets = UIEdgeInsetsMake(15, 20, 15, 40);
        UIImage* image = [[UIImage imageNamed:@"lateral_rocket_bk"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        self.bgImageView.image = image;
        self.iconImageView.animationImages = @[[UIImage imageNamed:@"lateral_rocket_1"],[UIImage imageNamed:@"lateral_rocket_2"],[UIImage imageNamed:@"lateral_rocket_3"]];
        self.iconImageView.width = 60;
        
        self.iconImageView.left = 0;
        self.bgImageView.left = 35;
        self.contentLabel.left = 60;
       
    }else{
        giftType = @"飞机";
        UIEdgeInsets insets = UIEdgeInsetsMake(15, 20, 15, 40);
        UIImage* image = [[UIImage imageNamed:@"lateral_aircraft_bk"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        self.bgImageView.image = image;
        self.iconImageView.animationImages = @[[UIImage imageNamed:@"lateral_aircraft_1"],[UIImage imageNamed:@"lateral_aircraft_2"],[UIImage imageNamed:@"lateral_aircraft_3"]];
        self.iconImageView.width = 30;
        
        self.iconImageView.left = 0;
        self.bgImageView.left = 15;
        self.contentLabel.left = 35;
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@送给%@x%@个%@", user_nick, target_nick, _danMuModel.repeat, giftType]];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0,user_nick.length)];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(user_nick.length+2,target_nick.length)];
    
    NSString *repeatPrevContent = [NSString stringWithFormat:@"%@送给%@x", user_nick, target_nick];
    NSString *repeatStr = [_danMuModel.repeat stringValue];
    
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17.0] range:NSMakeRange(repeatPrevContent.length, repeatStr.length)];
    
    self.contentLabel.attributedText = str;
    
    CGSize contentLabelSize = [self.contentLabel sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    
    self.contentLabel.width = contentLabelSize.width;
    self.bgImageView.width = self.contentLabel.width + 55;
    
    if (self.danMuModel.isOwnRoom) {
        self.getButton.hidden = YES;
    }else{
        self.getButton.hidden = NO;
        self.getButton.left = self.contentLabel.left+self.contentLabel.width;
        self.bgImageView.width = self.contentLabel.width + 55 + self.getButton.width;
    }
    
    self.width = KKWidth;
}

- (void)startAnimationToCompletion:(animatedComplete)completion getRewards:(getRewards)getRewards{
    
    _animatedComplete = completion;
    _getRewards = getRewards;
    
    /**
     *  火箭动画添加
     */
    [self rocketAnimationWithDuration:10
                              YValues:@[ @(KKWidth+self.width/2+20), @(KKWidth/2+20), @(KKWidth/2-20), @(-(self.width/2+30))]
                             keyTimes:@[@0.0, @0.2, @0.8, @1.0]
                      timingFunctions:@[
                                        [CAMediaTimingFunction functionWithName:                    kCAMediaTimingFunctionEaseOut],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                        ]
                              addView:self];
}

- (void)getRewardsButtonAction{
   _getRewards([self.danMuModel.room_id stringValue]);
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
