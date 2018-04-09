//
//  SecondViewController.m
//  WJProject
//
//  Created by 郝文举 on 2018/3/20.
//  Copyright © 2018年 wenju hao. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()
@property (strong, nonatomic) NSArray *arr;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522230269079&di=af3c2a44ef666ea8124eec009cc0b294&imgtype=0&src=http%3A%2F%2Fimagehost.vendio.com%2Fa%2F23188713%2Fview%2Fimg438_011.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522230269079&di=fd6c4ed126ccf7626a5b6d4887d34437&imgtype=0&src=http%3A%2F%2Fi.ebayimg.com%2F00%2Fs%2FMTA0MlgxNjAw%2Fz%2FyLMAAOSwpLNX%257EciX%2F%2524_57.JPG%3Fset_id%3D8800005007",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522230269079&di=d6057316d8af3423c92a401b09127c25&imgtype=0&src=http%3A%2F%2Fwww.bjzxcp.com%2Fimages%2Fcash%2F095811_4e39fcb310d82.jpg"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)headerAction{
    [super headerAction];
}
- (void)footerAction {
    [super footerAction];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    [cell.imageView sd_setImageWithURL:_arr[indexPath.row] placeholderImage:[UIImage imageNamed:@"icon_tabbar_mine"]];
    return cell;
}

@end
