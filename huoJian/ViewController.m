//
//  ViewController.m
//  huoJian
//
//  Created by 李林凯 on 16/8/8.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Tool.h"
#import "AnimQueueManager.h"
#import "GiftAnimationModel.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KKWidth [[UIScreen mainScreen]bounds].size.width
#define KKHeight [[UIScreen mainScreen]bounds].size.height

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *sdasd;
@property (weak, nonatomic) IBOutlet UIView *animView;

@property (nonatomic, strong)dispatch_group_t group;
@property (nonatomic, strong)dispatch_queue_t queue;

@property (nonatomic, strong)AnimQueueManager *animQueueManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animQueueManager = [AnimQueueManager sharedAnimQueueManager];
    self.animQueueManager.maxTop = 200;
}

- (IBAction)POPHuoJianAction:(UIButton *)sender {
    GiftAnimationModel *model = [GiftAnimationModel new];
    model.giftStyle = RocketUpType;
    [self.animQueueManager  addAnimationWithModel:model animContentView:self.view];
}

- (IBAction)hengHuoJianAction:(id)sender {
    GiftAnimationModel *model = [GiftAnimationModel new];
    model.giftname = @"火箭";
    model.giftStyle = RocketType;
    model.giftIconArray = @[[UIImage imageNamed:@"lateral_rocket_1"], [UIImage imageNamed:@"lateral_rocket_2"], [UIImage imageNamed:@"lateral_rocket_3"]];
    model.giftNum = @"5";
    model.giftRusername = @"啊啊啊啊啊啊啊啊啊啊啊啊";
    model.giftRuserId = @"10000";
    model.giftGusername = @"按时大多数阿萨德 爱傻傻的爱的";
    model.giftGuserId = @"20000";
    
    [self.animQueueManager  addAnimationWithModel:model animContentView:self.view];
}

- (IBAction)hengFeiJiAction:(UIButton *)sender {
    GiftAnimationModel *model = [GiftAnimationModel new];
    model.giftname = @"飞机";
    model.giftStyle = AircraftType;
    model.giftIconArray = @[[UIImage imageNamed:@"lateral_aircraft_1"], [UIImage imageNamed:@"lateral_aircraft_2"], [UIImage imageNamed:@"lateral_aircraft_3"]];
    model.giftNum = @"5";
    model.giftRusername = @"啊啊啊啊啊啊啊啊啊啊啊啊";
    model.giftRuserId = @"10000";
    model.giftGusername = @"按时大多数阿萨德 爱傻傻的爱的";
    model.giftGuserId = @"20000";
    
    [self.animQueueManager  addAnimationWithModel:model animContentView:self.view];
}

- (IBAction)comboAction:(id)sender {
    GiftAnimationModel *model = [GiftAnimationModel new];
    model.giftname = @"飞机";
    model.giftStyle = ComboType;
    model.giftIconArray = @[[UIImage imageNamed:@"lateral_aircraft_1"], [UIImage imageNamed:@"lateral_aircraft_2"], [UIImage imageNamed:@"lateral_aircraft_3"]];
    model.giftNum = @"5";
    model.giftRusername = @"啊啊啊啊啊啊啊啊啊啊啊啊";
    model.giftRuserId = @"10000";
    model.giftGusername = @"按时大多数阿萨德 爱傻傻的爱的";
    model.giftGuserId = @"20000";
    
    [self.animQueueManager  addAnimationWithModel:model animContentView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
