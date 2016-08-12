//
//  GiftGlobalView.h
//  huoJian
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DanMuModel.h"

typedef void(^animatedComplete)();

@interface GiftGlobalView : UIView{
    animatedComplete _animatedComplete;
}

//创建两个全站礼物漂浮轨道
@property (strong, nonatomic) IBOutlet UIView *view1;   //第一个轨道
@property (strong, nonatomic) IBOutlet UIView *view2;   //第二个轨道

@property (strong, nonatomic)DanMuModel *danMuModel;   //火箭、飞机礼物model

- (void)startAnimationToCompletion:(animatedComplete)completion;

@end
