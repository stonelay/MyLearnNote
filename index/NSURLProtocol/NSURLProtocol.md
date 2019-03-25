
### +canonicalRequestForRequest:
对request 格式化， 或做一些似有的处理

### -startLoading
不要在这个方法所在的线程里做任何同步阻塞的操作
执行完后 这个线程将 注销
所以不应该把回调 放在这里