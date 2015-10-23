//
//  ViewController.m
//  TestAutolayout
//
//  Created by axiBug on 15/10/22.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"


static const CGFloat  padding = 10.f;

@interface ViewController ()

@property (strong, nonatomic)  UIView *leftView;
@property (strong, nonatomic)  UIView *upView;
@property (strong, nonatomic)  UIView *smallLeftView;
@property (strong, nonatomic)  UIView *smallRightView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIView *superview = self.view;
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.upView];
    [self.view addSubview:self.smallLeftView];
    [self.view addSubview:self.smallRightView];
    
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(superview.mas_leading).offset(padding);
        make.top.mas_equalTo(superview.mas_top).offset(padding);
        make.width.mas_equalTo(self.upView.mas_width);
        make.bottom.mas_equalTo(superview.mas_bottom).offset(-padding);
    }];
    
    [self.upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(superview.mas_top).offset(padding);
        make.leading.mas_equalTo(self.leftView.mas_trailing).offset(padding);
        make.trailing.mas_equalTo(superview.mas_trailing).offset(-padding);
        make.height.mas_equalTo(self.smallLeftView.mas_height);
    }];
    
    [self.smallLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.upView.mas_bottom).offset(padding);
        make.leading.mas_equalTo(self.leftView.mas_trailing).offset(padding);
        make.bottom.mas_equalTo(superview.mas_bottom).offset(-padding);
        make.width.mas_equalTo(self.smallRightView.mas_width);
    }];
    
    
    [self.smallRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.smallLeftView.mas_trailing).offset(padding);
        make.top.mas_equalTo(self.upView.mas_bottom).offset(padding);
        make.bottom.mas_equalTo(superview.mas_bottom).offset(-padding);
        make.trailing.mas_equalTo(superview.mas_trailing).offset(-padding);
    }];
}

- (UIView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = [UIColor redColor];
    }
    return _leftView;
}

- (UIView *)upView
{
    if (!_upView) {
        _upView = [[UIView alloc] init];
        _upView.backgroundColor = [UIColor greenColor];
    }
    return _upView;
}

- (UIView *)smallRightView
{
    if (!_smallRightView) {
        _smallRightView = [[UIView alloc] init];
        _smallRightView.backgroundColor = [UIColor grayColor];
    }
    return _smallRightView;
    
}

- (UIView *)smallLeftView
{
    if (!_smallLeftView) {
        _smallLeftView = [[UIView alloc] init];
        _smallLeftView.backgroundColor = [UIColor grayColor];
    }
    return _smallLeftView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
