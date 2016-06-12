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
#import "LJKSendMailViewController.h"
#import "LJKSuggestViewController.h"
#import "LJKBasicIconCell.h"
#import "LJKBasic2Cell.h"
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
        _suggestion = [UIButton buttonWithTitle:@"意见反馈"
                                     titleColor:Color_DarkGray
                                backgroundColor:Color_BackGround
                                       fontSize:21 
                                         target:self
                                         action:@selector(suggest)];
        _suggestion.frame = CGRectMake(0, SCREEN_HEIGHT - 44 - 50, SCREEN_WIDTH, 50);
    }
    return _suggestion;
}

- (UIButton *)header_sendMail {
    if (!_header_sendMail) {
        _header_sendMail = [UIButton buttonWithTitle:@"发一封信"
                                          titleColor:Color_DarkGray
                                     backgroundColor:Color_BackGround
                                            fontSize:21
                                              target:self
                                              action:@selector(send)];
    }
    return _header_sendMail;
}

- (UIImageView *)header_IconView {
    if (!_header_IconView) {
        _header_IconView = [[UIImageView alloc] init];
        _header_IconView.image = [UIImage imageNamed:@"sendMail"];
    }
    return _header_IconView;
}

- (UITableView *)messageView {
    if (!_messageView) {
        _messageView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - TABBAR_HEIGHT - 50) style:UITableViewStyleGrouped];
        _messageView.dataSource = self;
        _messageView.delegate = self;
    }
    return _messageView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = Color_BackGround;
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,
      [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    [self.view addSubview:self.messageView];
    self.messageView.backgroundColor = Color_BackGround;
    [self.messageView reloadData];
    [self.view addSubview:self.suggestion];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}



- (void)send {
    LJKSendMailViewController *sendMail = [[LJKSendMailViewController alloc] init];
    [self.navigationController pushViewController:sendMail animated:YES];
     NSLog(@"跳转至发送邮件界面——————");
}

- (void)suggest {
    LJKSuggestViewController *suggest = [[LJKSuggestViewController alloc] init];
    [self.navigationController pushViewController:suggest animated:YES];
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

    LJKBasic2Cell *cell = [LJKBasic2Cell cellWithTableView:tableView];
    NSString *iconName = [NSString stringWithFormat:@"market_menu_%ld",indexPath.row + 1];
    UIImage *roundIcon = [[UIImage imageNamed:iconName] imageByRoundCornerRadius:89];
    cell.iconView.image = roundIcon;
    cell.nameLabelTop.text = [NSString stringWithFormat:@"姓名板--%zd", indexPath.row + 1];
    cell.talkLabelBottom.text = [NSString stringWithFormat:@"最后一条对话--%zd", indexPath.row + 1];
    cell.timeLabel.text = [NSString stringWithFormat:@"时间戳--%zd", indexPath.row + 1];
    return cell;
}


// header & subviews
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    [self.header addSubview:self.header_IconView];
    [self.header addSubview:self.header_sendMail];
    
    [self.header_IconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 34));
        make.centerX.equalTo(_header.mas_centerX).offset(-60);
        make.top.equalTo(_header.mas_top).offset(8);
    }];
    
    [self.header_sendMail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(84, 47));
        make.left.equalTo(_header_IconView.mas_right);
        make.centerY.equalTo(_header_IconView.mas_centerY);
    }];
    return self.header;
}

// 有确切高度header才能显示出来
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

#pragma mark - useless 
#pragma mark 移至 viewWillAppear 
//- (void)setupBasic {
//    self.view.backgroundColor = LJregular(230, 230, 230, 1);
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     [NSDictionary dictionaryWithObjectsAndKeys:LJregular(239, 51, 60, 1.0), NSForegroundColorAttributeName,
//      [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
//
////    [self.view addSubview:_suggestion];
////    [self.suggestion mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 50));
////        make.left.equalTo(self.view.mas_left);
////        make.bottom.equalTo(self.view.mas_bottom).offset(-44);
////    }];
//
//}

@end
