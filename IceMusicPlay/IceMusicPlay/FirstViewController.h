//
//  FirstViewController.h
//  IceMusicPlay
//
//  Created by songlin on 2017/2/28.
//  Copyright © 2017年 songlin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^banNameBlock)(NSString *code, NSString * name);//block

@protocol BankNameDelegate <NSObject>

-(void)provideValue:(NSString *)value name:(NSString *)name;

@end

@interface FirstViewController : UIViewController

-(instancetype)initWithBankNameBlock:(banNameBlock)block;
@property(nonatomic,weak)id<BankNameDelegate>delegete;
@property(nonatomic,strong)banNameBlock blocks;
@end
