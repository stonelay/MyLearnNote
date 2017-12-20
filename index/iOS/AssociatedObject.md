# AssociatedObject part

## 使用

1. 为现有的类添加私有变量；// 较常用
2. 为 KVO 创建一个关联的观察者。

```
void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
id objc_getAssociatedObject(id object, const void *key);
void objc_removeAssociatedObjects(id object);

@interface ViewController (AssociatedObjects)

@property (assign, nonatomic) NSString *associatedObject_assign;
@property (strong, nonatomic) NSString *associatedObject_retain;
@property (copy,   nonatomic) NSString *associatedObject_copy;

@end

@implementation ViewController (AssociatedObjects)

- (NSString *)associatedObject_assign {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_assign:(NSString *)associatedObject_assign {
    objc_setAssociatedObject(self, @selector(associatedObject_assign), associatedObject_assign, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)associatedObject_retain {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_retain:(NSString *)associatedObject_retain {
    objc_setAssociatedObject(self, @selector(associatedObject_retain), associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)associatedObject_copy {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAssociatedObject_copy:(NSString *)associatedObject_copy {
    objc_setAssociatedObject(self, @selector(associatedObject_copy), associatedObject_copy, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

```

## 实现原理
 * AssociationsManager 维护一个从 spinlock_t 锁到 AssociationsHashMap 哈希表的单例键值对映射；

 * AssociationsHashMap  // 对象地址 --> ObjectAssociationMap  // 所以，每个对象都有一个ObjectAssociationMap来保存自己的关联对象

 * ObjectAssociationMap // key --> ObjcAssociation // key就是objc_setAssociatedObject时传入的key，这里的key只要是唯一的就可以，所以通常可以传入 void 类型的指针。
 // 至于为什么能用cmd关键词指定key，是因为cmd关键词返回的是当前方法的SEL，在一个对象中 不能存在相同 名称的 方法名， 所以key 也是唯一的。

 * ObjcAssociation      // {_policy 表示关联策略，_value 表示关联对象。}  

 * 有_policy关联策略， 和属性一样，在没有对象持有时， 释放。（并不是  objc_removeAssociatedObjects 才会调用）。

 ## 释放
和属性一样，在没有对象持有时， 释放。（并不是  objc_removeAssociatedObjects 才会调用）

objc_removeAssociatedObjects 在关联对象释放时会调用，所有被关联的对象都会从存储哈希表中clean，持有数量减1；

## other
* 关联对象与被关联对象本身的存储并没有直接的关系，它是存储在单独的哈希表中的；
* 需要注意的是， 如果category中的一个关联对象与Class中的某个成员同名，会直接覆盖之前的成员。（相当于重写 get set，但属性还在）



