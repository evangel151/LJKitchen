//
//  LJKHomeHeaderDish.h
//  LJKitchen
//
//  Created by  a on 16/6/13.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJKPopEvent;
@interface LJKHomeHeaderDish : UIView

@property (nonatomic, strong, nonnull) LJKPopEvent *popEvent;

+ (nonnull LJKHomeHeaderDish *)viewWithPopEvent:(nonnull LJKPopEvent *)popEvent
                                        target:(nullable id)target
                                        action:(nullable SEL)action;


@end
