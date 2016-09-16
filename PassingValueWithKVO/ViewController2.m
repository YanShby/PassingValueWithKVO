//
//  ViewController2.m
//  PassingValueWithKVO
//
//  Created by Yans on 16/9/14.
//  Copyright © 2016年 Yans. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (nonatomic, copy) NSString *passingText;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.2019 green:0.1894 blue:0.2054 alpha:1.0];

    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    self.textField.center = self.view.center;
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(0, 0, 100, 30);
    CGPoint buttonPoint;
    buttonPoint.x = self.view.center.x;
    buttonPoint.y = self.view.center.y + 50;
    self.button.center = buttonPoint;
    [self.button setTitle:@"VC2`s button" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];

}

- (void)tapButton{
    self.passingText = self.textField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
