# Tips

# 赋值语句

```C
//赋值语句是有返回值的， 返回值是 所赋的值。
 a = 1;

//  所以就有了
 a = b = 1;

 while((currentClass = class_getSuperclass(currentClass)) {
     print("have super class");
 }

 ```


 # volatile
volatile 提醒编译器它后面所定义的变量随时都有可能改变，因此编译后的程序每次需要存储或读取这个变量的时候，都会直接从变量地址中读取数据。如果没有volatile关键字，则编译器可能优化读取和存储，可能暂时使用寄存器中的值，如果这个变量由别的程序更新了的话，将出现不一致的现象。

# 应该使用FOUNDATION_EXPORT还是#define来定义常量?

一般iOS我们定义常量的方法有两种,来看下面例子
我的.h文件

FOUNDATION_EXPORT NSString * const kMyConstantString;  
FOUNDATION_EXPORT NSString * const kMyConstantString2;
.m文件是这样定义的

NSString * const kMyConstantString = @"Hello";
NSString * const kMyConstantString2 = @"World";

还有一种是常用的#define方法了

#define kMyConstantString @"Hello"

有什么区别呢?
使用第一种方法在检测字符串的值是否相等的时候更快.对于第一种你可以直接使用(stringInstance == MyFirstConstant)来比较,而define则使用的是这种.([stringInstance isEqualToString:MyFirstConstant])
哪个效率高,显而易见了.第一种直接比较的是指针地址,而第二个则是一一比较字符串的每一个字符是否相等.

同理 其他基本数据类型