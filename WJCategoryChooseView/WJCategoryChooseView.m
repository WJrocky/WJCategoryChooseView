//
//  WJCategoryChooseView.m
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/25.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import "WJCategoryChooseView.h"
#import "WJCategoryChooseLayout.h"
#import "categoryChooseDataModel.h"
static NSString *const identifier = @"cell";
static NSString *const footIndentifier = @"foot";
@implementation WJCategoryChooseView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"WJCategoryChooseView" owner:self options:nil]lastObject];
        view.frame = self.bounds;
        view.backgroundColor = [UIColor brownColor];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:0];
       NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:0];
       NSLayoutConstraint *right =  [NSLayoutConstraint constraintWithItem:view
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:0];
       NSLayoutConstraint *left =  [NSLayoutConstraint constraintWithItem:view
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:0];
        [self addConstraints:@[top,bottom,left,right]];
        top.active = YES;
        bottom.active = YES;
        right.active = YES;
        left.active = YES;
        
        [self.categoryChooseView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
        [self.categoryChooseView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIndentifier];
        WJCategoryChooseLayout *layout = [[WJCategoryChooseLayout alloc]init];
        self.categoryChooseView.collectionViewLayout = layout;
    }
    return self;
}

- (void)WJCategoryChooseViewGetDataSourceWithDataArray:(NSMutableArray *)dataArray
{
    _dataArray = dataArray;
    WJCategoryChooseLayout *layout = (WJCategoryChooseLayout *)self.categoryChooseView.collectionViewLayout;
    layout.dataArray = dataArray;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    categoryChooseDataModel *model = [_dataArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.layer.cornerRadius = 5;

    NSInteger index = [_dataArray[indexPath.section] count] - 1 - indexPath.row;

    if ([cell.contentView subviews].count == 1) {
        UILabel *label = [[cell.contentView subviews]lastObject];
        [label removeFromSuperview];
    }
    if (index == 0) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, cell.bounds.size.height)];
        label.center = CGPointMake(cell.bounds.size.width/2 + 3, cell.bounds.size.height/2);
        cell.backgroundColor = [UIColor grayColor];
        label.numberOfLines = 0;
        [cell.contentView addSubview:label];
        label.text = model.title;

    } else {
        UILabel *label = [[UILabel alloc]initWithFrame:cell.bounds];
        label.backgroundColor = model.isChosen ? [UIColor purpleColor]:[UIColor whiteColor];
        [cell.contentView addSubview:label];
        label.text = model.title;
        cell.clipsToBounds = YES;
    }

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIndentifier forIndexPath:indexPath];
    view.backgroundColor = [UIColor blueColor];
    return view;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    categoryChooseDataModel *model = [_dataArray[indexPath.section] objectAtIndex:indexPath.row];
    if (model.isChosen) {
        model.isChosen = NO;
        [self.categoryChooseView reloadItemsAtIndexPaths:@[indexPath]];
    } else {
        model.isChosen = YES;
        [self.categoryChooseView reloadItemsAtIndexPaths:@[indexPath]];
    }
    if (self.delegate !=nil && [self.delegate respondsToSelector:@selector(categoryChooseViewDidSelectCell:)]) {
        [self.delegate categoryChooseViewDidSelectCell:model.title];
    }
}
@end
