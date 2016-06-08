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

@interface LJKProfileViewController ()

@end

@implementation LJKProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:LJregular(239, 51, 60, 1.0), NSForegroundColorAttributeName,
      [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    
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

- (void)findFriend {
    
    LJKFindFriendViewController *findFriend = [[LJKFindFriendViewController alloc] init];
    [self.navigationController pushViewController:findFriend animated:YES];
    
}

//
- (void)setting {
    LJKSettingViewController *setting = [[LJKSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
