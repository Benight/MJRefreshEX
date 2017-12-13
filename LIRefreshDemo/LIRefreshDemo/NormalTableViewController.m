//
//  NormalTableViewController.m
//  LIRefreshDemo
//
//  Created by 0o on 2017/12/13.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import "NormalTableViewController.h"
#import "UIScrollView+MJRefreshEX.h"

@interface NormalTableViewController () <MJRefreshEXDelegate>
@property (nonatomic, strong) NSMutableArray *listArr;

@end

@implementation NormalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"普通样式";
    
    self.listArr = [[NSMutableArray alloc]init];
    [self.tableView addHeaderWithHeaderClass:nil beginRefresh:YES delegate:self animation:YES];
    [self.tableView addFooterWithFooterClass:nil automaticallyRefresh:YES delegate:self];
    

}

#pragma mark - MJRefreshEXDelegate
- (void)onRefreshing:(id)control {
    [self requestNetWorkingWithPageNum:1 isHeader:YES];
}

- (void)onLoadingMoreData:(id)control pageNum:(NSNumber *)pageNum {
    [self requestNetWorkingWithPageNum:pageNum.integerValue isHeader:NO];
}

- (void)requestNetWorkingWithPageNum:(NSInteger)pageNum isHeader:(BOOL)isHeader {
    
    //模拟接口请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        int result = arc4random()%10;
        if (result != 0) {
            NSLog(@"模拟请求成功");
            NSMutableArray *tempArr = [[NSMutableArray alloc]init];

            if (self.listArr.count < 30 || isHeader) {
                for (int i = 0; i < 10; i ++) {
                    [tempArr addObject:@(i)];
                }
            }
            
            if (isHeader) {
                
                [self.tableView endHeaderRefreshWithChangePageIndex:YES];
                [self.listArr removeAllObjects];
                [self.listArr addObjectsFromArray:tempArr];
                
            }else {
                [self.tableView endFooterRefreshWithChangePageIndex:YES];
                
                if (tempArr.count) {
                    [self.listArr addObjectsFromArray:tempArr];
                }else {
                    [self.tableView noMoreData];
                }
            }
            
            [self.tableView reloadData];

        }else {
            NSLog(@"模拟请求失败");
            if (isHeader) {
                [self.tableView endHeaderRefreshWithChangePageIndex:NO];
            }else {
                [self.tableView endFooterRefreshWithChangePageIndex:NO];
            }
        }
    });
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
