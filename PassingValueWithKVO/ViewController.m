//
//  ViewController.m
//  PassingValueWithKVO
//
//  Created by Yans on 16/9/14.
//  Copyright © 2016年 Yans. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tapButton1:(id)sender {
    ViewController2 *vc2 = [ViewController2 new];
    //让self成为观察者, vc2成为被观察者, 观察passingText的变化 [self观察vc2中passingText属性的变化]
    [vc2 addObserver:self forKeyPath:@"passingText" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [self presentViewController:vc2 animated:YES completion:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    ViewController2 *vc2 = (ViewController2 *)object;
    if ([keyPath isEqualToString:@"passingText"]) {
        self.lable1.text = change[@"new"];
    }
    NSLog(@"值改变---old:%@---new:%@",change[@"old"],change[@"new"]);
    //注意: 一定要在使用完观察者之后要注销观察者 否则会crash!!!
    [vc2 removeObserver:self forKeyPath:@"passingText"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
