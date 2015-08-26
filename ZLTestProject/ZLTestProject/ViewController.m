//
//  ViewController.m
//  ZLTestProject
//
//  Created by line0 on 15/8/19.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "TestAVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"ceshi";
    
    UIView *leftView = [[UIView alloc] init];
    
    leftView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:leftView];
    
    
    UIView *rightView = [[UIView alloc] init];
    
    rightView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:rightView];
    
    
    UIView *bottomView = [[UIView alloc] init];
    
    bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:bottomView];
    
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
            //导航栏
        UIView *navView = (id)self.topLayoutGuide;
        
            //顶部
        make.top.equalTo(navView.bottom).offset(10);
            //左部
        make.left.equalTo(self.view).offset(10);
            //宽
        make.width.equalTo(rightView);
            //高
        make.height.equalTo(@[rightView,bottomView]);
            //右
        make.right.equalTo(rightView.mas_left).offset(-10);
            //底
        make.bottom.equalTo(bottomView.mas_top).offset(-10);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
            //相当于导航栏
        UIView *navView = (id)self.topLayoutGuide;
        
        make.top.equalTo(navView.bottom).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(leftView);
        make.height.equalTo(@[leftView,bottomView]);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(leftView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@[leftView,rightView]);
        make.bottom.equalTo(self.view.bottom).offset(-10);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"TestA" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, 50, 44);

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(ggoNextVC) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ggoNextVC
{
    TestAVC *ttestvc = [TestAVC new];
    [self.navigationController pushViewController:ttestvc animated:YES];
}

@end
