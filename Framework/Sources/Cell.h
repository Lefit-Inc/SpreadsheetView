//
//  Cell.h
//  SpreadsheetView
//
//  Created by karos li on 2018/1/25.
//  Copyright © 2018年 Kishikawa Katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Gridlines;
@class Borders;

@interface Cell : UIView

@property (nonatomic, strong, readonly) UIView *contentView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *selectedBackgroundView;
@property (nonatomic, assign) BOOL isHighlighted;
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, strong) Gridlines* gridlines;
@property (nonatomic, strong) Borders* borders;

@property (nonatomic, copy) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL hasBorder;
@property (nonatomic, copy) NSString *reuseIdentifier;

- (void)prepareForReuse;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;

@end
