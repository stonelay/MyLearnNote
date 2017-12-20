# Cache

## 磁盘缓存

磁盘缓存实现 大致分三类：基于文件读写、基于 mmap 文件内存映射、基于数据库。

1. 基于文件读写 FileManager
2. mongdb 数据定时flush
3. 数据库sqlite
