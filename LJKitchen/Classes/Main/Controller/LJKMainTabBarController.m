//
//  LJKMainTabBarController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKMainTabBarController.h"
#import "LJKNavigationController.h"
#import "LJKHomeViewController.h"
#import "LJKMarketViewController.h"
#import "LJKMessageViewController.h"
#import "LJKProfileViewController.h"

@interface LJKMainTabBarController ()

@end

@implementation LJKMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LJKHomeViewController *home       = [[LJKHomeViewController alloc] init];
    LJKMarketViewController *market   = [[LJKMarketViewController alloc] init];
    LJKMessageViewController *message = [[LJKMessageViewController alloc] init];
    LJKProfileViewController *profile = [[LJKProfileViewController alloc] init];
    
    [self addChildViewController:home title:@"下厨房" image:@"tabADeselected" selectedImage:@"tabASelected"];
    [self addChildViewController:market title:@"市集" image:@"tabCSelected-1" selectedImage:@"tabBSelected"];
    [self addChildViewController:message title:@"信箱" image:@"tabCDeselected" selectedImage:@"tabCSelected"];
    [self addChildViewController:profile title:@"我" image:@"tabDDeselected" selectedImage:@"tabDSelected"];
}

- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString *)title
                         image:(NSString *)image
                 selectedImage:(NSString *)selectedImage {
    
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    childVc.title = title;
    
    LJKNavigationController *naviVc = [[LJKNavigationController alloc] initWithRootViewController:childVc];
    [naviVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:LJregular(239, 51, 60, 1.0)} forState:UIControlStateSelected];
    [self addChildViewController:naviVc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
