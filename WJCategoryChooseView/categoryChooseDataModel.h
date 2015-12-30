//
//  categoryChooseDataModel.h
//  WJCategoryChooseView
//
//  Created by Rocky on 15/12/27.
//  Copyright © 2015年 Rocky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface categoryChooseDataModel : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *value;
@property(nonatomic, assign) BOOL isChosen;
- (instancetype)initWithTitle:(NSString *)title
                        Value:(NSString *)value
                     IsChosen:(BOOL)isChosen;

@end
