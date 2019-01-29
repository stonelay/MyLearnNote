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
    void *isa;
    int flags;  //标志变量，在实现block的内部操作时会用到
    int reserved;
    void (*invoke)(void *, ...); //block执行时调用的函数指针，block定义时内部的执行代码都在这个函数中
    struct Block_descriptor *descriptor;
    /* Imported variables. */
};

// block就是一个里面存储了指向函数体中包含定义block时的代码块的函数指针，以及block外部上下文变量等信息的结构体。

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

## block 解除循环引用
不是所有的都需要解， 要开是那个对象持有的block，若不被self持有， 就不需要