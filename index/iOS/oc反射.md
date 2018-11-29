
### 反射

```
Class class = NSClassFromString(@"MClassName");
MClassName *mClass = [[class alloc] init];
SEL selector = NSSelectorFromString(@"getDataList");
[mClass performSelector:selector];
```