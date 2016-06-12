//
//  LJKMarketSortCell.h
//  LJKitchen
//
//  Created by  a on 16/6/10.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJKMarketSortCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *sortItemView;
/* 方块视图的缓存池标示 */
+ (NSString *)cellIdentifier;
/* 获取方块视图对象 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                          forIndexPath:(NSIndexPath *)indexPath;
@end
