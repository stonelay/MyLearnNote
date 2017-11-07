# GCD part

## queue

### 系统队列

1. main queue: 与主线程功能相同。实际上，提交至main queue的任务会在主线程中执行。main queue可以调用dispatch_get_main_queue()来获得。因为main queue是与主线程相关的，所以这是一个串行队列。
2. Global queues: 全局队列是并发队列，并由整个进程共享。进程中存在三个全局队列：高、中（默认）、低三个优先级队列。可以调用dispatch_get_global_queue函数传入优先级来访问队列。 以及一个优先级更低的后台队列Background Priority Queue（用于I/O）
```
dispatch_get_global_queue(identifier, 0)
//DISPATCH_QUEUE_PRIORITY_HIGH
//DISPATCH_QUEUE_PRIORITY_DEFAULT
//DISPATCH_QUEUE_PRIORITY_LOW
//DISPATCH_QUEUE_PRIORITY_BACKGROUND
```

### 用户队列
用户队列:串行或并列队列 
创建 用户队列
```
dispatch_queue_create(label, attr);
//DISPATCH_QUEUE_CONCURRENT 并发 
//DISPATCH_QUEUE_SERIAL 串行
```

### 操作
操作是在多线程上还是单线程主要是看队列的类型和执行方法，并行队列异步执行才能在多线程，并行队列同步执行就只会在主线程执行了

1. 串行队列执行 添加 同步操作。
