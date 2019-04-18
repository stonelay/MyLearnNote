# Invocation

```objc
// 设定方法的样子
    SEL myMethod = @selector(run:);
    // 预备方法
//    SEL myMethod2 = @selector(run:);
    // 返回一个方法 如果那个方法找不到则返回nil
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:myMethod];
    // 通过签名初始化
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    // 设置target
//    [invocation setSelector:myMethod];
    // 设置selectro
    NSString *name1 = @"小明";
    NSString *name2 = @"小张";
    NSArray *arr3 = @[@"1",@"32",@"12334"];
    //注意：1、这里设置参数的Index 需要从2开始，因为前两个被selector和target占用。下面这样写也没有任何
    
    id mySelf = self;
    [invocation setArgument:&mySelf atIndex:0];
    [invocation setArgument:&myMethod atIndex:1];
    [invocation setArgument:&name1 atIndex:2];
//    [invocation setArgument:&name2 atIndex:3];
//    [invocation setArgument:&arr3 atIndex:4];
//    invocation.target = self;
    NSInteger returnValue = 0;
    
    [invocation invoke];
    [invocation getReturnValue:&returnValue];
    NSLog(@"%ld", (long)returnValue);
```

```
    
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:[@"v@:" UTF8String]];
    // NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(doPrint)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    Class superCls = [self class];
    Method superForwardMethod = class_getInstanceMethod(superCls, @selector(doPrint));
    void (*superForwardIMP)(id, SEL, NSInvocation *);
    superForwardIMP = (void (*)(id, SEL, NSInvocation *))method_getImplementation(superForwardMethod);
    superForwardIMP(self, @selector(doPrinta), invocation);
```

```
// 获得签名 v@:
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(doPrint)];
    
    // self class 必须有doPrint方法
//    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:[@"v@:" UTF8String]];
    NSInvocation *forwardInv= [NSInvocation invocationWithMethodSignature:signature];
    [forwardInv setTarget:self];
    [forwardInv setSelector:@selector(doPrint)];
//    [forwardInv setArgument:&invocation atIndex:2];
    [forwardInv invoke];
```


