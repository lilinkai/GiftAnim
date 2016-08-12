//
//  ViewController.m
//  huoJian
//
//  Created by 李林凯 on 16/8/8.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import "ViewController.h"
#import "AnimOperationManager.h"
#import "UIView+Tool.h"

#import "DanMuModel.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KKWidth [[UIScreen mainScreen]bounds].size.width
#define KKHeight [[UIScreen mainScreen]bounds].size.height

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *sdasd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)pophuojianaaa:(UIButton *)sender {
    [self addRocket];
}

- (void)addRocket{
    AnimOperationManager *manager = [AnimOperationManager sharedManager];
    manager.animContentView = self.view;
    [manager addRocketVerticalAnim];
}

- (IBAction)addHHuoJian:(id)sender {
    AnimOperationManager *manager = [AnimOperationManager sharedManager];
    manager.animContentView = self.view;
    
    DanMuModel *danMuModel = [[DanMuModel alloc]init];
    danMuModel.user_nick = @"小明明明明明明明";
    danMuModel.target_nick = @"小红红红红红红红红";
    danMuModel.repeat = [NSNumber numberWithInteger:10];
    danMuModel.isOwnRoom = YES;
    danMuModel.room_id = [NSNumber numberWithInteger:244394];
    danMuModel.prop_id = @"6";  //火箭6   飞机7
    
    manager.danMuModel = danMuModel;
    
    [manager addGlobalGiftAnim];
}

- (IBAction)addHFeiJi:(id)sender {
    AnimOperationManager *manager = [AnimOperationManager sharedManager];
    manager.animContentView = self.view;
    
    DanMuModel *danMuModel = [[DanMuModel alloc]init];
    danMuModel.user_nick = @"小明明明明明明明";
    danMuModel.target_nick = @"小红红红红红红红红";
    danMuModel.repeat = [NSNumber numberWithInteger:10];
    danMuModel.isOwnRoom = YES;
    danMuModel.room_id = [NSNumber numberWithInteger:244394];
    danMuModel.prop_id = @"7";  //火箭6   飞机7
    
    manager.danMuModel = danMuModel;
    
    [manager addGlobalGiftAnim];
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
