//
//  Cell.m
//  SpreadsheetView
//
//  Created by karos li on 2018/1/25.
//  Copyright © 2018年 Kishikawa Katsumi. All rights reserved.
//

#import "Cell.h"
#import "Gridlines.swift"

@interface Cell()

@property (nonatomic, strong, readwrite) UIView *contentView;

@end

@implementation Cell

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

#pragma mark - getter

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    
    return _contentView;
}

@end
