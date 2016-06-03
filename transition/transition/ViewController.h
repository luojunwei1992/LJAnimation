//
//  ViewController.h
//  transition
//
//  Created by comma on 16/6/2.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *singerImage;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

