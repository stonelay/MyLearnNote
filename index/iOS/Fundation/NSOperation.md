# NSOperation 

# title
并发 指的是一种现象。它描述的是“多个任务同时发生，需要被处理”这一现象。它的侧重点在于“发生”。

并行 指的是一种技术。它描述了一种能够同时处理多个任务的能力，侧重点在于“运行”。

NSOperation 是对 GCD 中的 block 进行的封装，是一个 可执行的任务。

```objc
// 状态
@property (readonly, getter=isCancelled) BOOL cancelled;
@property (readonly, getter=isExecuting) BOOL executing;
@property (readonly, getter=isFinished) BOOL finished;

// 执行方式
@property (readonly, getter=isAsynchronous) BOOL asynchronous;


- (void)start;// 执行任务
```

# NSOperationQueue

默认的 NSOperation 是同步执行的，
异步执行的方式：
1. 就需要自定义 NSOperation 的子类。
2. 或者 使用 NSOperationQueue。

NSOperationQueue 分为主队列 非主队列。

对于非主队列来说，一旦一个 NSOperation 被放入其中，那这个NSOperation 一定是并发执行的。因为 NSOperationQueue 会为每一个 NSOperation 创建线程并调用它的 start 方法。

NSOperationQueue 有一个属性叫 maxConcurrentOperationCount，它表示最多支持多少个 NSOperation 并发执行。如果 maxConcurrentOperationCount 被设为 1，就以为这个队列是串行队列。



# 例子

```objc
NSOperationQueue *queue = [NSOperationQueue new];// 非主队列
queue.maxConcurrentOperationCount = 1; // 队列 可以 同时 执行的 最大 operator 数量
for (int i = 0; i < 10; i++) {
    NSInvocationOperation * inv = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(testOperation) object:nil];
        [queue addOperation:inv];
}
```

```objc
// blockOperation 中的 block 是并发执行的
NSBlockOperation * blockOperation = [NSBlockOperation
                                         blockOperationWithBlock:^{
                                             NSLog(@"begin 1在第%@个线程",[NSThread currentThread]);
                                             sleep(5);
                                             NSLog(@"end 1在第%@个线程",[NSThread currentThread]);
                                         }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"begin 2在第%@个线程",[NSThread currentThread]);
        sleep(4);
        NSLog(@"end 2在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"begin 3在第%@个线程",[NSThread currentThread]);
        sleep(5);
        NSLog(@"end 3在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"begin 4在第%@个线程",[NSThread currentThread]);
        sleep(5);
        NSLog(@"end 4在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"begin 5在第%@个线程",[NSThread currentThread]);
        sleep(5);
        NSLog(@"end 5在第%@个线程",[NSThread currentThread]);
    }];

```

```objc
// 使用KVO 通知 operation 更改状态
// cancel 只是个标志位， 暂停任务还是要手动实现
- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

```

处理取消事件的具体做法是：在main方法中定期地调用isCancelled方法检测操作是否已经被取消，也就是说是否调用了cancel方法，如果返回YES，表示已取消，则立即让main方法返回。

