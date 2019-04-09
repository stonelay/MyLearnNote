
# JSCore

### JSVirtualMachine
一个 JSVirtualMachine 实例代表一个执行 JavaScript 的自包含的环境。
### JSContext
js 执行上下文
### JSValue
```
MObject *o = [[MObject alloc] init];
JSValue *value = [JSValue valueWithObject:o inContext:_context];
```
对象传递: 对于一个非基础类型的对象 JSCore 把 对象指针传给 js，这个指针对象在 js 中无法使用，但回传给oc的时候可以通过指针找到这个对象。
引用计数: js对oc的变量是强引用，所以有引用时，计数会加1，释放时减1。也就是说当oc中没有引用时，对象何时释放由js决定。
这里存疑 MObject 只有js引用时， 不是立即释放的，而是过了一段时间，可能和js的生命周期有关(但JSContext 释放时，MObject立即释放)。

对于 NSDictionary，NSArray， NSNumber对象 会转换成js 的map，array等对象，再传回来的时候就不是原来的指针了。


ps: 
类比 JSVirtualMachine 进程，JSContext 线程
