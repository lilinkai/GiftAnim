//
//  GiftAnimOperation.h
//  huoJian
//
//  Created by lilinkainew on 2016/12/20.
//  Copyright © 2016年 7k7k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GiftAnimationModel;
@class GiftAnimationView;

@interface GiftAnimOperation : NSOperation

+ (GiftAnimOperation *)addGiftAnimOperationWithGiftModel:(GiftAnimationModel *)model animContentView:(UIView *)animContentView maxTop:(NSInteger)maxTop;

@end
