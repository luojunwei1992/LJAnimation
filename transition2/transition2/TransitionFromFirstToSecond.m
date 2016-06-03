//
//  TransitionFromFirstToSecond.m
//  transition2
//
//  Created by comma on 16/6/3.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "TransitionFromFirstToSecond.h"
#import "ViewController.h"
#import "SecondVc.h"

@implementation TransitionFromFirstToSecond

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //获得to，from，context
    ViewController *fromV = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    SecondVc *toV = (SecondVc *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containV = [transitionContext containerView];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    //添加tov
    toV.view.frame = CGRectMake(screenW, 0, screenW, screenH);
    
    [containV addSubview:toV.view];
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        fromV.fristImageView.layer.transform=CATransform3DMakeRotation(M_PI, 0, 1, 0);
        
        fromV.view.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [fromV.view removeFromSuperview];

        
        [UIView animateWithDuration:0.3 animations:^{
            
                CGRect frame = toV.view.frame;
                frame.origin.x = 0;
                toV.view.frame = frame;
            
            
        }];
            
            
        [transitionContext completeTransition:YES];
                    

        
    }];
    
    
}

@end
