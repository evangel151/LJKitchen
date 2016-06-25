//
//  LJKTopicComposeBar.h
//  LJKitchen
//
//  Created by  a on 16/6/26.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^EditingTextBlock)(NSString *);

@interface LJKTopicComposeBar : UIView

/** 编辑输入框后的回调 */
@property (nonatomic, copy) EditingTextBlock editingTextBlock;

/**  */
+ (instancetype)addCompostBarWithEditingTextBlock:(EditingTextBlock)editingTextBlock;

@end
