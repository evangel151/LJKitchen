//
//  LJKMessageViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKMessageViewController.h"
#import "LJKCommunityViewController.h"
#import "LJKNotificationViewController.h"
#import <Masonry.h>

@interface LJKMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *messageView;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIImageView *header_IconView;
@property (nonatomic, strong) UIButton *header_sendMail;

@property (nonatomic, strong) UIButton *suggestion; // 意见及建议
@end

@implementation LJKMessageViewController

- (UIButton *)suggestion {
    if (!_suggestion) {
        _suggestion = [[UIButton alloc] init];
        _suggestion.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 50, SCREEN_HEIGHT - 44 - 50, 100, 50);
        [_suggestion setTitle:@"意见反馈" forState:UIControlStateNormal];
        [_suggestion addTarget:self action:@selector(suggest) forControlEvents:UIControlEventTouchUpInside];
        [_suggestion setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:_suggestion];
    }
    return _suggestion;
}


- (UIImageView *)header_IconView {
    if (!_header_IconView) {
        _header_IconView = [[UIImageView alloc] init];
//        _header_IconView.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 85, 0, 85, 50);
        _header_IconView.image = [UIImage imageNamed:@"sendMail"];
        [self.header addSubview:_header_IconView];
    }
    return _header_IconView;
}

- (UIButton *)header_sendMail {
    if (!_header_sendMail) {
        _header_sendMail = [[UIButton alloc] init];
//        _header_sendMail.frame = CGRectMake(SCREEN_WIDTH * 0.5, 0, 85, 50);
        [_header_sendMail setTitle:@"发一封信" forState:UIControlStateNormal];
        [_header_sendMail addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
        [_header_sendMail setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.header addSubview:_header_sendMail];
    }
    return _header_sendMail;
}

- (UITableView *)messageView {
    if (!_messageView) {
        _messageView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBAR_HEIGHT - 50) style:UITableViewStyleGrouped];
        _messageView.dataSource = self;
        _messageView.delegate = self;

        [self.view addSubview:_messageView];
    }
    return _messageView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.messageView reloadData];
    self.messageView.backgroundColor = LJregular(230, 230, 230, 1);

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBasic];
    [self setupNavigationBar];
}

- (void)setupBasic {
    self.view.backgroundColor = LJregular(230, 230, 230, 1);
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:LJregular(239, 51, 60, 1.0), NSForegroundColorAttributeName,
      [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    
    
//    [self.suggestion mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 50));
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
//    }];
//    
}

- (void)send {
     NSLog(@"跳转至发送邮件界面——————");
}

- (void)suggest {
     NSLog(@"跳转至意见反馈界面——————");
}

- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviCommunity"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(community)];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviNotification"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(notification)];
}

- (void)community {
    
    LJKCommunityViewController *community = [[LJKCommunityViewController alloc] init];
    [self.navigationController pushViewController:community animated:YES];
    
}

- (void)notification {
    LJKNotificationViewController *notification = [[LJKNotificationViewController alloc] init];
    [self.navigationController pushViewController:notification animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据 --%zd", indexPath.row + 1];
    return cell;
}


// header & subviews
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    
    [self.header_IconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(84, 47));
        make.centerX.equalTo(_header.mas_centerX).offset(-84);
        make.top.equalTo(_header.mas_top).offset(1);
    }];
    
    [self.header_sendMail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(_header_IconView);
        make.left.equalTo(_header_IconView.mas_right);
        make.centerY.equalTo(_header_IconView.mas_centerY);
    }];
    return self.header;
}

// 有确切高度header才能显示出来
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.messageView)
    {
        CGFloat sectionHeaderHeight = 50;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}


@end
