## Clang 是如何编译一个函数的
关于Clang、GCC和LLVM的关系，之前有做解释，这里不再赘述。
在学习如何使用LLVM优化函数之前，我觉得有必要清楚Clang是如何编译一个C/C++函数的。这篇文章，不会对Clang做太底层的深入。只是对Clang解析后产生的.ll文件做一些解释。
要知道Clang是编译器编译器的前段，它的功能是，将目标代码依次经过词法分析、语法分析、语义分析生成中间代码。

Clang前段
1. 预处理
2. Lexical Analysis - 词法分析（输出token流）
3. Semantic Analysis - 语法分析（输出(AST)抽象语法树）
4. CodeGen - （Intermediate Representation，简称IR）IR中间代码生成

llvm中段

5. Optimize - 优化IR

llvm后段     

6. LLVM Bitcode - 生成字节码
7. Assemble - 生成Target相关汇编
8. Link生成Executable

举一个功能简单的函数的例子:
```
bool is_sorted(int *a, int n) {
  for (int i = 0; i < n - 1; i++)
    if (a[i] > a[i + 1])
      return false;
  return true;
}
```
因为Clang不做任何编译上的优化，且LLVM IR最初就是为C/C++设计的，所以编译相对来说更为简单。

接下去的内容，都是建立在Clang6.0.1 硬件环境 x86-64的机器上的。
使用命令: 
```
clang++ is_sorted.cpp -O0 -S -emit-llvm
```
以上命令的大致意思是，编译is_sorted.cpp文件，且不进行优化。为了方便阅读和理解，输出的是IR的文本文件。
这里要明白的是，输入IR文本文件只是为了我们学习的时候更容易阅读理解，对于机器来说，二进制显然更轻便易执行。

执行命令后，得到IR 的[文本文件](https://github.com/stonelay/MyLearnNote/blob/master/index/翻译/0)
开头四行是这样描述的
```
; ModuleID = 'is_sorted.cpp'
source_filename = "is_sorted.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"
```
第一行表示一个模块，LLVM中模块是最基本的编译单元，是代码和数据的容器。想要理解模块，可以参考[LLVM Bitcode Parase Example](https://github.com/sheredom/llvm_bc_parsing_example), 这个例子涉及到了模块的使用，有助于我们新手对模块的理解。
第二行和本文无关。第三行表示编译参数选项。第四行是和gcc相关的内容，本文也不会深究。

LLVM的函数可选属性
```
; Function Attrs: noinline nounwind optnone uwtable
```
由前段提供，这些属性和代码本身没有关系，是为了后面的优化做的准备。和文件末尾的属性有联系。

回到函数本身
```
define zeroext i1 @_Z9is_sortedPii(i32* %a, i32 %n) #0 {
```
zeroext表示这个函数的返回值，这里是i1,一个 1bit大小的整数（bool值不应该是1字节吗，这里怎么是1bit？），这里的基本数据类型的大小是根据[ABI](https://github.com/stonelay/MyLearnNote/blob/master/index/编译原理/ABI.md)的规则来确定的。
接下来是函数名，不过是经过重整过的，我们依旧能看到原函数的影子@_Z9is_sortedPii。然后是参数列表，数据类型也被修改了，但是我们依旧能识别出来，比如i32，就表示32bit(4字节)的整形，这和我们的源码是对应的。 #0 对应文件末尾的函数。

接下去看这个函数实现内容
```
entry:
  %retval = alloca i1, align 1
  %a.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond
```
每个LLVM指令都必须建立在一个基本实现内，(经验证，哪怕最简单的空的函数，也有一个ret void的实现块)，指令执行，从头部进入，尾部退出，且最后一条指令应该是终结指令。直接退出是不允许的。每个函数有一个除了函数本身的入口。在编译期间，模块验证器还会对某些属性(哪些属性有待验证，还未理解)进行多次检查。有了这个验证器，一些非法的IR，能在调试期间就给出警告。

前四条指令很容易看懂，就是为这四个变量从栈内分配空间。前三个是编译期间创建的隐式的变量（就是入参int *a, int n, 返回的bool）。第4个用于循环变量(for 循环中的int i)。这样的储存分配只能使用load及store指令访问（为什么？）。接下去的三个指令，把传入的两个参数初始化为a.addr和n.addr，变量i初始化为0。返回值不需要初始化，（因为这个demo中的返回值并没有参与到计算中来），但大多数这些不必要的跳转可以被LLVM后端消除。

这里有个问题，明明入参已经有值了，为什么Clang还要为a和n分配内存空间呢，直接使用是不是更好（减少不必要的内存浪费）？
在变量a与n不被改变的时候，这么做完全是可行的，但是如果会被改变呢？也就是说分两种情况，值会变和不会变，在会变的时候这么做没问题，在不会变的时候则可以优化这部分空间（事实上，前面提到过，现在的ll文件是没做优化的，这里其实在后面的确会被优化掉）。
为什么Clang不直接产生优化后的代码，而是后面再去优化呢。我认为原因有很多，第一，Clang专注做前段，后面的优化由llvm中段完成，符合llvm的框架流程（易扩展和维护）。第二，编译器分段处理，使得没部分的处理和表达更高效。 第三，生成内存操作，然后马上优化掉其中的大部分，尽管看起来很做了很多，但这对编译器的性能影响很小。

在分析接下去的指令的时候，我们要明白的是，一个最简单的for循环会被clang如何解析。
举个例子
```
for (initializer; condition; modifier) {
  body
}
```
它会被翻译为
```
initializer
  goto COND
COND:
  if (condition)
    goto BODY
  else
    goto EXIT
BODY:
  body
  modifier
  goto COND
EXIT:
```
不局限于Clang，所有的C/C++编译器都会这么翻译，他们的结果是一样的。
这里有几个块，分别是 cond,body
Clang 分别翻译他们，结果为
```
for.cond:                                 ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 %1, 1
  %cmp = icmp slt i32 %0, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:
  %2 = load i32*, i32** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32*, i32** %a.addr, align 8
  %6 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, 1
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %idxprom1
  %7 = load i32, i32* %arrayidx2, align 4
  %cmp3 = icmp sgt i32 %4, %7
  br i1 %cmp3, label %if.then, label %if.end
```
cond 很简单，就是i依次递减后，和n进行比较，根据比较结果判断跳转到body还是end。
body 第三行的意思是 将i拓宽到64位，以便参与地址计算（不是很明白，拓宽64位，是数据类型强制转换的意思吗）






qqq
