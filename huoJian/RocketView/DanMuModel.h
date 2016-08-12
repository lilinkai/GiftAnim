//
//  DanMuModel.h
//  KKbaseMVVM
//
//  Created by 李林凯 on 16/4/16.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <Foundation/Foundation.h>

//1、普通文字弹幕 2、大喇叭 3、赠送礼物的弹幕 5、房间内关注消息（未上线） 6、系统消息（禁言） 7、视频推流状态（未上线）8. 贡献榜前十进入房间提示 9. 用户被禁言提示 10.系统消息（被设为房管） 11.系统消息（取消房管）
typedef NS_ENUM(NSInteger,FYMessageType){
    
    FYMessageTypeUserMessage=1,             //其他用户说的弹幕 1
    
    FYMessageTypeBigTalk,                   //大喇叭 2
    
    FYMessageTypeGift,                      //赠送礼物的弹幕 3
    
    FYMessageTypePraise,                    //点赞  4
    
    FYMessageTypeAttention,                //房间关注消息  5
    
    FYMessageTypSystemNoTalk,               //系统消息(禁言)谁被主播禁言了 6
    
    FYMessageTypNone,                       //视频推流状态（未上线  7
    
    FYMessageTypSystemVipInRoom,            //排行榜用户进入房间提示  8
    
    FYMessageTypNotTakl,                     // 用户被禁言提示  9
    
    FYMessageTypSystemSetRoomer,            //系统消息(设为房管)  10
    
    FYMessageTypSystemNotRoomer,            //系统消息(取消房管)  11
    
    FYMesssageTypeSpeakerMessage,           //主播说话   12
    
    FYMessageTypeSystemUserInRoom ,          //用户进入房间 13
    
    FYMessageTypeRoomLeaderSpeaker,         //房管说话
    
    FYMessageTypeRoomSuperLeaderSpeaker,    //超管说话

    
};

@interface DanMuModel : NSObject

@property (nonatomic, assign)FYMessageType type;    //消息type
@property (nonatomic, copy)NSString *user_id; //用户id
@property (nonatomic, copy)NSString * user_verify;//用户验证
@property (nonatomic, copy)NSString *user_nick;   //用户昵称
@property (nonatomic, copy)NSString *content; //发送内容
@property (nonatomic, copy)NSString *user_avatar; //头像链接
@property (nonatomic, copy)NSString *prop_id; //礼物id
@property (nonatomic, copy)NSString *gifticon; //礼物url
@property (nonatomic, copy)NSString *prop_src; //礼物url
@property (nonatomic, copy)NSString *prop_name; //礼物名称
@property (nonatomic, copy)NSString *order_id;//订单ID
@property (nonatomic, copy)NSString *content_icon;//动态图片 现在是五彩祥云
@property (nonatomic, copy)NSString * target_nick;//目标昵称
@property (nonatomic, copy)NSString * target_id;//目标ID
//@property (nonatomic, copy) NSString *giftPlaying;
@property (nonatomic, copy) NSString *giftname;
@property (nonatomic, strong)NSNumber *prop_cost;
@property (nonatomic, strong)NSNumber * repeat;
@property (nonatomic, strong)NSNumber * is_mobile;
@property (nonatomic, strong)NSNumber * room_id;//房间号
@property (nonatomic, strong)NSString * room_nick;//房间昵称
@property (nonatomic, assign)BOOL isOwnRoom;
//@property (nonatomic, strong)YYTextLayout *textLayout;

@end
