
# load dylibs image
在每个动态库的加载过程中， dyld需要：
1. 分析所依赖的动态库
2. 找到动态库的mach-o文件
3. 打开文件
4. 验证文件
5. 在系统核心注册文件签名
6. 对动态库的每一个segment调用mmap()
通常的，一个App需要加载100到400个dylibs， 但是其中的系统库被优化，可以很快的加载。
针对这一步骤的优化有：
1. 减少非系统库的依赖
2. 合并非系统库
3. 使用静态资源，比如把代码加入主程序

# rebase/bind
由于ASLR(address space layout randomization)的存在，可执行文件和动态链接库在虚拟内存中的加载地址每次启动都不固定，所以需要这2步来修复镜像中的资源指针，来指向正确的地址。
rebase修复的是指向当前镜像内部的资源指针；
而bind指向的是镜像外部的资源指针。
rebase步骤先进行，需要把镜像读入内存，并以page为单位进行加密验证，保证不会被篡改，所以这一步的瓶颈在IO。
bind在其后进行，由于要查询符号表，来指向跨镜像的资源，加上在rebase阶段，镜像已被读入和加密验证，所以这一步的瓶颈在于CPU计算。
//通过命令行可以查看相关的资源指针:
xcrun dyldinfo -rebase -bind -lazy_bind myApp.App/myApp

优化该阶段的关键在于减少__DATA segment中的指针数量。
可以优化的点有：
1.减少Objc类数量， 减少selector数量
2.减少C++虚函数数量
3.转而使用swift stuct（其实本质上就是为了减少符号的数量）
3.Objc setup
这一步主要工作是:
1.注册Objc类 (class registration)
2.把category的定义插入方法列表 (category registration)
3.保证每一个selector唯一 (selctor uniquing)
4.由于之前2步骤的优化，这一步实际上没有什么可做的。
4.initializers
以上三步属于静态调整(fix-up)，都是在修改__DATA segment中的内容，而这里则开始动态调整，开始在堆和堆栈中写入内容。 在这里的工作有：
1.Objc的+load()函数
2.C++的构造函数属性函数 形如attribute((constructor)) void DoSomeInitializationWork()
3.非基本类型的C++静态全局变量的创建(通常是类或结构体)(non-trivial initializer) 比如一个全局静态结构体的构建，如果在构造函数中有繁重的工作，那么会拖慢启动速度
Objc的load函数和C++的静态构造函数采用由底向上的方式执行，来保证每个执行的方法，都可以找到所依赖的动态库。
1).dyld 开始将程序二进制文件初始化
2).交由 ImageLoader 读取 image，其中包含了我们的类、方法等各种符号
3).由于 runtime 向 dyld 绑定了回调，当 image 加载到内存后，dyld 会通知 runtime 进行处理
4).runtime 接手后调用 mapimages 做解析和处理，接下来 loadimages 中调用 callloadmethods 方法，遍历所有加载进来的 Class，按继承层级依次调用 Class 的 +load 方法和其 Category 的 +load 方法
至此
至此，可执行文件中和动态库所有的符号(Class，Protocol，Selector，IMP，…)都已经按格式成功加载到内存中，被 runtime 所管理，再这之后，runtime 的那些方法(动态添加 Class、swizzle 等等才能生效)。
整个事件由 dyld 主导，完成运行环境的初始化后，配合 ImageLoader 将二进制文件按格式加载到内存， 动态链接依赖库，并由 runtime 负责加载成 objc 定义的结构，所有初始化工作结束后，dyld 调用真正的 main 函数。
