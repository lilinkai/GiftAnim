//
//  GiftAnimationModel.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/20.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    AircraftType,
    RocketType,
    ComboType,
    RocketUpType
} GiftStyle;

@interface GiftAnimationModel : NSObject

@property (nonatomic, strong)NSString *pushId;  //跳转id
@property (nonatomic, assign)GiftStyle giftStyle;  //动画类型
@property (nonatomic, strong)NSString *giftname;  //礼物名字
@property (nonatomic, strong)NSArray *giftIconArray;  //礼物图片数组
@property (nonatomic, strong)NSString *giftNum;  //礼物数量
@property (nonatomic, strong)NSString *giftRusername;  //接受礼物的人
@property (nonatomic, strong)NSString *giftRuserId;  //接受礼物的人id
@property (nonatomic, strong)NSString *giftGusername;  //送礼物的人
@property (nonatomic, strong)NSString *giftGuserId;  //送礼物的id

@end
