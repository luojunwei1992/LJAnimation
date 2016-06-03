//
//  Launch.h
//  jianbianAnimation
//
//  Created by comma on 16/5/19.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger,LJDisAppearStyle){
    
    LJDisApperaStyleNone,
    LJDisApperaStyleOne,
    LJDisApperaStyleTwo,
    LJDisApperaStyleLeft,
    LJDisApperaStyleRight,
    LJDisApperaStyleBottom,
    LJDisApperaStyleTop,
    LJDisApperaStyleMiddle
};

@interface Launch : NSObject


@property (nonatomic,assign) CGRect iconFrame;

- (void)loadLaunchImageView:(NSString *)imgName
                  disappear:(LJDisAppearStyle)disappear;

@end
