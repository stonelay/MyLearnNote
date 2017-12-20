# WebImage

## 图片加载的工作流

概括来说，从磁盘中加载一张图片，并将它显示到屏幕上，中间的主要工作流如下：

1.假设我们使用 +imageWithContentsOfFile: 方法从磁盘中加载一张图片，这个时候的图片并没有解压缩；

2.然后将生成的 UIImage 赋值给 UIImageView ；

3.接着一个隐式的 CATransaction 捕获到了 UIImageView 图层树的变化；

4.在主线程的下一个 run loop 到来时，Core Animation 提交了这个隐式的 transaction ，这个过程可能会对图片进行 copy 操作，而受图片是否字节对齐等因素的影响，这个 copy 操作可能会涉及以下部分或全部步骤：

分配内存缓冲区用于管理文件 IO 和解压缩操作；（bitmap you need know. width and height. color model）
将文件数据从磁盘读到内存中；
将压缩的图片数据解码成未压缩的位图形式，这是一个非常耗时的 CPU 操作；
最后 Core Animation 使用未压缩的位图数据渲染 UIImageView 的图层。
在上面的步骤中，我们提到了图片的解压缩是一个非常耗时的 CPU 操作，并且它默认是在主线程中执行的。那么当需要加载的图片比较多时，就会对我们应用的响应性造成严重的影响，尤其是在快速滑动的列表上，这个问题会表现得更加突出。

### 存取
SDWebImage 中， 
存的是压缩后的 image
取的时候 在子线程中 解压

### 为什么需要解压缩

JPG,PNG 是压缩的位图， 需要解压缩至位图。 解压缩是 耗时操作，可以在 非主线程上操作。


## SDWebimage 的cache
 使用 了内存cache 和 硬盘cache
 内存 cache 继承了系统的 NSCache
 discache 使用了 文件系统存储
 文件系统存储在小文件的存储上， 没有sqlite 的速度快

需要实现 最近最少使用算法






