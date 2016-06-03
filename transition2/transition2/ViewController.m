//
//  ViewController.m
//  transition2
//
//  Created by comma on 16/6/3.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"
#import "SecondVc.h"
#import "TransitionFromFirstToSecond.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.fristImageView.userInteractionEnabled = YES;
    
    [self.fristImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pick)]];
    
}

- (void)pick{
    
    
    NSLog(@"---------------");
    
    SecondVc *secV = [[SecondVc alloc] init];
    secV.transitioningDelegate = self;
    
    
    [self presentViewController:secV animated:YES completion:nil];
}


#pragma  mark -------uIViewControllerContextTransitioning

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFromFirstToSecond alloc] init];
}

@end
