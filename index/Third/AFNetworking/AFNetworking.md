# AFNetworking

## NSURLConnection

```plantuml
class NSOperation

class AFURLConnectionOperation

class AFHTTPRequestOperation

NSOperation <|-- AFURLConnectionOperation
AFURLConnectionOperation <|-- AFHTTPRequestOperation
AFHTTPRequestOperationManager ..>  AFHTTPRequestOperation
```

## AF2.0
2.0 NSURLConnection

1. 有个常驻线程， 使用runloop 线程保活。
2. 以NSOperation 的形式提交， 实现 pause stop cancel 功能。



## AF3.0
3.0 NSURLSession
1. url_session_manager_processing_queue() 是一个 串行队列，所有session 的 task任务的创建都是在这个队列中执行的 包括（NSURLSessionDataTask、NSURLSessionUploadTask、NSURLSessionDownloadTask）
```
@interface NSURLSessionDataTask : NSURLSessionTask
@end
@interface NSURLSessionUploadTask : NSURLSessionDataTask
@end
@interface NSURLSessionDownloadTask : NSURLSessionTask
@end

```
2. 创建task成功后 新建AFURLSessionManagerTaskDelegate 与 task绑定。
task.identifer为key 新建AFURLSessionManagerTaskDelegate 存在mutableTaskDelegatesKeyedByTaskIdentifier map中，
因为map是非线程安全的，所以操作之前加锁。

3. 新建AFURLSessionManagerTaskDelegate 有实现Session的delegate
// 具体看 NSURLSessionDelegate
url_session_manager_processing_queue() 这是用来解析 返回的 response 的 并行队列。
解析完后，提交给completequeue





