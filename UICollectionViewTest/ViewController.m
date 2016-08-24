//
//  ViewController.m
//  UICollectionViewTest
//
//  Created by 马锦航 on 16/8/17.
//  Copyright © 2016年 JHMang. All rights reserved.
//

#import "ViewController.h"
#import "TTResumeViewController.h"

@interface ViewController ()


@property (nonatomic,strong) UIButton * resume;

@property (nonatomic,strong) UIImageView * imageView;

@end

@implementation ViewController

#pragma mark - 懒加载

- (UIButton *)resume {
    if (!_resume) {
        _resume = [[UIButton alloc] init];
        _resume.frame = CGRectMake(100, 100, 100, 40);
        [_resume setTitle:@"简历状态" forState:UIControlStateNormal];
        _resume.backgroundColor = [UIColor grayColor];
        [_resume addTarget:self action:@selector(resumeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resume;
}


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(100, 300, 100, 100);
        _imageView.image = [UIImage imageNamed:@"1"];
    }
    return _imageView;
}

#pragma mark - application
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadSubviews];
    
}


#pragma mark - view

- (void) loadSubviews {
    [self.view addSubview:self.resume];
    [self.view addSubview:self.imageView];
}


#pragma mark - action

- (void) resumeButtonAction:(UIButton *) sender {
    
    TTResumeViewController * resumeViewController = [[TTResumeViewController alloc] init];
    
    [self.navigationController pushViewController:resumeViewController animated:YES];
    
}





















@end
