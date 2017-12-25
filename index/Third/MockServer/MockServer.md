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
