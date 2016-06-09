//
//  LJKBasicCell.h
//  LJKitchen
//
//  Created by  a on 16/6/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKBasicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabelView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
