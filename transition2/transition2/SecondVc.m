//
//  SecondVc.m
//  transition2
//
//  Created by comma on 16/6/3.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "SecondVc.h"

@interface SecondVc ()

@end

@implementation SecondVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.secondImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123"]];
    
    self.secondImageV.frame = [UIScreen mainScreen].bounds;
    
    [self.view addSubview:self.secondImageV];
}



@end
