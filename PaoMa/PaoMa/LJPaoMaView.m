//
//  LJPaoMaView.m
//  PaoMa
//
//  Created by comma on 16/5/24.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "LJPaoMaView.h"

@interface LJPaoMaView ()

//左侧的label frame
@property (nonatomic,assign) CGRect currentFrame;

//右侧的label frame
@property (nonatomic,assign) CGRect behindFrame;

//存放label的数组
@property (nonatomic,strong) NSMutableArray *labelArray;

//label的高度
@property (nonatomic,assign) CGFloat labelHeight;

//是否暂停
@property (nonatomic,assign) BOOL isStop;

//循环的时间
@property (nonatomic,assign) NSInteger time;

//展示的内容视图
@property (nonatomic,strong) UIView *showContentView;

@end

@implementation LJPaoMaView

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        
        _showContentView =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        _showContentView.clipsToBounds = YES;
        
        [self addSubview:_showContentView];
        
        _labelHeight = frame.size.height;
        
        _time = title.length / 4;
        
        UILabel *myLabel = [[UILabel alloc] init];
        myLabel.text = title;
        myLabel.font = [UIFont systemFontOfSize:15.0f];
        myLabel.textColor = [UIColor blackColor];
        
        CGFloat calcuWidth = [self widthForTextString:title height:_labelHeight fontSize:15.0f];
        
        //进行判断，如果文本宽度大于视图宽度，生成2个label，就进行滚动，如果小于就不滚，生成一个label
        if(calcuWidth > frame.size.width){
            
            _currentFrame = CGRectMake(0, 0, calcuWidth, _labelHeight);
            _behindFrame = CGRectMake(_currentFrame.origin.x + _currentFrame.size.width, 0, calcuWidth, _labelHeight);
            
            myLabel.frame = _currentFrame;
            
            [_showContentView addSubview:myLabel];
            
            _labelArray = [NSMutableArray arrayWithObject:myLabel];
            
            UILabel *behindLabel = [[UILabel alloc]init];
            behindLabel.textColor = [UIColor blackColor];
            behindLabel.frame = _behindFrame;
            behindLabel.text = title;
            behindLabel.font = [UIFont systemFontOfSize:15.0f];
            [_labelArray addObject:behindLabel];
            [_showContentView addSubview:behindLabel];
            
            [self doAnimation];

        }else{
            
            myLabel.frame = CGRectMake(0, 0, self.frame.size.width, _labelHeight);
            
            myLabel.textAlignment = NSTextAlignmentCenter;
            
            [_showContentView addSubview:myLabel];
        
        }
        
    }
    
    return self;
}

- (void)doAnimation{

    [UIView animateWithDuration:_time delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        UILabel *one = _labelArray[0];
        UILabel *two = _labelArray[1];
        
        one.transform = CGAffineTransformMakeTranslation(- _currentFrame.size.width, 0);
        two.transform = CGAffineTransformMakeTranslation(- _currentFrame.size.width, 0);
        
    } completion:^(BOOL finished) {
        
        UILabel *one = _labelArray[0];
        UILabel *two = _labelArray[1];
        
        one.transform = CGAffineTransformIdentity;
        one.frame = _behindFrame;
        
        two.transform = CGAffineTransformIdentity;
        two.frame = _currentFrame;
        
        [_labelArray replaceObjectAtIndex:1 withObject:one];
        [_labelArray replaceObjectAtIndex:0 withObject:two];
        
        [self doAnimation];
        
    }];
}


- (CGFloat )widthForTextString:(NSString *)title height:(CGFloat)labelHeight fontSize:(CGFloat)fontSize
{
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGRect rect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, labelHeight) options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.width + 5;
}

@end
