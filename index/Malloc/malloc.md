

1. [calloc](https://en.cppreference.com/w/c/memory/calloc) 分配内存，把内存清零
1. [malloc](https://en.cppreference.com/w/c/memory/malloc) 分配内存，不把内存清零
1. [realloc](https://en.cppreference.com/w/c/memory/realloc) 从新分配内存，把之前的数据放到新的内存中

malloc()函数分配内存失败的原因： 
1. 内存不足。 
2. 在前面的程序中出现了内存的越界访问，导致malloc()分配函数所涉及的一些信息被破坏。下次再使用malloc()函数申请内存就会失败，返回空指针NULL(0)。