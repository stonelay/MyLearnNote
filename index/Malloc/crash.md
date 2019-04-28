
## crash

* EXC_BAD_ACCESS
访问一个已经释放的对象，或者向他发送消息时，EXC_BAD_ACCESS就会出现。造成EXC_BAD_ACCESS最常见的原因是，对属性用错了所有权修饰符，这会导致对象被释放。

* SIGSEGV
signal segment fault (段错误) 可能的原因有:
1. 内存溢出， 通常原因是数组越界
2. 堆栈溢出， 超过了最大的栈空间8192K(8M)
3. 文件访问非法， 操作了没有权限的文件

* SIGBUS
1. 硬件问题
2. 没有足够的ram，malloc失败
3. 没有满足数据对齐的要求
4. 访问了无相应内存的区域
```
SIGBUS与SIGSEGV信号的一般差别例如以下: 
1.SIGBUS(Bus error)意味着指针所相应的地址是有效地址，但总线不能正常使用该指针。一般是未对齐的数据訪问所致。 
2.SIGSEGV(Segment fault)意味着指针所相应的地址是无效地址。没有物理内存相应该地址。 
```


总线错误信号(SIGBUS)代表无效内存访问，即访问额内存是一个无效的内存地址。也就是说，那个地址指向的位置根本不是物理内存地址。和SIGSEGV一样，SIGBUS也属于EXC_BAD_ACCESS的子类型。

* EXC_ARITHMETIC
当要除零时，应用会收到EXC_ARITHMETIC信号。这个错误很容易处理。

* SIGILL
SIGILL代表SIGNAL ILLEGAL INSTRUCTION(非法指令信号)。当在处理器上执行非法指令时，它就会发生。执行非法指令是说，将函数指针传给另一个函数时，该函数指针由于某种原因是坏的，指向了一段已经释放了的内存或者一个数据段。

* SIGABRT
SIGABRT代表SIGNAL ABORT(中止信号)。当操作系统发现不安全的情况时，它能够对这种情况进行更多的控制；必要的话，它能要求进程进行清理工作。通常UIKit框架在特定的前提条件没有满足或者一些其他情况出现时候调用C函数abort(由它来发送此信号)。当SIGABRT出现时，控制台通常会输出大量的信息，说明哪里出错。由于SIGABRT是可控制的，所有可以再LLDB控制台上输入bt命令打印出回溯信息。

* 看门狗超时
这种崩溃容易分辨，错误码固定是0x8badf00d，可以读作(Ate Bad Food)。在iOS中，经常出现在执行一个同步网络调用而阻塞主线程的情况。


这个crash 可能原因是
1. 内存不足。 
2. 在前面的程序中出现了内存的越界访问，导致malloc()分配函数所涉及的一些信息被破坏。下次再使用malloc()函数申请内存就会失败，返回空指针NULL(0)。
```
NSMallocException
*** -[NSObject allocWithZone:]: attempt to allocate object of class 'UIButtonLabel' failed
```