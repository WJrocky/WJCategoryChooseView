//
//  categoryChooseDataModel.m
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/27.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import "categoryChooseDataModel.h"

@implementation categoryChooseDataModel

- (instancetype)initWithTitle:(NSString *)title
                        Value:(NSString *)value
                     IsChosen:(BOOL)isChosen
{
    self = [super init];
    if (self) {
        _title = title;
        _value = value;
        _isChosen = isChosen;
    }
    return self;
}

@end
