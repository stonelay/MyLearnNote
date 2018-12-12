
* 主要完成了上下文的建立

* 读取 Mach-O 
动态连接器
从Mach-O中 获取dyld， dyld去初始化运行环境。

* 主程序初始化成ImageLoader对象
主程序和其相关的动态库，最后都被转化成了一个ImageLoader对象
主程序Mach-O文件转变成了一个ImageLoader对象

* 加载共享的系统动态库，
负责将系统中的共享动态库加载进内存空间，比如UIKit就是动态共享库，
这也是不同的App之间能够实现动态库共享的机制。
不同App间访问的共享库最终都映射到了同一块物理内存，从而实现了共享动态库。

* 加载依赖的动态库
生成ImageLoader对象

* 链接动态库
link 操作

* 库的初始化
-- runtime被初始化
从待加载的类列表loadable_classes中寻找对应的类，然后找到@selector(load)的实现并执行。
加载完成，之后执行 类的constructor

* 初始化主程序
返回主程序main()函数地址。