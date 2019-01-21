1、什么是Keep-Alive模式? 
我们知道HTTP协议采用“请求-应答”模式,当使用普通模式,即非KeepAlive模式时,每个请求/应答客户和服务器都要新建一个连接,完成之后立即断开连接(HTTP协议为无连接的协议);当使用Keep-Alive模式(又称持久连接、连接重用)时,Keep-Alive功能使客户端到服务器端的连接持续有效,当出现对服务器的后继请求时,Keep-Alive功能避免了建立或者重新建立连接。

HTTP Keep-Alive模式_HTML/CSS

http 1.0中默认是关闭的,需要在http头加入”Connection: Keep-Alive”,才能启用Keep-Alive;http 1.1中默认启用Keep-Alive,如果加入”Connection: close “,才关闭。目前大部分浏览器都是用http1.1协议,也就是说默认都会发起Keep-Alive的连接请求了,所以是否能完成一个完整的Keep-Alive连接就看服务器设置情况。

2、启用Keep-Alive的优点 
从上面的分析来看,启用Keep-Alive模式肯定更高效,性能更高。因为避免了建立/释放连接的开销。下面是RFC 2616上的总结:
By opening and closing fewer TCP connections, CPU time is saved in routers and hosts (clients, servers, proxies, gateways, tunnels, or caches), and memory used for TCP protocol control blocks can be saved in hosts. 
HTTP requests and responses can be pipelined on a connection. Pipelining allows a client to make multiple requests without waiting for each response, allowing a single TCP connection to be used much more efficiently, with much lower elapsed time. 
Network congestion is reduced by reducing the number of packets caused by TCP opens, and by allowing TCP sufficient time to determine the congestion state of the network. 
Latency on subsequent requests is reduced since there is no time spent in TCP’s connection opening handshake. 
HTTP can evolve more gracefully, since errors can be reported without the penalty of closing the TCP connection. Clients using     future versions of HTTP might optimistically try a new feature, but if communicating with an older server, retry with old   semantics after an error is reported.
RFC 2616(P47)还指出:单用户客户端与任何服务器或代理之间的连接数不应该超过2个。一个代理与其它服务器或代码之间应该使用超过2 * N的活跃并发连接。这是为了提高HTTP响应时间,避免拥塞(冗余的连接并不能代码执行性能的提升)。

3、回到我们的问题(即如何判断消息内容/长度的大小?) 
Keep-Alive模式,客户端如何判断请求所得到的响应数据已经接收完成(或者说如何知道服务器已经发生完了数据)?我们已经知道了,Keep-Alive模式发送玩数据HTTP服务器不会自动断开连接,所有不能再使用返回EOF(-1)来判断(当然你一定要这样使用也没有办法,可以想象那效率是何等的低)!下面我介绍两种来判断方法。

3.1、使用消息首部字段Conent-Length 
故名思意,Conent-Length表示实体内容长度,客户端(服务器)可以根据这个值来判断数据是否接收完成。但是如果消息中没有Conent-Length,那该如何来判断呢?又在什么情况下会没有Conent-Length呢?请继续往下看……

3.2、使用消息首部字段Transfer-Encoding 
当客户端向服务器请求一个静态页面或者一张图片时,服务器可以很清楚的知道内容大小,然后通过Content-length消息首部字段告诉客户端需要接收多少数据。但是如果是动态页面等时,服务器是不可能预先知道内容大小,这时就可以使用Transfer-Encoding:chunk模式来传输数据了。即如果要一边产生数据,一边发给客户端,服务器就需要使用”Transfer-Encoding: chunked”这样的方式来代替Content-Length。

chunk编码将数据分成一块一块的发生。Chunked编码将使用若干个Chunk串连而成,由一个标明长度为0的chunk标示结束。每个Chunk分为头部和正文两部分,头部内容指定正文的字符总数(十六进制的数字)和数量单位(一般不写),正文部分就是指定长度的实际内容,两部分之间用回车换行(CRLF)隔开。在最后一个长度为0的Chunk中的内容是称为footer的内容,是一些附加的Header信息(通常可以直接忽略)。