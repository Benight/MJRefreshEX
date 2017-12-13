# MJRefreshEX
为了方便使用巨人的轮子，稍微封装了下MJRefresh，两句代码就可以完成刷新，也可以自定义刷新头，并且把页数控制封装了起来，自己就不用记录页数了

# 示例
![gif](https://github.com/Benight/MJRefreshEX/blob/master/refreshGIF.gif)


## 使用方法
### 1.引用头文件
    #import "UIScrollView+MJRefreshEX.h"

### 2.添加代理
    <MJRefreshEXDelegate>

### 3.添加刷新
    [self.tableView addHeaderWithHeaderClass:nil beginRefresh:YES delegate:self animation:YES];
    [self.tableView addFooterWithFooterClass:nil automaticallyRefresh:YES delegate:self];

### 4.添加监听
    - (void)onRefreshing:(id)control {}
    - (void)onLoadingMoreData:(id)control pageNum:(NSNumber *)pageNum {}
