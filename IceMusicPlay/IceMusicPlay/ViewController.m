//
//  ViewController.m
//  IceMusicPlay
//
//  Created by songlin on 2017/2/28.
//  Copyright © 2017年 songlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
}

-(void)createUI{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 200, 150, 50)];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor blueColor];
    [btn addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

-(void)testClick:(UIButton *)sender{
    NSLog(@"点击按钮");
    UIWindow * window = [[UIWindow alloc]init];
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(50, 150, 150, 150)];
    view.backgroundColor= [UIColor redColor];
    [window  addSubview: view];
    [self.view addSubview:window];
    
    NSLog(@"add");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
