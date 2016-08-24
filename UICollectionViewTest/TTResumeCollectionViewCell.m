//
//  TTResumeCollectionViewCell.m
//  UICollectionViewTest
//
//  Created by 马锦航 on 16/8/17.
//  Copyright © 2016年 JHMang. All rights reserved.
//

#import "TTResumeCollectionViewCell.h"

@implementation TTResumeCollectionViewCell


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, 100, 100);
//        _imageView.userInteractionEnabled = YES;
        _imageView.backgroundColor = [UIColor brownColor];
    }
    return _imageView;
}

- (UILabel *)describeLabel {
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.frame = CGRectMake(0, 100, 100, 20);
    }
    return _describeLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.describeLabel];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}













@end
