
### Objc

#### 
我们都知道，
平时编写的OC代码，底层实现都是C/C++代码，OC实现的面向对象代码，都是基于C/C++的数据结构实现的。
```
OC --> C/C++ --> 汇编 --> 二进制
```

### 转换 
xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc OC源文件 -o 输出的CPP文件
```
// Implementation 
struct NSObject_IMPL {
    Class isa;
};

// 指向 objc_class 结构体的指针
typedef struct objc_class *Class;
```