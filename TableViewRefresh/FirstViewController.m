//
//  FirstViewController.m
//  TableViewRefresh
//
//  Created by Zilu.Ma on 2017/3/23.
//  Copyright © 2017年 oc. All rights reserved.
//

#import "FirstViewController.h"
#import <MJRefresh.h>

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *_tableView;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];

    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"=-=-=-=-=-=-=-=-=");
    }];

    [_tableView.mj_header endRefreshing];

    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

    }];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
