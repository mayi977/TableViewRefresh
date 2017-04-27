//
//  ViewController.m
//  TableViewRefresh
//
//  Created by Zilu.Ma on 2017/3/23.
//  Copyright © 2017年 oc. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+Refresh.h"
#import "FirstViewController.h"
#import "RefreshView.h"
#import "UIScrollView+Refresh.h"
#import <MJRefresh.h>
#import "MZLRefreshHeaderTest.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *_tableView;
    RefreshView *_refreshView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];

    _tableView.mj_header = [MZLRefreshHeaderTest headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_tableView.mj_header endRefreshing];
        });
    }];
//    NSLog(@"%@",NSStringFromCGSize(_tableView.contentSize));

//    NSLog(@"%@",_tableView);
//    [_tableView startRefresh];

//    _tableView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) + 80);

//    [self initRefreshView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.textLabel.text = @"qwepasdfghjkl";

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:YES];
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    CGRect rect = cell.frame;
//    rect.origin.x = rect.size.width;
//    cell.frame = rect;
//
//    [UIView animateWithDuration:1.0 animations:^{
//        CGRect rect = cell.frame;
//        rect.origin.x = 0;
//        cell.frame = rect;
//    }];
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
//    [self performSelector:@selector(stop) withObject:nil afterDelay:5.0];


//    NSLog(@"%f",scrollView.contentOffset.y);
//    NSLog(@"%f",fabs(scrollView.contentOffset.y));
//    NSLog(@"%f",scrollView.contentSize.height);
//    NSLog(@"======%f",rect.origin.y);

//    if (_tableView.contentSize.height >= _tableView.frame.size.height) {
//        CGRect rect = _refreshView.frame;
//        rect.origin.y = _tableView.contentSize.height - scrollView.contentOffset.y;
//        _refreshView.frame = rect;
//    }else{
//        CGRect rect = _refreshView.frame;
//        rect.origin.y = _tableView.frame.size.height - fabs(scrollView.contentOffset.y);
//        _refreshView.frame = rect;
//    }

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{

//    NSLog(@"11111111111111111");

//    if (_refreshView.frame.origin.y <= _tableView.frame.size.height - 80) {
//        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);
//        [_refreshView startAnimation];
//    }
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{

//    NSLog(@"-=-==-=-=-=-=-=-=-");

}

- (void)initRefreshView{
    _refreshView = [[RefreshView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds), CGRectGetWidth(self.view.frame), 80)];
    _refreshView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_refreshView];
}

- (void)stop{
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
