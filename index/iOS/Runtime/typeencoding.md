## type encoding

```
//- (void)viewWillAppear:(BOOL)animated  -> v20@0:8B16
NSLog(@"%s", class_getInstanceMethod([self class], @selector(viewWillAppear:)));
//- (void) setSomething:(id) anObject  -> v24@0:8@16
NSLog(@"%s", method_getTypeEncoding(class_getInstanceMethod([self class], @selector(setSomething:))));
//- (BOOL) setSomething:(UInt8)animated aa:(id)anObject  -> B28@0:8C16@20
NSLog(@"%s", method_getTypeEncoding(class_getInstanceMethod([self class], @selector(setSomething:aa:))));
//- (BOOL) setSomething:(UInt16)animated aa:(id)anObject  -> B28@0:8s16@20
NSLog(@"%s", method_getTypeEncoding(class_getInstanceMethod([self class], @selector(setSomething:aa:))));
//- (BOOL) setSomething:(int)animated aa:(id)anObject  -> B28@0:8i16@20
NSLog(@"%s", method_getTypeEncoding(class_getInstanceMethod([self class], @selector(setSomething:aa:))));
//- (BOOL) setSomething:(long)animated aa:(id)anObject-> B32@0:8q16@24
NSLog(@"%s", method_getTypeEncoding(class_getInstanceMethod([self class], @selector(setSomething:aa:))));
```

* v means void return type
* 20 means the size of the argument frame (20 bytes)，整个方法参数占位的总长度
* @0 means that there is an Objective-C object type at byte offset 0 of the argument frame (this is the implicit self object in each Objective-C method)，这个表示在offset为0的地方有一个objective-c的对象，在objective-c method里，首个对象是self自身。
* :8 means that there is a selector at byte offset 8 (this is the implicit _cmd in every method, which is the selector that was used to invoke the method). 在offset为8的地方有一个SEL，由于我测试的是64位机器上，所以之前的OC的对象指针占位8个字节。
* B16 means 在offset 16的地方，有一个bool类型的参数，由于oc的对象和sel都是指针类型，64位机下所以都是占位8位，这里的bool也就出现在offset16的地方了。
