//
//  LJCarouselView.m
//  ADCarousel
//
//  Created by comma on 16/5/20.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "LJCarouselView.h"

#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width

#define MIN_MOVING_TIMEINTERVAL       0.1 //最小滚动时间间隔
#define DEFAULT_MOVING_TIMEINTERVAL   5.0 //默认滚动时间间隔
#define DELTA                         10  //误差


@interface LJCarouselView() <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) NSTimer *timer;


@end

@implementation LJCarouselView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self.delegate = self;
    self.dataSource = self;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    
    
    
    return [super initWithFrame:frame collectionViewLayout:layout];
}

@end
