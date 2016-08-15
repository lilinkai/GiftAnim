//
//  GiftAnimView.h
//  huoJian
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYAnimatedImageView.h"
#import "UIView+Tool.h"
#import "DanMuModel.h"

typedef void(^animatedComplete)();
typedef void(^getRewards)(NSString *roomId);

@interface GiftAnimView : UIView{
    animatedComplete _animatedComplete;
    getRewards _getRewards;
}

@property (strong, nonatomic)DanMuModel *danMuModel;   //火箭、飞机礼物model

- (void)startAnimationToCompletion:(animatedComplete)completion getRewards:(getRewards)getRewards;

@end
