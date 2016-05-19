//
//  ViewController.m
//  jianbianAnimation
//
//  Created by comma on 16/5/19.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"
#import "Launch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"None";
        
    }else if (indexPath.row == 1){
        
        cell.textLabel.text = @"One";
    
    }else if (indexPath.row == 2){
        
        cell.textLabel.text = @"two";
        
    }else if (indexPath.row == 3){
        
        cell.textLabel.text = @"Left";
        
    }else if (indexPath.row == 4){
        
        cell.textLabel.text = @"Right";
        
    }else if (indexPath.row == 5){
        
        cell.textLabel.text = @"Bottom";
        
    }else{
        
        cell.textLabel.text = @"Top";
    
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleNone];
        
    }else if (indexPath.row == 1){
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleOne];
        
    }else if (indexPath.row == 2){
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleTwo];
        
    }else if (indexPath.row == 3){
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleLeft];
        
    }else if (indexPath.row == 4){
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleRight];
        
    }else if (indexPath.row == 5){
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleBottom];
        
    }else{
        
        Launch *la = [[Launch alloc] init];
        [la loadLaunchImageView:@"launch" disappear:LJDisApperaStyleTop];
        
    }

}

@end
