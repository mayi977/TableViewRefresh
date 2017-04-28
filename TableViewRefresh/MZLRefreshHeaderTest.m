//
//  MZLRefreshHeaderTest.m
//  TableViewRefresh
//
//  Created by Zilu.Ma on 2017/3/23.
//  Copyright © 2017年 oc. All rights reserved.
//

#import "MZLRefreshHeaderTest.h"
#import "RefreshView.h"

@interface MZLRefreshHeaderTest()

@property (strong,nonatomic) RefreshView *headerRefreshView;
@property (weak,nonatomic) UILabel *label;

@end

@implementation MZLRefreshHeaderTest

//初始化
- (void)prepare{
    [super prepare];

    _headerRefreshView = [[RefreshView alloc] initWithFrame:CGRectMake(0, 0, 320, 54)];
    _headerRefreshView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, self.mj_h * 0.5);
//    NSLog(@"%f",self.bounds.size.width);
//    NSLog(@"%f",self.mj_h);
//    NSLog(@"%@",NSStringFromCGPoint(_headerRefreshView.center));
    _headerRefreshView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_headerRefreshView];
}

//重写父类方法
//监听scrollView的contentoffset变化
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
    [super scrollViewContentOffsetDidChange:change];
}

//监听scrollview的contentsize
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{
    [super scrollViewContentSizeDidChange:change];
}

//监听scrollview的拖拽状态的变化
- (void)scrollViewPanStateDidChange:(NSDictionary *)change{
    [super scrollViewPanStateDidChange:change];
}

//监听控件的刷新状态
- (void)setState:(MJRefreshState)state{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            [self endAnimation];
            break;
        case MJRefreshStatePulling:
            [self endAnimation];
            break;
        case MJRefreshStateRefreshing:
            [self startAnimation];
            break;
        default:
            break;
    }
}

//监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent{
    [super setPullingPercent:pullingPercent];
}

- (void)startAnimation{
    [_headerRefreshView startAnimation];
}

- (void)endAnimation{
    [_headerRefreshView stopAnimation];
}

@end
