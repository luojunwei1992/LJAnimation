//
//  LJCarouselView.h
//  ADCarousel
//
//  Created by comma on 16/5/20.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJCarouselView;

@protocol LJCarouselViewDelegate <NSObject>

@optional

- (void)cycle:(LJCarouselView *)cycle didMoveToPage:(NSUInteger)page;

- (void)cycle:(LJCarouselView *)cycle didTouchPage:(NSInteger)page;

@end

@interface LJCarouselView : UICollectionView

@property (nonatomic,strong) NSArray *imageURLs;

@property (nonatomic,getter=isAutoMoving) BOOL autoMoving;

@property (nonatomic,assign) NSTimeInterval movingTimeInterval;

@property (nonatomic,weak) id<LJCarouselViewDelegate> pageDelegate;


- (void)startMoving;

- (void)stopMoving;

@end
