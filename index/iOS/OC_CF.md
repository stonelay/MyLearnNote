# CF和OC part

## 引入ARC

引入ARC后 OC对象和CD对象之间的转换

```
// ARC 下
id obj = [[NSObject alloc] init];
void *p = (__bridge void *)obj;
id o = (__bridge id)p;

```

正因为Objective-C是ARC管理的对象，而Core Foundation不是ARC管理的对象，所以才要特意这样转换，这与id类型向void*转换是一个概念。也就是说，当这两种类型（有ARC管理，没有ARC管理）在转换时，需要告诉编译器怎样处理对象的所有权。

* __bridge_transfer

CF -> OC
```
// MRC
// p 变量原先持有对象的所有权
id obj = (id)p;
[obj retain];
[(id)p release];

// ARC
// p 变量原先持有对象的所有权
id obj = (__bridge_transfer id)p;


因为已经用 __bridge_transfer 转移了对象的所有权，所以不需要调用 release

```

* __bridge_retained

OC -> CF
```
// MRC
id obj = [[NSObject alloc] init];
void *p = obj;
[(id)p retain];

// ARC
id obj = [[NSObject alloc] init];
void *p = (__bridge_retained void *)obj;

由于Core Foundation不在ARC管理范围内，所以需要主动release

```

### 总结
1. __bridge:CF和OC对象转化时只涉及对象类型不涉及对象所有权的转化;
2. __bridge_transfer:常用在讲CF对象转换成OC对象时，将CF对象的所有权交给OC对象，此时ARC就能自动管理该内存;
3. __bridge_retained:（与__bridge_transfer相反）常用在将OC对象转换成CF对象时，将OC对象的所有权交给CF对象来管理;

