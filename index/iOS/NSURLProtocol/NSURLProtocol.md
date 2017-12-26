# NSURLProtocol

通过自定义的NSURLProtocol，我们可以拦截request，做一些事情。

1. 自定义请求和响应 //比如统一 在request前 做些处理
2. 网络的缓存处理   //（H5离线包 和 网络图片缓存）
3. 重定向网络请求
4. 为测试提供数据Mocking功能，在没有网络的情况下使用本地数据返回。
5. 过滤掉一些非法请求
6. 快速进行测试环境的切换
7. 拦截图片加载请求，转为从本地文件加载(也是图片缓存的环节)
8. 可以拦截UIWebView，基于系统的NSURLConnection或者NSURLSession进行封装的网络请求。目前WKWebView无法被NSURLProtocol拦截。

注，当有多个自定义NSURLProtocol注册到系统中的话，会按照他们注册的反向顺序依次调用URL加载流程。当其中有一个NSURLProtocol拦截到请求的话，后续的NSURLProtocol就无法拦截到该请求。
