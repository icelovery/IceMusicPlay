//
//  FirstViewController.m
//  IceMusicPlay
//
//  Created by songlin on 2017/2/28.
//  Copyright © 2017年 songlin. All rights reserved.
//

#import "FirstViewController.h"
//屏幕宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * valueArr;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation FirstViewController


//-(instancetype)initWithBankNameBlock:(banNameBlock)block{
//    if (self == [super init] ) {
//        _blocks = block;
//    }
//    return self;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createUI];
}

-(NSArray *)valueArr{
    if (!_valueArr) {
        _valueArr = @[@{@"北京银行":@"313003"},@{@"光大银行":@"303"},@{@"广发银行":@"306"},@{@"建设银行":@"105"},@{@"交通银行":@"301"},@{@"民生银行":@"305"},@{@"农业银行":@"103"},@{@"平安银行":@"307"},@{@"浦发银行":@"310"},@{@"邮政储蓄银行":@"403"},@{@"招商银行":@"308"},@{@"中国工商银行":@"102"},@{@"中国银行":@"104"},@{@"中信银行":@"302"},@{@"上海银行":@"313062"},@{@"杭州银行":@"313027"}];
    }
    return _valueArr;
}

-(void)createUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"行号%lu",(unsigned long)self.valueArr.count);
    return self.valueArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellID = @"CELLIDENTI";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSLog(@"label.text==%@",_valueArr[indexPath.row]),
    cell.textLabel.text = [[self.valueArr[indexPath.row] allKeys] firstObject];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = _valueArr[indexPath.row];
    NSString *Value = [[dic allKeys]firstObject];
    NSString *name = [[dic allValues]firstObject];
//    [self.delegete provideValue:Value name:name];
    
    
    
    //block
    if (_blocks) {
        _blocks(Value,name);
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
