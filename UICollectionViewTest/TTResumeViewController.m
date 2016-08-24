
//
//  TTResumeViewController.m
//  UICollectionViewTest
//
//  Created by 马锦航 on 16/8/17.
//  Copyright © 2016年 JHMang. All rights reserved.
//

#import "TTResumeViewController.h"
#import "TTResumeCollectionViewCell.h"
#import "TTNextViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)


@interface TTResumeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) UICollectionView * collectionView;

@end

@implementation TTResumeViewController



#pragma mark - 懒加载

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TTResumeCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionCell"];
        _collectionView.backgroundColor = [UIColor greenColor];
        
    }
    return _collectionView;
}




#pragma mark - application
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.navigationItem.title = @"简历状态";
    [self.view addSubview:self.collectionView];
    
    
}


#pragma mark - collectionViewDelegate

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}



- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TTResumeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li",indexPath.row]];
    cell.describeLabel.text = [[NSString alloc] initWithFormat:@"{%ld,%ld}",indexPath.section,indexPath.row];
    cell.describeLabel.textAlignment = NSTextAlignmentCenter;
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.layer.borderWidth = 2;
    
    
    return cell;
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}


- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * message = [NSString stringWithFormat:@"你点击了第%ld个section，第%ld个cell",indexPath.section,indexPath.row];
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        TTNextViewController * nextViewControlle = [[TTNextViewController alloc] init];
        [self.navigationController pushViewController:nextViewControlle animated:YES];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 120);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 20, 10, 20);
}















@end
