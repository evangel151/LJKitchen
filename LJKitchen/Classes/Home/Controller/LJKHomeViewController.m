//
//  LJKHomeViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKHomeViewController.h"
#import "LJKBasketController.h"
#import "LJKCreatRecipeController.h"
#import "LJKNetworkTool.h"
#import "LJKSearchBar.h"  // 搜索栏控件 
#import "LJKHomeHeader.h" // 首页的顶部视图（整体）

@interface LJKHomeViewController ()

@property (nonatomic, strong) LJKHomeHeader *homeHeader;

@end

@implementation LJKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = Color_BackGround;
//    [self setupBasic];
    [self setupNavigationBar];
    [self setupHomeHeader];
    [self loadStatus];

}

//- (void)setupBasic {
//    
//}

- (void)setupHomeHeader {
    // 顶部Header的总体高度 = 顶部关注栏 + 中部导航按钮 + 三餐scrollView + 新用户优惠() + 系统状态栏
    CGFloat homeHeaderSum = LJKHomeHeader_TopNav_Height + LJKHomeHeader_CenterNav_Height + LJKHomeHeader_CenterNav_Height + LJKHomeHeader_NewAuthor_Height + 20;
    self.homeHeader = [[LJKHomeHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, homeHeaderSum)];
    self.homeHeader.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = self.homeHeader;
    
}

- (void)setupNavigationBar {
    
    LJKSearchBar *searchBar = [LJKSearchBar searchBarWithPlaceholder:@"菜谱、食材"];
    self.navigationItem.titleView = searchBar;
//    WeakSelf;
    searchBar.searchBarShouldBeginEditingBlock = ^{
        
        
    };
    
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"homepageCreateRecipeButton"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(creatRecipe)];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"buylistButtonImage"]
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(basket)];
}

- (void)creatRecipe {
    
    LJKCreatRecipeController *recipe = [[LJKCreatRecipeController alloc] init];
    [self.navigationController pushViewController:recipe animated:YES];
    
}

- (void)basket {
    LJKBasketController *basket = [[LJKBasketController alloc] init];
    [self.navigationController pushViewController:basket animated:YES];
}

- (void)loadStatus {
    
    // 首页TableView主体JSON
    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&api_key=07397197043fafe11ce5c65c10febf84&size=2&sk=EhUpkVYBSoOT9qAapL0BUw&api_sign=51332747ce48a674bcf0397392410b74&_ts=1465544264.130416&origin=iphone&version=5.5.0&timezone=Asia%2FShanghai&location_code=156320900000000&nonce=F5533FD9-6417-4335-962D-D92D5319250C";
    [LJKNetworkTool afnGet:url params:nil success:^(id json) {
        
//        NSLog(@"%@", json);
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}



@end
