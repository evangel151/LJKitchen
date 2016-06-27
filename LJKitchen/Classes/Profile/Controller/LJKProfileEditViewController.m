//
//  LJKProfileEditViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/28.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKProfileEditViewController.h"

#import "LJKProfileEditHeader.h"

@interface LJKProfileEditViewController ()

@end

@implementation LJKProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_BackGround;
    [self setupNavigationBar];
    [self setupTalbeViewHeader];
    [self setupTableView];
}

- (void)setupNavigationBar {
    self.title = @"编辑个人资料";
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"保存"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(saveProfileInfo)];
    self.navigationItem.rightBarButtonItem.tintColor = Color_ThemeColor;
}

- (void)setupTalbeViewHeader {
    LJKProfileEditHeader *header = [[LJKProfileEditHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    
    self.tableView.tableHeaderView = header;
}

- (void)setupTableView {
    
}

#pragma mark - TableView 数据源 & 代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}


#pragma mark - 点击事件
- (void)saveProfileInfo {
     NSLog(@"保存个人信息——————");
}


@end
