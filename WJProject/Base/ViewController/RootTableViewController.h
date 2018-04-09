//
//  RootTableViewController.h
//  WJProject
//
//  Created by 郝文举 on 2018/3/19.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "RootViewController.h"

@interface RootTableViewController : RootViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) UITableView *tableView;

// 文字隐藏 header.stateLabel.hidden = YES;
// 时间隐藏 header.lastUpdatedTimeLabel.hidden = YES;


// 下拉刷新上拉加载
 - (void)headerAction;
 - (void)footerAction;

@end
