# Http缓存

## NSURLCache
NSURLCache 是官方推荐的cache， 可以使用NSURLCache满足基本需求。
使用方法:

```objc
/**
* NSURLCache 设置
**/
// 设置网络缓存 － 4M 的内存缓存 20M 的磁盘缓存，使用默认的缓存路径 Caches/bundleId
NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
// 设置全局缓存
[NSURLCache setSharedURLCache:cache];

/**
* 若有缓存
**/
httpResponse.statusCode == 304
//"加载本地缓存图片"
//如果是，使用本地缓存
// 根据请求获取到`被缓存的响应`！
NSCachedURLResponse *cacheResponse =  [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
// 拿到缓存的数据
data = cacheResponse.data;

```

## 自定 的缓存策略 通过拦截NSURLProtocol
已有的框架 有RNCachingURLProtocol
基本策略 是通过 NSURLProtocol，需要缓存的话，存到文件系统NSCachesDirectory。

和 我想的需求不太一样， 这个库的作用是， 在有网络的情况下，不会载入已经缓存的数据，都会强制请求新的数据。 只有在无网络的情况下，才会查看已经缓存的。 若没有缓存 返回错误“NSURLErrorCannotConnectToHost”