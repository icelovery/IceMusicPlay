//
//  delegateViewController.m
//  IceMusicPlay
//
//  Created by songlin on 2017/3/3.
//  Copyright © 2017年 songlin. All rights reserved.
//

#import "delegateViewController.h"
#import "FirstViewController.h"
//屏幕宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface delegateViewController ()<BankNameDelegate>
@property(nonatomic,strong)UIButton * valueBtn;
@end

@implementation delegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

-(void)createUI{
    _valueBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 170, 200, 40)];
    _valueBtn.backgroundColor =[UIColor blueColor];
    
    [_valueBtn setTitle:@"select" forState:UIControlStateNormal];
    [_valueBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_valueBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_valueBtn];
    
}

-(void)selectClick:(UIButton *)sender{
    FirstViewController * first = [[FirstViewController alloc]init];
    first.blocks = ^(NSString *code, NSString * name){
        [_valueBtn setTitle:code forState:UIControlStateNormal
                  ];
    };
    [self.navigationController pushViewController:first animated:YES];
    
//    FirstViewController *first = [[FirstViewController alloc]initWithBankNameBlock:^(NSString *code, NSString *name) {
//        [_valueBtn setTitle:code forState:UIControlStateNormal
//         ];
//    }];
    
//    [self.navigationController pushViewController:first animated:YES] ;
}

-(void)provideValue:(NSString *)value name:(NSString *)name;{
    NSString * code = value;
    [_valueBtn setTitle:code forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}



@end
