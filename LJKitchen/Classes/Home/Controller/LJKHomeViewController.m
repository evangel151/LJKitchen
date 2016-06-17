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

#import "LJKNavContent.h"


#import <MJExtension.h>

@interface LJKHomeViewController ()

@property (nonatomic, strong) LJKHomeHeader *homeHeader;
@property (nonatomic, strong) NSMutableArray *feedsArray;

@end

@implementation LJKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = Color_BackGround;
    [self setupNavigationBar];
    [self setupHomeHeader];
    [self loadStatus];

}



- (void)setupHomeHeader {
    
    // 加载Header数据
    [self loadNavData];
    
    // 加载header界面
    // 顶部Header的总体高度 = 顶部关注栏 + 中部导航按钮 + 三餐scrollView + 新用户优惠() + 系统状态栏
    CGFloat homeHeaderSum = LJKHomeHeader_TopNav_Height + LJKHomeHeader_CenterNav_Height + LJKHomeHeader_CenterNav_Height + LJKHomeHeader_NewAuthor_Height + 20;
    self.homeHeader = [[LJKHomeHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, homeHeaderSum)];
    self.homeHeader.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = self.homeHeader;
    
    // header业务逻辑
    WeakSelf;
    self.homeHeader.clickBlock = ^(NSInteger clickedAction) {
        // 本周流行菜谱
        if (clickedAction == viewDidClickedActionPopularImageView) {
            [SVProgressHUD showSuccessWithStatus:@"暂无对应数据"];
        }
        // 关注动态
        else if (clickedAction == viewDidClickedActionFeedsView) {
//            [weakSelf.navigationController pushViewController:[[XCFFeedsViewController alloc] init] animated:YES];
        }
        // 排行榜
        else if (clickedAction == viewDidClickedActionTopListButton) {
            [weakSelf pushWebViewWithUrl:LJKRequestKitchenRankingList];
        }
        // 看视频
        else if (clickedAction == viewDidClickedActionVideoButton) {
            [SVProgressHUD showSuccessWithStatus:@"视频界面数据无法抓包"];
        }
        // 买买买
        else if (clickedAction == viewDidClickedActionBuyButton) {
//            [weakSelf.navigationController pushViewController:[[XCFKitchenBuyViewController alloc] init] animated:YES];
        }
        // 菜谱分类
        else if (clickedAction == viewDidClickedActionRecipeCategoryButton) {
            [weakSelf pushWebViewWithUrl:LJKRequestKitchenRecipeCategory];
        }
        // 三餐
        else if (clickedAction == viewDidClickedActionBreakfast
                 || clickedAction == viewDidClickedActionLunch
                 || clickedAction == viewDidClickedActionSupper) {
//            [weakSelf.navigationController pushViewController:[[XCFMealViewController alloc] init]animated:YES];
        } else if (clickedAction == viewDidClickedActionFristAuthor) {
            [SVProgressHUD showSuccessWithStatus:@"跳转至红包界面"];
        }
    };
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


#pragma mark - 数据处理 

- (void)loadNavData {
    // 首页Header数据
    // 官方的版本号似乎没更新……
//    NSString *headerUrl = @"http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
    
    [LJKNetworkTool afnGet:LJKRequestKitchenNav params:nil success:^(id json) {

        self.homeHeader.navContent = [LJKNavContent mj_objectWithKeyValues:json[@"content"]];
        NSLog(@"%@", json);
    } failure:^(NSError *error) {
        NSLog(@"加载header失败 原因:%@", error);
    }];
    
    [LJKNetworkTool afnGet:LJKRequestKitchenFeeds params:nil success:^(id json) {
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"加载header失败 原因:%@", error);
    }];

}

- (void)loadStatus {
    
    // 首页TableView主体JSON
    
    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&api_key=07397197043fafe11ce5c65c10febf84&size=2&sk=EhUpkVYBSoOT9qAapL0BUw&api_sign=51332747ce48a674bcf0397392410b74&_ts=1465544264.130416&origin=iphone&version=5.5.0&timezone=Asia%2FShanghai&location_code=156320900000000&nonce=F5533FD9-6417-4335-962D-D92D5319250C";
    [LJKNetworkTool afnGet:url params:nil success:^(id json) {
        
//        NSLog(@"%@", json);
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 导航按钮点击方法
/** 跳转至创建菜谱界面 */
- (void)creatRecipe {
    LJKCreatRecipeController *recipe = [[LJKCreatRecipeController alloc] init];
    [self.navigationController pushViewController:recipe animated:YES];
    
}

/** 跳转至菜篮子界面 */
- (void)basket {
    LJKBasketController *basket = [[LJKBasketController alloc] init];
    [self.navigationController pushViewController:basket animated:YES];
}

#pragma mark - TableView 数据源及代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}



@end
