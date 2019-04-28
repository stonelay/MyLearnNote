### libc++ 介绍
libc++ 是由 Apple 公司为其 Mac OS X 平台专门开发的一个 C++ 标准库，其是针对 Clang 而开发完成的，包含了对 C++11 的完整支持，可以作为 Clang 的“御用” C++ 库。libc++ 作为另一个 C++ 标准的实现（传统的是 libstdc++），其与 Clang 的关系就像 libstdc++ 和 GCC 之间的关系一样。但是由于 Apple 公司向来喜欢走不兼容的路线，它在最新版的 Max OS X 中没有提供最新版的 libstdc++ 库（支持 C++11），如果需要使用 libstdc++ 库的话我们必须手动编译安装。
需要注意的是，按照上述流程安装完 LLVM + Clang 之后，默认是没有安装 libc++ 的，但 Clang 也可以用 libstdc++，所以执行 clang++ --std=c++11 main.cpp 就可以编译 C++11 的源码。
