# MainThread

## 判断当前 队列是否是 主线程队列

```objc
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
```


## 判断当前 队列是否是 标记队列
```objc
- (void)markSocketQueueTargetQueue:(dispatch_queue_t)socketNewTargetQueue
{
	void *nonNullUnusedPointer = (__bridge void *)self;
	dispatch_queue_set_specific(socketNewTargetQueue, IsOnSocketQueueOrTargetQueueKey, nonNullUnusedPointer, NULL);
}
- (void)unmarkSocketQueueTargetQueue:(dispatch_queue_t)socketOldTargetQueue
{
	dispatch_queue_set_specific(socketOldTargetQueue, IsOnSocketQueueOrTargetQueueKey, NULL, NULL);
}

// 判断是否是当前 taregetqueue
if (dispatch_get_specific(IsOnSocketQueueOrTargetQueueKey))
		block();
	else
		dispatch_sync(socketQueue, block);


```