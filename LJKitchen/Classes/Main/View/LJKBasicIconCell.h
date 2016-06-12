//
//  LJKBasicIconCell.h
//  LJKitchen
//
//  Created by  a on 16/6/11.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKBasicIconCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *talkLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
