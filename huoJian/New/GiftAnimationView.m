//
//  GiftAnimationView.m
//  huoJian
//
//  Created by lilinkainew on 2016/12/24.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "GiftAnimationView.h"
#import "YYAnimatedImageView.h"
#import "GiftAnimationModel.h"
#import "UIView+Tool.h"
#import "YYText.h"

@interface GiftAnimationView (){
    GiftAnimationModel *_model;  //礼物model
}

@property (weak, nonatomic) IBOutlet YYAnimatedImageView *iconImageView;    //礼物图片imageview
@property (weak, nonatomic) IBOutlet YYLabel *contentLabel; //内容imageview
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation GiftAnimationView

- (void)awakeFromNib{
    [super awakeFromNib];
}

/**
 动画开始
 
 @param model 对应的动画解析model
 @param animationCompletion 动画完成回调（用于控制队列）
 */
- (void)startAnimationWithModel:(GiftAnimationModel *)model withAnimationCompletion:			(giftAnimationCompletion)animationCompletion{
    
    _giftAnimationCompletion = animationCompletion;
    _model = model;
    
    switch (_model.giftStyle) {
        case AircraftType:{
            [self parseModelForContentStyle];
            [self startAircraftAnimationWithCompletion:animationCompletion];
            break;
        }
        case RocketType:{
            [self parseModelForContentStyle];
            [self startRocketAnimationWithCompletion:animationCompletion];
            break;
        }
        default:
            break;
    }
}

/**
 解析model显示样式
 */
- (void)parseModelForContentStyle{
    //送礼物的名字格式化
    NSString *giftGusername = _model.giftGusername.length > 5 ? [NSString stringWithFormat:@"%@...", [_model.giftGusername substringToIndex:5]] : _model.giftGusername;
    
    //接受礼物的名字格式化
    NSString *giftRusername = _model.giftRusername.length > 5 ? [NSString stringWithFormat:@"%@...", [_model.giftRusername substringToIndex:5]] : _model.giftRusername;
    
    //icon通用设置
    
    self.iconImageView.animationImages = _model.giftIconArray;
    
    switch (_model.giftStyle) {
        case AircraftType:
            [self aircraftFrameConfig];
            break;
        case RocketType:
            [self rocketFrameConfig];
            break;
        default:
            break;
    }
    
    self.iconImageView.left = 0;    //icon距离左边边距
    self.bgImageView.left = self.iconImageView.size.width*0.6;  //背景距离左边边距
    
    //背景拉伸设置
    UIEdgeInsets insets = UIEdgeInsetsMake(15, 20, 15, 40);
    UIImage* image = [[UIImage imageNamed:@"lateral_rocket_bk"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    self.bgImageView.image = image;
    
    //礼物内容格式化
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@送给%@x%@个%@", giftGusername, giftRusername, _model.giftNum, _model.giftname]];
    
    //礼物内容全局格式化
    [text yy_setColor:[UIColor whiteColor] range:text.yy_rangeOfAll];
    
    //送礼物人名称格式化
    [text yy_setColor:[UIColor yellowColor] range:NSMakeRange(0, giftGusername.length)];
    
    //收礼物人名称格式化
    [text yy_setColor:[UIColor yellowColor] range:NSMakeRange(giftGusername.length+2, giftRusername.length)];
    
    //礼物数量格式化
    [text yy_setFont:[UIFont systemFontOfSize:17.0] range:NSMakeRange(giftGusername.length+2+giftRusername.length+1, _model.giftNum.length)];
    
    self.contentLabel.attributedText = text;
    
    //根据内容重新设置排版frame
    CGSize contentLabelSize = [self.contentLabel sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    self.contentLabel.width = contentLabelSize.width;
    self.bgImageView.width = self.contentLabel.width + self.bgImageView.left + 20;
    
    self.width = self.bgImageView.width + self.bgImageView.left;
}

/**
 火箭frame布局配置
 */
- (void)rocketFrameConfig{
    self.iconImageView.size = RocketIocnSize;
    self.contentLabel.left = RocketIocnSize.width;
    
}

/**
 飞机frame布局配置
 */
- (void)aircraftFrameConfig{
    self.iconImageView.size = aircraftIocnSize;
    self.contentLabel.left = aircraftIocnSize.width;
}

@end
