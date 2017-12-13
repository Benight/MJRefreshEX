//
//  UIScrollView+MJRefreshEX.h
//  LIRefreshDemo
//
//  Created by 0o on 2017/12/13.
//  Copyright © 2017年 Benight. All rights reserved.
//

/**
 *  用法,记得加代理<MJRefreshEXDelegate>
 *  要使用pageNum ,就要用endHeaderRefreshWithChangePageIndex 和 endFooterRefreshWithChangePageIndex 结束刷新
 */
#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "MJRefreshEXDelegate.h"

@interface UIScrollView (MJRefreshEX)



#pragma mark - 添加方法
/**
 *  增加一个header
 *
 *  @param headerClassName 自定义的header刷新样式类的名称，如果为nil则为默认的刷新样式
 *  @param beginRefresh    是不是要在第一次进入的时候自动开始刷新
 *  @param delegate        刷新回调的代理
 *  @param animation       是不是要在第一次进入的时候显示动画（必须beginRefresh为YES的情况下才有效）
 */
- (void)addHeaderWithHeaderClass:(NSString *)headerClassName beginRefresh:(BOOL)beginRefresh delegate:(id<MJRefreshEXDelegate>)delegate animation:(BOOL)animation;
/**
 *  增加一个footer
 *
 *  @param footerClassName      自定义的footer刷新样式类的名称，如果为nil则为默认的刷新样式
 *  @param automaticallyRefresh 是不是要在滑动到底部的时候自动加载更多
 *  @param delegate             刷新回调的代理
 */
- (void)addFooterWithFooterClass:(NSString *)footerClassName automaticallyRefresh:(BOOL)automaticallyRefresh delegate:(id<MJRefreshEXDelegate>)delegate;

#pragma mark - 开始刷新
/** 开始刷新header*/
- (void)beginHeaderRefresh;
/** 开始刷新footer*/
- (void)beginFooterRefresh;

#pragma mark - 结束刷新
/** 结束刷新header*/
- (void)endHeaderRefresh;

/** 结束刷新Footer*/
-(void)endFooterRefresh;

#pragma mark - 结束刷新 && 要使用pageNum,通过控制change属性来改变pagenum
/** 结束刷新Header，并且是不是要改变pageIndex（eg:刷新失败的时候就不用改变）*/
-(void)endHeaderRefreshWithChangePageIndex:(BOOL)change;

/** 结束刷新footer，并且是不是要改变pageIndex（eg:刷新失败的时候就不用改变）*/
- (void)endFooterRefreshWithChangePageIndex:(BOOL)change;


#pragma mark - 没有数据
/** 显示@"已经全部加载完毕"，并且不会再有下拉加载更多功能*/
- (void)noMoreData;
/** 重置@"已经全部加载完毕"*/
- (void)resetNoMoreData;

#pragma mark - 移除刷新
/** 移除刷新Header*/
- (void)removeHeaderRefresh;
/** 移除刷新Footer*/
- (void)removeFooterRefresh;

/** pagenum重新计数*/
- (void)resetPageNum;

@end
