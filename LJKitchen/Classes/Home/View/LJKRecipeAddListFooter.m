//
//  LJKRecipeAddListFooter.m
//  LJKitchen
//
//  Created by  a on 16/7/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKRecipeAddListFooter.h"

#import <Masonry.h>

@interface LJKRecipeAddListFooter ()

@property (nonatomic, strong) UIButton *addListButton;

@end

@implementation LJKRecipeAddListFooter

- (UIButton *)addListButton {
    if (!_addListButton) {
        _addListButton = [UIButton buttonWithTitle:@"加入菜单"
                                        titleColor:Color_TintWhite
                                   backgroundColor:Color_ThemeColor
                                          fontSize:15
                                            target:self
                                            action:@selector(addListButtonDidClicked)];
        
    }
    return _addListButton;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = Color_TintWhite;
        
        [self addSubview:self.addListButton];
        
        [_addListButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
    }
    return self;
}

#pragma mark - 点击事件
- (void)addListButtonDidClicked {
    !self.footerActionBlock ? : self.footerActionBlock();
}

@end
