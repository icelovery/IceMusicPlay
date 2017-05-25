//
//  ViewController.m
//  IceMusicPlay
//
//  Created by songlin on 2017/2/28.
//  Copyright © 2017年 songlin. All rights reserved.
//

#import "ViewController.h"
#import "delegateViewController.h"
@interface ViewController ()<UIActionSheetDelegate>

@end

@implementation ViewController{
    UILabel * _nameLb;
}

-(void)merge{
    //10.17
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
}

// gbk -> utf8
- (NSString *)gbkToUtf8:(Byte *)cString
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSData *pageData = [NSData dataWithBytes:cString length:strlen((Byte *)cString)];
    NSString *string = [[NSString alloc] initWithData:pageData encoding:encoding];
    
    return string;
}

// utf8 -> gbk
- (NSData *)utf8ToGbk:(NSString *)string
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8);
    return [string dataUsingEncoding:encoding];
}

-(void)createUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 200, 150, 50)];
    [btn setTitle:@"test" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor blueColor];
    [btn addTarget:self action:@selector(blockClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *delegateBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 150, 50)];
    [delegateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    delegateBtn.backgroundColor = [UIColor blueColor];
    [delegateBtn addTarget:self action:@selector(delegateClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delegateBtn];
    
    _nameLb = [[UILabel alloc]initWithFrame:CGRectMake(30, 40, 200, 30)];
    _nameLb.text = @"无损音质";
    _nameLb.textAlignment = NSTextAlignmentCenter;
    _nameLb.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_nameLb];

}

-(void)test{
    NSLog(@"12331231");
}

//masters

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
