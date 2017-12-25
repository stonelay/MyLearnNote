# YYAsyncLayer

## 多线程 操作 layer

使用OSAtomicIncrement32(&value) 保持操作的原子性。
若value不相等，就是已过期或取消的操作，不需要继续执行。

## 何时提交 更新操作
YYAsyncLayer 中YYTransaction 的作用是， 在主线程 空闲时 分批次提交 需要更新的Layer。
这样做的好处是 不在主线程繁忙时操作， 防止卡顿。
有个细节， YYTransaction 中 NSMutableSet *transactionSet 保存了需要更新的Layer，iOS的表，在放入对象的时候，会检查对象是否已经存在。所以 YYTransaction 重写了isEqual 和 hash 方法。
hash 通过判断v1 ^ v2 异或操作，基本能判断两个对象是否相等。

## 处理 渲染layer

根据硬件状况， 起有限个数的 串行队列。
在 提交绘制任务时， 依次提交到空闲的队列。
YYAsyncLayerGetReleaseQueue 释放队列。