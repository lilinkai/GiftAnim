//
//  AnimOperationManager.h
//  KKbaseMVVM
//
//  Created by 李林凯 on 16/8/11.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DanMuModel.h"

@interface AnimOperationManager : NSObject

@property (nonatomic,strong) UIView *animContentView;   //需要显示动画的view（一定要指定）
@property (strong, nonatomic)DanMuModel *danMuModel;   //火箭、飞机礼物model

@property (nonatomic, strong)NSMutableArray *globalGiftAnimArray;   //存储当前执行的全局动画信息

+ (instancetype)sharedManager;

//添加火箭竖着飞的动画
- (void)addRocketVerticalAnim;

//添加全站横着飞的动画
- (void)addGlobalGiftAnim;

@end
