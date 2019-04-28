## llvm 
LLVM IR 本身具备定义良好的语义，下面是一个 .ll 文件的简单示例：
```
define i32 @add1(i32 %a, i32 %b) {
entry:
  %tmp1 = add i32 %a, %b
  ret i32 %tmp1
}

define i32 @add2(i32 %a, i32 %b) {
entry:
  %tmp1 = icmp eq i32 %a, 0
  br i1 %tmp1, label %done, label %recurse

recurse:
  %tmp2 = sub i32 %a, 1
  %tmp3 = add i32 %b, 1
  %tmp4 = call i32 @add2(i32 %tmp2, i32 %tmp3)
  ret i32 %tmp4

done:
  ret i32 %b
}
```

这段 IR 对应的 c 代码如下：
```
unsigned add1(unsigned a, unsigned b) {
   return a+b;
 }
 
 unsigned add2(unsigned a, unsigned b) {
   if (a == 0) 
 return b;
   return add2(a-1, b+1);
}
```
从示例可以看出，LLVM IR 是一个 low-level RISC-like 虚拟指令集，支持 add、subtract (减)、compare、branch 指令。支持 label，并且通常看起来像是一种奇怪格式的汇编语言。

与大多数 RISC 指令集不同，LLVM IR 是强类型的，并具有一个简单的类型系统。如：i32 是 32 位整数，而 i32** 是指向 32 位整数的指针的指针。

LLVM IR 抽象了一些机器细节。比如，借助 call 和 ret 指令及其显示参数抽象了调用约定 (call convention)。
LLVM IR 不使用一套固定的命名寄存器，而是使用以 % 字符命名的临时变量 (如：%tmp1、%a、%b)。
LLVM IR 有三种定义形式：上面示例中的文本形式；内存中的数据结构 (做优化时使用)；高效的密集型的磁盘二进制“位代码 (bitcode)”格式。

llvm-as 工具可以将 .ll 文件 (文本形式的 IR) 转换为 .bc 文件 (位代码格式的 IR)。llvm-dis 工具可以将 .bc 文件转换为 .ll 文件。

优化器针对 IR 进行优化，而不用去管前端输入的是何种编程语言，后端生成的是何种目标平台的指令。LLVM IR 在设计时必须考虑到前端能够容易生成 IR，并且支持针对真实的目标平台执行重要的优化。


IR的特点
  引用官方文档对IR的描述: LLVM is a Static Single Assignment (SSA) based representation that provides type safety, low-level operations, flexibility, and the capability of representing ‘all’ high-level languages cleanly. 作为一门语言IR有如下特点: 基于SSA, 类型安全, 提供低层级操作与支持所有高级语言.


