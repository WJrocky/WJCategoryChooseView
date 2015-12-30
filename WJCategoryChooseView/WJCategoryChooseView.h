//
//  WJCategoryChooseView.h
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/25.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 注意：由于layout布局为从第二列开始布局，左边cell最后布局，故左边数据最后给
 */

@protocol WJCategoryChooseViewDelegate <NSObject>

- (void)categoryChooseViewDidSelectCell:(NSString *)title;

@end


@interface WJCategoryChooseView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionView *categoryChooseView;
@property (weak, nonatomic) id<WJCategoryChooseViewDelegate>delegate;
- (void)WJCategoryChooseViewGetDataSourceWithDataArray:(NSMutableArray *)dataArray;

@end
