# thread

## runloop
线程和 RunLoop 之间是一一对应的, 保存在一个全局的 Dictionary 里。
RunLoop *的创建是发生在第一次获取时*，RunLoop 的销毁是发生在线程结束时。你只能在一个线程的内部获取其 RunLoop（主线程除外）。

## CFRunLoopSourceRef
* Source0
selector事件 或者 用户输入事件
* Source1
port 时间（线程间通讯）

```
+ (void)networkRequestThreadEntryPoint:(id)__unused object {  
    @autoreleasepool {  
        [[NSThread currentThread] setName:@"AFNetworking"];  
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];  
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];  
        [runLoop run];  
    }  
}  

+ (NSThread *)networkRequestThread {  
    static NSThread *_networkRequestThread = nil;  
    static dispatch_once_t oncePredicate;  
    dispatch_once(&oncePredicate, ^{  
        _networkRequestThread = [[NSThread alloc] initWithTarget:self selector:@selector(networkRequestThreadEntryPoint:) object:nil];  [_networkRequestThread start];  
    });    
    return _networkRequestThread;  
}  
```

这种方式， 是在后台启动了一个保活的线程， 但是有个弊端， 不能取消，会一直持续下去。

```objc
// 启动 runloop [runmode:beforeDate];
// 每次有事件时， 都会唤醒runloop 然后 继续 定时睡眠distantFuture
+ (void)networkRequestThreadEntryPoint:(id)__unused object {
    @autoreleasepool {
        [[NSThread currentThread] setName:object];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        //    NSLog(@"%@", runLoop);
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"....");
        }];
        [runLoop addTimer:timer forMode:NSRunLoopCommonModes];
        
//        if (!machPort) {
//            machPort = [NSMachPort port];
//        }
//
//        [runLoop addPort:machPort forMode:NSDefaultRunLoopMode];

        BOOL exitNow = NO;

        NSMutableDictionary* threadDict = [[NSThread currentThread] threadDictionary];
        [threadDict setValue:[NSNumber numberWithBool:exitNow] forKey:@"ThreadShouldExitNow"];

        while (!exitNow) {
            NSLog(@"while begin");
            [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            exitNow = [[threadDict valueForKey:@"ThreadShouldExitNow"] boolValue];
            NSLog(@"while end");
        }

        NSLog(@"ending .........");
    }
}

// cancel

    - (void)cancel {
        NSLog(@"cancel %@", [NSThread currentThread]);
        
        // 不再续
        NSMutableDictionary* threadDict = [[NSThread currentThread] threadDictionary];
        [threadDict setValue:[NSNumber numberWithBool:YES] forKey:@"ThreadShouldExitNow"];
        
        CFRunLoopStop(CFRunLoopGetCurrent());
        
        NSThread *thread = [NSThread currentThread];
        [thread cancel];
        //    [NSThread exit];
        
    }
```


* timer 的触发 并不会让 runloop 返回。
* source 的触发，会让loop返回（所以需要写个循环条件，在返回的时候，根据业务判断，是否还要继续监听）
