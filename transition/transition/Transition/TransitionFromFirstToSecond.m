//
//  TransitionFromFirstToSecond.m
//  transition
//
//  Created by comma on 16/6/2.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "TransitionFromFirstToSecond.h"
#import "ViewController.h"
#import "Transition2.h"

@implementation TransitionFromFirstToSecond

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //得到转场动画的from和to
    ViewController *fromV = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    Transition2 *toV = (Transition2 *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containV = [transitionContext containerView];
    
    //获得image截图,并进行坐标转换
    UIView * imageSnap = [fromV.singerImage snapshotViewAfterScreenUpdates:YES];
    
    imageSnap.frame = [containV convertRect:fromV.singerImage.frame fromView:fromV.bottomView];
    
//    隐藏from的图片
    fromV.singerImage.hidden = YES;
    
    toV.view.frame = [transitionContext finalFrameForViewController:toV];
    toV.view.alpha = 0;
    toV.secondImageview.hidden = YES;
    
    [containV addSubview:toV.view];
    [containV addSubview:imageSnap];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        toV.view.alpha = 1.0;
        
         NSLog(@"frame is %@",NSStringFromCGRect(imageSnap.frame));
        
        CGRect frame = [containV convertRect:toV.secondImageview.frame toView:toV.view];
        
        imageSnap.frame = frame;
        
        
    } completion:^(BOOL finished) {
        
        toV.secondImageview.hidden = NO;
        fromV.singerImage.hidden = NO;
        
        NSLog(@"frame is %@",NSStringFromCGRect(toV.secondImageview.frame));
        
        [imageSnap removeFromSuperview];
        
        [transitionContext completeTransition:YES];
    }];
    
}

@end