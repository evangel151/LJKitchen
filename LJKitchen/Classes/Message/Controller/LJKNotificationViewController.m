//
//  LJKNotificationViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKNotificationViewController.h"
#import "LJKNotificationCell.h"

@interface LJKNotificationViewController ()

@property (nonatomic, strong) NSMutableArray *title_section0;
@property (nonatomic, strong) NSMutableArray *title_section1;
@property (nonatomic, strong) NSMutableArray *title_section2;
@property (nonatomic, strong) NSMutableArray *title_section3;
@property (nonatomic, strong) NSMutableArray *headerStrings;
@property (nonatomic, strong) LJKNotificationCell *cell;
@property (nonatomic, strong) NSMutableArray *cells;
@end

@implementation LJKNotificationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推送与提醒";
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = Color_BackGround;
}

#pragma mark - TableView 数据源 & 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
        case 0: {
            return self.title_section0.count;
            break;
        }
        case 1: {
            return self.title_section1.count;
            break;
        }
        case 2: {
            return self.title_section2.count;
            break;
        }
        case 3: {
           return self.title_section3.count;
            break;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 60;
    } else {
        return 44;
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.headerStrings[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LJKNotificationCell *cell = [LJKNotificationCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.section) {
        case 0: {
            cell.statusLabel.text = @"已关闭";
            cell.switchView.hidden = YES;
            cell.accessoryView = cell.statusLabel;
            cell.textLabel.text = self.title_section0[indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
           break;
        }
        case 1: {
            cell.statusLabel.hidden = YES;
            cell.switchView.on = YES;
            cell.accessoryView = cell.switchView;
            cell.textLabel.text = self.title_section1[indexPath.row];
            break;
        }
        case 2: {
            cell.statusLabel.hidden = YES;
            cell.switchView.on = YES;
            cell.accessoryView = cell.switchView;
            cell.textLabel.text = self.title_section2[indexPath.row];
            break;
        }
        case 3: {
            cell.statusLabel.hidden = YES;
            cell.switchView.on = YES;
            cell.accessoryView = cell.switchView;
            cell.textLabel.text = self.title_section3[indexPath.row];
            break;
        }
            
    }
    [self.cells addObject:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {

//        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//        [SVProgressHUD showErrorWithStatus:@"即将跳转至系统设置界面"];        
        UIAlertController *alertVC =
        [UIAlertController alertControllerWithTitle:@"LJKitchen将要前往本机的通知中心，确认前往吗？"
                                            message:@"开启系统推送通知，享受快乐厨房生活"
                                     preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *appStore = [UIAlertAction actionWithTitle:@"前往"
                                                           style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *cancel   = [UIAlertAction actionWithTitle:@"我再看看"
                                                           style:UIAlertActionStyleCancel handler:nil];
        
        [alertVC addAction:appStore];
        [alertVC addAction:cancel];
        [self presentViewController:alertVC animated:YES completion:nil];
        
    }
    
    // FIXME: (无用...)一键全开/全关……
    // 问题是为什么呢 =。=....
//        else if (indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 3) {
//        for (int i = 0; i < self.cells.count; i++) {
//            self.cell = self.cells[i];
//            if (self.cell.switchView.on) {
//                [self.cell.switchView setOn:NO animated:YES];
//            } else {
//                [self.cell.switchView setOn:YES animated:YES];
//            }
//
//        }
//    }
}

#pragma mark - 懒加载
- (NSMutableArray *)title_section0 {
    if (!_title_section0) {
        _title_section0 = [NSMutableArray arrayWithObjects:@"系统推送通知", nil];
    }
    return _title_section0;
}

- (NSMutableArray *)title_section1 {
    if (!_title_section1) {
        _title_section1 = [NSMutableArray arrayWithObjects:@"有人关注你",@"可能认识的人", nil];
    }
    return _title_section1;
}

- (NSMutableArray *)title_section2 {
    if (!_title_section2) {
        _title_section2 = [NSMutableArray arrayWithObjects:@"有人称赞我的作品",@"有人回应我的作品",@"有人回应我的菜谱",@"有人回应我的话题", nil];
    }
    return _title_section2;
}

- (NSMutableArray *)title_section3 {
    if (!_title_section3) {
        _title_section3 = [NSMutableArray arrayWithObjects:@"有人发给我新的消息",nil];
    }
    return _title_section3;
}

- (NSMutableArray *)headerStrings {
    if (!_headerStrings) {
        _headerStrings = [NSMutableArray arrayWithObjects:@"系统",@"用户关注",@"我的内容",@"信箱",nil];
    }
    return _headerStrings;
}

- (NSMutableArray *)cells {
    if (!_cells) {
        _cells = [NSMutableArray array];
    }
    return _cells;
}
@end
