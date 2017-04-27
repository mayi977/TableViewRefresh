//
//  RefreshView.m
//  TableViewRefresh
//
//  Created by Zilu.Ma on 2017/3/23.
//  Copyright © 2017年 oc. All rights reserved.
//

#import "RefreshView.h"
#import "CircleView.h"

#define RADIUS 25
@interface RefreshView()

{
    CircleView *_view;
}

@end

@implementation RefreshView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _view = [[CircleView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) / 2.0 - 25, CGRectGetHeight(frame) / 2.0 - 25, 50, 50)];
        _view.backgroundColor = [UIColor clearColor];
        [self addSubview:_view];
    }

    return self;
}

- (void)startAnimation{

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 0.5f;
    animation.repeatCount = MAXFLOAT;
    animation.toValue = @(M_PI);
    animation.cumulative = YES;
    animation.removedOnCompletion = NO; //默认YES;按home键后，app进入后台，若为yes则动画停止；
    [_view.layer addAnimation:animation forKey:@"rotation"];
}

- (void)stopAnimation{
    [_view.layer removeAllAnimations];
}

@end
