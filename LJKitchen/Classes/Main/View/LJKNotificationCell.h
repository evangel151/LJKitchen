//
//  LJKNotificationCell.h
//  LJKitchen
//
//  Created by  a on 16/6/11.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKNotificationCell : UITableViewCell
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *statusLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
