//
//  ViewController.m
//  IceMusicPlay
//
//  Created by songlin on 2017/2/28.
//  Copyright © 2017年 songlin. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "delegateViewController.h"
@interface ViewController ()<UIActionSheetDelegate>

@end

@implementation ViewController{
    UILabel * _nameLb;
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

-(void)delegateClick:(UIButton *)sender{
    delegateViewController * delegate = [[delegateViewController alloc]init];
    delegate.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:delegate animated:YES];
}
-(void)blockClick:(UIButton *)sender{
//    FirstViewController * first = [[FirstViewController alloc]init];
//    first.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:first animated:YES];
    delegateViewController * delegate = [[delegateViewController alloc]init];
    delegate.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:delegate animated:YES];
}

-(void)testClick:(UIButton *)sender{
    NSLog(@"点击按钮");
//    UIWindow * window = [[UIWindow alloc]init];
//    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(50, 150, 150, 150)];
//    view.backgroundColor= [UIColor redColor];
//    [window  addSubview: view];
//    [self.view addSubview:window];
    NSLog(@"delete");
    
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"按钮点击事件触发" forState:UIControlStateNormal];
    [self.view addSubview:btn];

//    UIActionSheet* sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"标准音质",@"高品音质",@"无损音质", nil];
//    [sheet showInView:self.view];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"标准音质" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        NSLog(@"标准音质");
        _nameLb.text = @"标准音质";
    }];
    
    UIAlertAction *noamlAction = [UIAlertAction actionWithTitle:@"高品音质" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"高品音质");
        _nameLb.text = @"高品音质";
    }];
    
    UIAlertAction *reduce = [UIAlertAction actionWithTitle:@"无损音质" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"无损音质");
        _nameLb.text = @"无损音质";
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:noamlAction];
    [alertController addAction:reduce];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

/*
 // 初始化一个一个UIAlertController
 // 参数preferredStyle:是IAlertController的样式
 // UIAlertControllerStyleAlert 创建出来相当于UIAlertView
 // UIAlertControllerStyleActionSheet 创建出来相当于 UIActionSheet
 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"静" preferredStyle:(UIAlertControllerStyleAlert)];
 
 // 创建按钮
 UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
 NSLog(@"注意学习");
 }];
 // 创建按钮
 // 注意取消按钮只能添加一个
 UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
 // 点击按钮后的方法直接在这里面写
 NSLog(@"注意学习");
 }];
 
 //    // 创建警告按钮
 //    UIAlertAction *structlAction = [UIAlertAction actionWithTitle:@"警告" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
 //        NSLog(@"注意学习");
 //    }];
 //
 // 添加按钮 将按钮添加到UIAlertController对象上
 [alertController addAction:okAction];
 [alertController addAction:cancelAction];
 //[alertController addAction:structlAction];
 
 // 只有在alert情况下才可以添加文本框
 [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
 textField.placeholder = @"用户名";
 textField.secureTextEntry = YES;
 }];
 
 //    // 取出文本
 //    UITextField *text = alertController.textFields.firstObject;
 //    UIAlertAction *action = alertController.actions.firstObject;
 
 // 将UIAlertController模态出来 相当于UIAlertView show 的方法
 [self presentViewController:alertController animated:YES completion:nil];
 
 
 
 
 
 
 
 
 
 
 
 
 
 */




-(void)bing{
    NSLog(@"bing");
}









- (void)jce{
    NSLog(@"jce");
}

- (void)master{
    
    NSLog(@"1111111111111111");
    
}

-(void)makeassss{
    NSLog(@"asdf");
}

-(void)btnClick:(UIButton *)sender{
    //按钮点击事件
    NSLog(@"按钮点击事件触发");
}

- (void)log{
    NSLog(@"22222");
}

-(void)tag{
    NSLog(@"2032");
}


-(void)test{
    NSLog(@"jce1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
