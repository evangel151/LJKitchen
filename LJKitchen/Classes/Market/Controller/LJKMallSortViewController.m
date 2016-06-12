
//
//  LJKMallSortViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/8.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKMallSortViewController.h"
#import "LJKMarketSortCell.h"
#import "LJKShoppingSortViewController.h"
@interface LJKMallSortViewController ()

@end

@implementation LJKMallSortViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    // 创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 2) / 3, (SCREEN_WIDTH - 2) / 3);
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
//    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"市集分类";
    self.collectionView.backgroundColor = Color_BackGround;
    self.collectionView.bounces = NO;
    [self.collectionView registerClass:[LJKMarketSortCell class]
            forCellWithReuseIdentifier:[LJKMarketSortCell cellIdentifier]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shoppingCart"] style:UIBarButtonItemStylePlain target:self action:@selector(shoppingCart)];
}

- (void)shoppingCart {
    LJKShoppingSortViewController *cart = [[LJKShoppingSortViewController alloc] init];
    [self.navigationController pushViewController:cart animated:YES];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LJKMarketSortCell *cell = [LJKMarketSortCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"market_menu_%zd",indexPath.item + 1];
    cell.sortItemView.image = [UIImage imageNamed:imageName];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *imageName = [NSString stringWithFormat:@"market_menu_%zd",indexPath.item + 1];
    
    [SVProgressHUD showImage:[UIImage imageNamed:@"notification"] status:@"即将跳转对应的搜索结果"];
    NSLog(@"点击了第%zd个item,即将跳转对应的搜索结果", indexPath.item + 1);
}


@end
