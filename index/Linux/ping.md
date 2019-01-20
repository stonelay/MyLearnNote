# ping 命令的实现

ping命令是用来查看网络上另一个主机系统的网络连接是否正常的一个工具。ping命令的工作原理是：
向网络上的另一个主机系统发送ICMP报文，如果指定系统得到了报文，它将把报文一模一样地传回给发送者。

## iOS 的 networking
SCNetworkReachabilityContext

wifi、域名、具体ip
实现应该 就是 向 wifi 的情况下，发的路由器 ping。