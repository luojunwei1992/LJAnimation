//
//  TransitionFromSecondToFirst.m
//  transition
//
//  Created by comma on 16/6/2.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "TransitionFromSecondToFirst.h"
#import "ViewController.h"
#import "Transition2.h"

@implementation TransitionFromSecondToFirst

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //得到转场动画的from和to
    ViewController *toV = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    Transition2 *fromV = (Transition2 *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containV = [transitionContext containerView];
    
    //获得image截图,并进行坐标转换
    UIView * imageSnap = [fromV.secondImageview snapshotViewAfterScreenUpdates:YES];
    
    imageSnap.frame = [containV convertRect:fromV.secondImageview.frame toView:fromV.view];
    
    //    隐藏from的图片
    fromV.secondImageview.hidden = YES;
    
    toV.view.frame = [transitionContext finalFrameForViewController:toV];
    toV.view.alpha = 0;
    toV.singerImage.hidden = YES;
    
    [containV addSubview:toV.view];
    [containV addSubview:imageSnap];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        toV.view.alpha = 1.0;
        
        NSLog(@"frame is %@",NSStringFromCGRect(imageSnap.frame));
        
        CGRect frame = [containV convertRect:toV.singerImage.frame fromView:toV.bottomView];
        
        imageSnap.frame = frame;
        
        
    } completion:^(BOOL finished) {
        
        toV.singerImage.hidden = NO;
        fromV.secondImageview.hidden = NO;
        
        
        [imageSnap removeFromSuperview];
        
        [transitionContext completeTransition:YES];
    }];
    

}

@end
