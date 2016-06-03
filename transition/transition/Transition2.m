//
//  Transition2.m
//  transition
//
//  Created by comma on 16/6/2.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "Transition2.h"
#import "ViewController.h"


@implementation Transition2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.secondImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123"]];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    self.secondImageview.frame = CGRectMake(screenW / 2 - 100, screenH / 2 -100, 200, 200);
    self.secondImageview.layer.masksToBounds = YES;
    self.secondImageview.layer.cornerRadius = 100;
    
    [self.view addSubview:self.secondImageview];
    
    self.secondImageview.userInteractionEnabled = YES;
    
    [self.secondImageview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentTo)]];
    
}


- (void)presentTo
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
