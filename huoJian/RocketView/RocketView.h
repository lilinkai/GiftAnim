//
//  RocketView.h
//  huoJian
//
//  Created by 李林凯 on 16/8/9.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animatedComplete)();

@interface RocketView : UIView

- (void)startAnimationToCompletion:(animatedComplete)completion;

@end
