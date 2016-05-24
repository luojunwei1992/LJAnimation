//
//  ViewController.m
//  PaoMa
//
//  Created by comma on 16/5/24.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"
#import "LJPaoMaView.h"

@interface ViewController ()

@property (nonatomic,strong)LJPaoMaView *paoma;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _paoma = [[LJPaoMaView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) withTitle:@"UIView有CGAffineTransform类型的属性transform，它是定义在二维空间上完成View的平移，旋转，缩放等效果的实现"];
    
    [self.view addSubview:_paoma];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
