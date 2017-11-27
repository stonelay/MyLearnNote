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




#### ps 
1. 所有的用户队列都有一个目标队列概念。从本质上讲，一个用户队列实际上是不执行任何任务的，但是它会将任务传递给它的目标队列来执行。通常，目标队列是默认优先级的全局队列。


#dispatch_source

### 事件合并机制（防止事件积压）
```objc
// dispatch_source

dispatch_source_t dispatch_source_create(
   dispatch_source_type_t type,
   uintptr_t handle,
   unsigned long mask,
   dispatch_queue_t queue
);

```


### 使用 dispatch_source 计时器 Demo

```objc
/* step 1 */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,//类型：定时器
                                   0, 0,
                                   queue);//block会被压入queue执行
    self.timer = timer;
    /* step 2 */
    dispatch_source_set_timer(timer,//dispatch source
                              dispatch_time(DISPATCH_TIME_NOW, 0* NSEC_PER_SEC),//现在开始
                              1* NSEC_PER_SEC,//间隔 1s
                              0);//精度0
    /* step 3 */
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"!");//整秒报时时的操作
    });
    /* step 4 */
    dispatch_resume(timer);//恢复source
```

### 使用 dispatch_source 用户事件

```objc
    NSArray *name = @[@"a",@"b",@"c",@"d",@"e"];
    
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_event_handler(source, ^{
        NSLog(@"handler get data %ld", dispatch_source_get_data(source));
    });
    dispatch_resume(source);
    

    dispatch_apply(5, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"done %@", name[index]);
        dispatch_source_merge_data(source, 1);
        sleep(1);
        // 调用 get 会使 这个值会被重置为0
        // NSLog(@"%ld", dispatch_source_get_data(source));
    });
```

ps:
1. dispatch_source_get_data(source)  当调用这个方法后 值会被重置为0
2. handler 会在主线程 空闲时调用。 所以当 push事件有一大堆时，我们不想对GUI进行频繁而累赘的更新，改为 联结， 当空闲时在提醒主线程更新。


### dispatch_queue_set_specific和dispatch_get_specific

```objc
static voidvoid *queueKey1 = "queueKey1";
// 设置当前队列标识
dispatch_queue_set_specific(queue1, queueKey1, &queueKey1, NULL);

if (dispatch_get_specific(queueKey1)) {  
// 说明当前的队列就是queue1  
}else{  
//说明当前的队列不是是queue1  
}   

```
