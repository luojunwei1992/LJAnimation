//
//  ViewController.m
//  transition
//
//  Created by comma on 16/6/2.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"
#import "Transition2.h"
#import "TransitionFromFirstToSecond.h"
#import "TransitionFromSecondToFirst.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.singerImage.layer.masksToBounds = YES;
    self.singerImage.layer.cornerRadius = 25;
    
    self.singerImage.userInteractionEnabled = YES;
    
    [self.singerImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentTo)]];
    
}


- (void)presentTo
{
    Transition2 *tran = [[Transition2 alloc] init];
    tran.transitioningDelegate = self;
    
    [self presentViewController:tran animated:YES completion:nil];
}


#pragma mark-------UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFromFirstToSecond alloc] init];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[TransitionFromSecondToFirst alloc] init];
}

@end
