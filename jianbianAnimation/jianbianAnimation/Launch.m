//
//  Launch.m
//  jianbianAnimation
//
//  Created by comma on 16/5/19.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "Launch.h"

@interface Launch ()

@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UIImageView *launchImage;
@property (nonatomic,strong) UIView *dumy;

@end

@implementation Launch

- (void)loadLaunchImageView:(NSString *)imgName
                  disappear:(LJDisAppearStyle)disappear
{
    
    self.launchImage = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.launchImage.image = [UIImage imageNamed:imgName];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:_launchImage];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self dismissAll:disappear];
        
    });
}

- (void)dismissAll:(LJDisAppearStyle)style
{
    if (style == LJDisApperaStyleNone) {
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];
        
    }else if (style == LJDisApperaStyleOne){
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
            //x,y,z 放大缩小倍数
            _launchImage.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.5, 0.5, 0.5);
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];

        
    
    }else if (style == LJDisApperaStyleTwo){
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
            //x,y,z 放大缩小倍数
            _launchImage.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.5);
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];
        
        
        
    }else if (style == LJDisApperaStyleLeft){
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
            CGRect frame = _launchImage.frame;
            frame.origin.x = - [UIScreen mainScreen].bounds.size.width;
            _launchImage.frame = frame;
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];

        
        
    }else if (style == LJDisApperaStyleRight){
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
            CGRect frame = _launchImage.frame;
            frame.origin.x = [UIScreen mainScreen].bounds.size.width;
            _launchImage.frame = frame;
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];

        
    }else if (style == LJDisApperaStyleBottom){
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
            CGRect frame = _launchImage.frame;
            frame.origin.y = - [UIScreen mainScreen].bounds.size.height;
            _launchImage.frame = frame;
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];

        
    }else{
        
        [UIView animateWithDuration:1.5f animations:^{
            
            _launchImage.alpha = 0.0f;
            
            CGRect frame = _launchImage.frame;
            frame.origin.y = [UIScreen mainScreen].bounds.size.height;
            _launchImage.frame = frame;
            
        } completion:^(BOOL finished) {
            
            [_launchImage removeFromSuperview];
        }];
 
    
    }
}


@end
