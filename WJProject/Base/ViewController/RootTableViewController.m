//
//  RootTableViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/19.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "RootTableViewController.h"

@interface RootTableViewController ()
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction)];
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerAction)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}
#pragma mark -- 下拉刷新上拉加载
- (void)headerAction {
    if ([_tableView.mj_footer isRefreshing]) {
        [_tableView.mj_footer endRefreshing];
    }
}
- (void)footerAction {
    if ([_tableView.mj_header isRefreshing]) {
        [_tableView.mj_header endRefreshing];
    }
}

#pragma mark -- 懒加载
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KScreenHeight - kTopHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableView;
}

@end
