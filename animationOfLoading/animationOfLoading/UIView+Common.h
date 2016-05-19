//
//  UIView+Common.h
//  animationOfLoading
//
//  Created by comma on 16/5/19.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EaseLoadingView;

@interface UIView (Common)

#pragma mark loadingView

@property (nonatomic,strong)EaseLoadingView *loadingView;

- (void)beginLoading;

- (void)endLoading;

@end

@interface EaseLoadingView : UIView

@property (nonatomic,strong) UIImageView *loadingView;
@property (nonatomic,assign) CGFloat loadingTime;
@property (nonatomic,assign,readonly) BOOL isLoading;

- (void)beginAnimation;

- (void)endAnimation;


@end


