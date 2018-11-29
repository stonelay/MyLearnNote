
## 1.dSYM你是如何分析的？

1.crash报告（.crash文件）
2.符号文件 (.dsymb文件)
3.应用程序文件 (appName.app文件

使用命令行工具atos
自动化分析脚本。

## 2.多线程有哪几种？你更倾向于哪一种？
1.NSThread
优点：NSThread 比其他两个轻量级。
缺点：需要自己管理线程的生命周期，线程同步，线程同步时对数据的加锁会有一定的系统开销。

2.Cocoa NSOperation （使用NSOperation和NSOperationQueue）
3.GCD （Grand Central Dispatch）

