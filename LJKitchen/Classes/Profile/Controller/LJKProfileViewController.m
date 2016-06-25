//
//  LJKProfileViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKProfileViewController.h"
#import "LJKFindFriendViewController.h"
#import "LJKSettingViewController.h"
#import "LJKProfileHeader.h"

#import "LJKAuthorDetail.h"
#import "LJKMyInfo.h"


@interface LJKProfileViewController ()
@property (nonatomic, strong) LJKAuthorDetail *authorDetail;
@end

@implementation LJKProfileViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,
      [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.authorDetail = [LJKMyInfo  info];
    [self setupNavigationBar];
    [self setupHeader];
    
}

- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navFindFriendsImage"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(findFriend)];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"rightPageSetting"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(setting)];
}

- (void)setupHeader {
    CGFloat headerH = 100 + 90 + 44;
    LJKProfileHeader *header = [[LJKProfileHeader alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, headerH)];
    header.authorDetail = self.authorDetail;
    [self.view addSubview:header];
}

// 跳转至 “寻找厨友”
- (void)findFriend {
    LJKFindFriendViewController *findFriend = [[LJKFindFriendViewController alloc] init];
    [self.navigationController pushViewController:findFriend animated:YES];
    
}

// 跳转至 “设置”
- (void)setting {
    LJKSettingViewController *setting = [[LJKSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}



#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}


@end
