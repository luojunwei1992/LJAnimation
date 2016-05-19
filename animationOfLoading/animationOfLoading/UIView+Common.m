//
//  UIView+Common.m
//  animationOfLoading
//
//  Created by comma on 16/5/19.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "UIView+Common.h"
#import <objc/runtime.h>

@implementation UIView (Common)

static char LoadingViewKey;

- (EaseLoadingView *)loadingView
{
    return objc_getAssociatedObject(self, &LoadingViewKey);
}

- (void)setLoadingView:(EaseLoadingView *)loadingView
{
    objc_setAssociatedObject(self, &LoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN);
}

- (void)beginLoading
{
    self.loadingView = [[EaseLoadingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [self addSubview:self.loadingView];
    
    [self.loadingView beginAnimation];
}

@end


@implementation EaseLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor  colorWithRed:238.0f / 255.0f green:238.0f / 255.0f blue:238.0f / 255.0f alpha:1.0f];
        
        _loadingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading1_2x.png"]];
        
        CGFloat loadingX = ([UIScreen mainScreen].bounds.size.width - 60) / 2;
        CGFloat loadingY = [UIScreen mainScreen].bounds.size.height / 2 - 60;
        
        _loadingView.frame = CGRectMake(loadingX, loadingY, 60, 60);
        
        [self addSubview:_loadingView];
    }
    
    return self;
}

- (void)beginAnimation{

    if (_isLoading) {
        
        return;
    }
    
    _isLoading = YES;
    
    [self loadingAnimation];
}

- (void)endAnimation{
    
    self.hidden = YES;
    _isLoading = NO;
    
    [self.loadingView stopAnimating];
}


- (void)loadingAnimation{
    
    static CGFloat duration = 1.0f;
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 1; i <= 12; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading%d_2x.png", i]];
        
        [images addObject:image];
    }
    
    self.loadingView.animationImages = images;
    self.loadingView.animationDuration = duration;
    [self.loadingView startAnimating];
    

}

@end
