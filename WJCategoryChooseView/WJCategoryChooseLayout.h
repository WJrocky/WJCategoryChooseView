//
//  WJCategoryChooseLayout.h
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/25.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJCategoryChooseLayout : UICollectionViewFlowLayout
@property(nonatomic, assign)NSInteger lineHeight;
@property(nonatomic, assign)NSInteger rowWidth;
@property(nonatomic, assign)NSInteger sectionHeight;
@property(nonatomic, assign)NSInteger lastSectionHeight;
@property(nonatomic, assign)NSInteger cellHeight;
@property(nonatomic, strong)NSMutableDictionary *cellAttributesDic;
@property(nonatomic, strong)NSMutableDictionary *viewAttributesDic;
@property(nonatomic, strong)NSMutableArray *dataArray;

@end
