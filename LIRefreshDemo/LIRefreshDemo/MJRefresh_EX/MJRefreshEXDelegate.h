//
//  MJRefreshEXDelegate.h
//  LIRefreshDemo
//
//  Created by 0o on 2017/12/13.
//  Copyright © 2017年 Benight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MJRefreshEXDelegate <NSObject>

@optional
/**
 *	下拉 重新加载数据
 */
- (void)onRefreshing:(id)control;

@optional
/**
 *	上拉 加载更多数据
 */
- (void)onLoadingMoreData:(id)control pageNum:(NSNumber *)pageNum;

@end