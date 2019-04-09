# Block part

## block 
Block_private.h文件中对block的相关结构体的真实定义：

```objc
/* Revised new layout. */
struct Block_descriptor {
    unsigned long int reserved;         // 预留变量
    unsigned long int size;
    void (*copy)(void *dst, void *src); //辅助拷贝，处理block范围外的变量时使用
    void (*dispose)(void *);            //销毁函数，处理block范围外的变量时使用
};

struct Block_layout {
    void *isa;  // 所有对象都有该指针，用于实现对象相关的功能。
    int flags;  // 标志变量，在实现block的内部操作时会用到
    int reserved; // 保留变量
    void (*invoke)(void *, ...); // 函数指针，指向 block的实现代码, 也可以说是函数调用地址。
    struct Block_descriptor *descriptor; // 表示该 block的附加描述信息，主要是 size，以及 copy和 dispose函数的指针。这两个辅助函数在拷贝及丢弃块对象时运行, 其中会执行一些操作, 比方说, 前者要保留捕获的对象,而后者则将之释放。
    /* Imported variables. */
    // 捕获的变量，block能够访问它外部的局部变量，就是因为将这些变量复制到了结构体中。
};
// block就是一个里面存储了指向函数体中包含定义block时的代码块的函数指针，以及block外部上下文变量等信息的结构体。

// 捕获并要修改的变量
struct __Block_byref_a_0 {
    void *__isa;
    __Block_byref_a_0 *__forwarding;
    int __flags;
    int __size;
    int a;
};

struct __ViewController__capture__blockVariable_block_impl_0 {
  struct __block_impl impl;
  struct __ViewController__capture__blockVariable_block_desc_0* Desc;
  __Block_byref_a_0 *a; // by ref
  __ViewController__capture__blockVariable_block_impl_0(void *fp, struct __ViewController__capture__blockVariable_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};

```

## pre 
首先 需要清楚

1. 栈区（stack） 
程序自动分配和释放，一般来是存放参数，局部变量。
优点: 由系统自动分配，速度较快，不会产生内存碎片

2. 堆区 (heap)
程序员分配和释放，是由alloc分配的内存，一般速度比较慢，而且容易产生内存碎片,不过用起来最方便.
优点: 灵活方便，数据适应面广泛，但是效率有一定降低。

3. 常量区
常量存储区。

4. 全局（静态）区
存放程序静态分配的变量和全局变量。

5. 代码区
可执行程序在内存种的镜像。 只读，不可修改。

```

int intValue = 123; // 全局（静态）区
static NSString *aString = @"mString";// 全局（静态初始化）区

@implementation 
{
    int intValue;//栈
    NSString *tmpName = @"aName";// tmpName 栈区  "aName" 常量区
}
@end

```

## block 种类
block其实是有类型的, 且一共有3种类型, 全局块, 栈块, 堆块:
1. __NSGlobalBlock__: 存储在全局/静态的 block，不会捕获任何外部变量。
2. __NSStackBlock__: 存储在栈中的 block，当函数返回时会被销毁。
3. __NSMallocBlock__: 存储在堆中的 block，当引用计数为0时会被销毁。

1. _NSConcreteStackBlock：
只用到外部局部变量、成员属性变量，且没有强指针引用的block都是StackBlock。
StackBlock的生命周期由系统控制的，一旦返回之后，就被系统销毁了。
```
_block int temp;
NSLog(@"statck block %@", ^ {
        NSLog(@"%d", temp);
    });
```
2. _NSConcreteMallocBlock：
有强指针引用或copy修饰的成员属性引用的block会被复制一份到堆中成为MallocBlock，没有强指针引用即销毁，生命周期由程序员控制
```
// arc 下， block 只要有赋值操作， 都会copy
block = ^ {
        NSLog(@"%d", temp);
    };
```
3. _NSConcreteGlobalBlock：
不捕获外部变量
```
void (^block)(void) = ^{
        NSLog(@"GlobalBlock内部");               // 全局静态区
    };
```

没有用到外界变量或只用到全局变量、静态变量的block为_NSConcreteGlobalBlock，生命周期从创建到应用程序结束。

## Block中__block实现原理
在Block中改变变量值有2种方式
1. 是传递内存地址指针到Block中
2. 是改变存储区方式(__block)。

* 首先 全局变量 和 静态全局变量 的值增加，以及它们被Block捕获进去，这一点很好理解，因为是全局的，作用域很广，所以Block捕获了它们进去之后，在Block里面进行++操作，Block结束之后，它们的值依旧可以得以保存下来。
* 静态变量 传递给Block是内存地址值，所以能在Block里面直接改变值。

## 局部变量
* 局部变量的值，被copy进了Block，不带__block的自动变量只能在里面被访问，并不能改变值。
* 带__block的自动变量 和 静态变量 就是直接地址访问。所以在Block里面可以直接改变变量的值。

局部变量能直接访问地址的原因是，\__block封装成结构体 拷贝到 block 堆上，\__forwarding 指针指向堆上的__block结构体

