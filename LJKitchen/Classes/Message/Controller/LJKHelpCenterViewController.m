//
//  LJKHelpCenterViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKHelpCenterViewController.h"
#import "LJKHelpDetailController.h"
#import "LJKBasicCell.h"

@interface LJKHelpCenterViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *helpView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@end

@implementation LJKHelpCenterViewController

- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        self.titleArray = [NSMutableArray arrayWithObjects:@"账号相关",@"菜谱相关",@"作品相关",@"菜单相关",@"登录相关",@"其他", nil];
    }
    return _titleArray;
}


- (UITableView *)helpView {
    if (!_helpView) {
        _helpView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _helpView.dataSource = self;
        _helpView.delegate = self;
    }
    return _helpView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_BackGround;
    [self.view addSubview:self.helpView];
}

#pragma mark UITableViewDataSource & UITableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKBasicCell *cell = [LJKBasicCell cellWithTableView:tableView];
    cell.titleLabelView.text = [NSString stringWithFormat:@"%@", self.titleArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LJKHelpDetailController *detail = [[LJKHelpDetailController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
    NSLog(@"跳转至帮助页面——————");
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"常见问题";
    }
    return nil;
}

@end
