# MockServer

# NSURLProtocol

1. 继承并注册 protocol
```
[NSURLProtocol registerClass:[MyURLProtocol class]];  
```

2. 对于NSURLSession的请求，注册NSURLProtocol的方式稍有不同，是通过NSURLSessionConfiguration注册的:
```
NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];  
NSArray *protocolArray = @[ [MyURLProtocol class] ];  
configuration.protocolClasses = protocolArray;  
NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];  
NSURLSessionTask *task = [session dataTaskWithRequest:request];  
[task resume];

```
所以 在 'OHHTTPStubs' 中 hook 了NSURLSession 的defaultSessionConfiguration 和 ephemeralSessionConfiguration 方法

3. canInitWithRequest 程序入口
若返回YES 才能后续操作

4. 鉴定 request
```
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
	return request;
}
```
一般直接返回 request

5. 判断是否有缓存
requestIsCacheEquivalent:toRequest: 用于判断你的自定义reqeust是否相同，这里返回默认实现即可。它的主要应用场景是某些直接使用缓存而非再次请求网络的地方。
- (NSCachedURLResponse *)cachedResponse;

6. startLoading stopLoading

7. NSURLProtocolClient
通过NSURLProtocolClient 将事件传给 请求的代理。
```
@protocol NSURLProtocolClient <NSObject>

//请求重定向
- (void)URLProtocol:(NSURLProtocol *)protocol wasRedirectedToRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse;

// 响应缓存是否合法
- (void)URLProtocol:(NSURLProtocol *)protocol cachedResponseIsValid:(NSCachedURLResponse *)cachedResponse;

//刚接收到Response信息
- (void)URLProtocol:(NSURLProtocol *)protocol didReceiveResponse:(NSURLResponse *)response cacheStoragePolicy:(NSURLCacheStoragePolicy)policy;

//数据加载成功
- (void)URLProtocol:(NSURLProtocol *)protocol didLoadData:(NSData *)data;

//数据完成加载
- (void)URLProtocolDidFinishLoading:(NSURLProtocol *)protocol;

//数据加载失败
- (void)URLProtocol:(NSURLProtocol *)protocol didFailWithError:(NSError *)error;

//为指定的请求启动验证
- (void)URLProtocol:(NSURLProtocol *)protocol didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

//为指定的请求取消验证
- (void)URLProtocol:(NSURLProtocol *)protocol didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

@end

```