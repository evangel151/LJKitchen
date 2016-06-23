//
//  LJKSettingViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKSettingViewController.h"
#import "LJKNotificationViewController.h"
#import "LJKBasicCell.h"
#import "LJKSettingFooter.h"

@interface LJKSettingViewController ()
@property (nonatomic, strong) NSMutableArray *title_section1;
@property (nonatomic, strong) NSMutableArray *title_section2;
@property (nonatomic, strong) NSMutableArray *title_section3;
@property (nonatomic, strong) LJKSettingFooter *footer;
@end

@implementation LJKSettingViewController



- (NSMutableArray *)title_section1 {
    if (!_title_section1) {
        _title_section1 = [NSMutableArray arrayWithObjects:@"账号管理",@"设置密码",@"收货地址",@"发现好友", nil];
    }
    return _title_section1;
}

- (NSMutableArray *)title_section2 {
    if (!_title_section2) {
        _title_section2 = [NSMutableArray arrayWithObjects:@"消息推送", nil];
    }
    return _title_section2;
}

- (NSMutableArray *)title_section3 {
    if (!_title_section3) {
        _title_section3 = [NSMutableArray arrayWithObjects:@"把下厨房告诉朋友",@"帮助下厨房评分",nil];
    }
    return _title_section3;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.tableView.backgroundColor = Color_BackGround;
    self.tableView.bounces = NO;
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) { // 懒……
        return 1;
    } else if (section == 1) {
        return self.title_section1.count;
    } else if (section == 2) {
        return self.title_section2.count;
    } else {
        return self.title_section3.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKBasicCell *cell = [LJKBasicCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        UIImage *image = [UIImage imageNamed:@"market_menu_1"];
        // FIXME: (未解决)BasicCell无法满足"个人信息"cell的需要
//        cell.imageView.image = [image imageByRoundCornerRadius:cell.imageView.width * 0.5];
//        cell.titleLabelView.text = @"个人信息";
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = image;
        cell.imageView.contentMode = UIViewContentModeScaleToFill;
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.layer.cornerRadius = 50;
        cell.textLabel.text = @"栩池";
    } else if (indexPath.section == 1) {
        cell.titleLabelView.text = self.title_section1[indexPath.row];
    } else if (indexPath.section == 2) {
        cell.titleLabelView.text = self.title_section2[indexPath.row];
        cell.arrowView.hidden = YES;
    } else {
        cell.titleLabelView.text = self.title_section3[indexPath.row];
        cell.arrowView.hidden = YES;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 120;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 3) {
        self.footer = [LJKSettingFooter settingFooter];
        self.footer.version.text = @"版本号: 5.5";
        [self.footer.exit addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
        return self.footer;
    }
    return nil;
}

#pragma mark - cell & UI 事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 && indexPath.row == 0) { // 跳转至推送控制界面
        LJKNotificationViewController *noti = [[LJKNotificationViewController alloc] init];
        [self.navigationController pushViewController:noti animated:YES];
    } else if (indexPath.section == 3 && indexPath.row == 1) { // 为下厨房评分
        [self commitScore];
    }
}


- (void)commitScore {

    UIAlertController *alertVC =
       [UIAlertController alertControllerWithTitle:@"即将跳转至AppStore为LJKitchen评分"
                                           message:@"但是并没有上架……"
                                    preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *appStore = [UIAlertAction actionWithTitle:@"前往AppStore"
                                                       style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancel   = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel handler:nil];

    [alertVC addAction:appStore];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)exit {
    UIAlertController *alertVC =
    [UIAlertController alertControllerWithTitle:@"确定要退出LJKitchen么？"
                                        message:nil
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"我只是手滑点错了……"
                                                       style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *tureExit = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [SVProgressHUD showSuccessWithStatus:@"Bye~"];
        
    }];
    
    [alertVC addAction:no];
    [alertVC addAction:tureExit];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
