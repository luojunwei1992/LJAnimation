//
//  ViewController.m
//  animationOfLoading
//
//  Created by comma on 16/5/19.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view beginLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
