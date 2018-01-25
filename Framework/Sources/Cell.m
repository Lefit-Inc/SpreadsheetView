//
//  Cell.m
//  SpreadsheetView
//
//  Created by karos li on 2018/1/25.
//  Copyright © 2018年 Kishikawa Katsumi. All rights reserved.
//

#import "Cell.h"
#import "SpreadsheetView-Swift.h"
//#import <SpreadsheetView/Sp>

@interface Cell()

@property (nonatomic, strong, readwrite) UIView *contentView;

@end

@implementation Cell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setup];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self setup];
    
    return self;
}

- (void)setup {
    self.hasBorder = NO;
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.frame = self.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self insertSubview:self.contentView atIndex:0];
}

#pragma mark - public methods
- (void)prepareForReuse {
    
}

#pragma mark - public property
- (void)setBackgroundView:(UIView *)backgroundView {
    if (_backgroundView) {
        [_backgroundView removeFromSuperview];
    }
    _backgroundView = backgroundView;
    
    if (backgroundView) {
        backgroundView.frame = self.bounds;
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self insertSubview:backgroundView atIndex:0];
    }
}

- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView {
    if (_selectedBackgroundView) {
        [_selectedBackgroundView removeFromSuperview];
    }
    _selectedBackgroundView = selectedBackgroundView;
    
    selectedBackgroundView.frame = self.bounds;
    selectedBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    selectedBackgroundView.alpha = 0;
    if (selectedBackgroundView) {
        [self insertSubview:selectedBackgroundView aboveSubview:self.backgroundView];
    } else {
        [self insertSubview:selectedBackgroundView atIndex:0];
    }
}

- (void)setIsHighlighted:(BOOL)isHighlighted {
    _isHighlighted = isHighlighted;
    self.selectedBackgroundView.alpha = isHighlighted || self.isSelected ? 1 : 0;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = self.isHighlighted;
    self.selectedBackgroundView.alpha = self.isHighlighted || _isSelected ? 1 : 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:[CATransaction animationDuration] animations:^{
            self.isSelected = selected;
        }];
    } else {
        self.isSelected = selected;
    }
}

#pragma mark - getter

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    
    return _contentView;
}

@end
