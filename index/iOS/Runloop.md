1.runloop是什么／runloop的概念？

Run loops是线程相关的的基础框架的一部分。一个run loop就是一个事件处理的循环，用来不停的调度工作以及处理输入事件。其实内部就是do－while循环，这个循环内部不断地处理各种任务（比 如Source，Timer，Observer）。使用run loop的目的是让你的线程在有工作的时候忙于工作，而没工作的时候处于休眠状态。

2.